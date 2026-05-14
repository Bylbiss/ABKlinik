package abpaw.view.pemilik;

import abpaw.controller.ObatController;
import abpaw.controller.ResepController;
import abpaw.model.entity.Obat;
import abpaw.model.entity.Pemilik;
import abpaw.model.entity.Resep;
import abpaw.view.components.RoundedPanel;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

public class ObatView extends JPanel {
    private Pemilik pemilik;
    private ObatController obatController;
    private ResepController resepController;
    
    // Komponen untuk daftar obat (card)
    private JPanel cardContainer;
    private JTextField searchField;
    private List<Obat> semuaObat;
    
    // Tabel resep
    private JTable tableResep;
    private DefaultTableModel resepModel;
    
    public ObatView(Pemilik pemilik) {
        this.pemilik = pemilik;
        this.obatController = new ObatController();
        this.resepController = new ResepController();
        initComponents();
        loadObat();
        loadResep();
    }
    
    private void initComponents() {
        setLayout(new BorderLayout(10, 10));
        setBorder(new EmptyBorder(10, 10, 10, 10));
        
        JTabbedPane tabbedPane = new JTabbedPane();
        
        // ========== TAB BELI OBAT (Card Layout) ==========
        JPanel beliPanel = new JPanel(new BorderLayout(10, 10));
        beliPanel.setBackground(Color.WHITE);
        
        // Panel pencarian
        JPanel searchPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 5));
        searchPanel.setBackground(Color.WHITE);
        searchPanel.add(new JLabel("Cari Obat:"));
        searchField = new JTextField(20);
        JButton searchBtn = new JButton("Cari");
        searchBtn.addActionListener(e -> filterObat());
        searchField.addActionListener(e -> filterObat());
        searchPanel.add(searchField);
        searchPanel.add(searchBtn);
        beliPanel.add(searchPanel, BorderLayout.NORTH);
        
        // Container untuk card-card obat (scroll)
        cardContainer = new JPanel();
        cardContainer.setLayout(new BoxLayout(cardContainer, BoxLayout.Y_AXIS));
        cardContainer.setBackground(Color.WHITE);
        JScrollPane scrollPane = new JScrollPane(cardContainer);
        scrollPane.setBorder(BorderFactory.createTitledBorder("Daftar Obat"));
        scrollPane.getVerticalScrollBar().setUnitIncrement(16);
        beliPanel.add(scrollPane, BorderLayout.CENTER);
        
        tabbedPane.addTab("Beli Obat", beliPanel);
        
        // ========== TAB RESEP SAYA (Tabel) ==========
        JPanel resepPanel = new JPanel(new BorderLayout(5, 5));
        String[] colsResep = {"ID Resep", "Dokter", "Tgl Resep", "Status"};
        resepModel = new DefaultTableModel(colsResep, 0) {
            @Override
            public boolean isCellEditable(int row, int col) { return false; }
        };
        tableResep = new JTable(resepModel);
        JScrollPane spResep = new JScrollPane(tableResep);
        JButton btnDetail = new JButton("Lihat Detail / Ambil Obat");
        btnDetail.addActionListener(e -> detailResep());
        resepPanel.add(spResep, BorderLayout.CENTER);
        resepPanel.add(btnDetail, BorderLayout.SOUTH);
        tabbedPane.addTab("Resep Saya", resepPanel);
        
        add(tabbedPane, BorderLayout.CENTER);
    }
    
    private void loadObat() {
        semuaObat = obatController.getAllObat();
        filterObat(); // menampilkan semua
    }
    
    private void filterObat() {
        String keyword = searchField.getText().trim().toLowerCase();
        List<Obat> filtered = semuaObat;
        if (!keyword.isEmpty()) {
            filtered = semuaObat.stream()
                    .filter(o -> o.getNamaObat().toLowerCase().contains(keyword))
                    .collect(Collectors.toList());
        }
        tampilkanCardObat(filtered);
    }
    
    private void tampilkanCardObat(List<Obat> obatList) {
        cardContainer.removeAll();
        if (obatList.isEmpty()) {
            cardContainer.add(new JLabel("Tidak ada obat ditemukan."));
        } else {
            for (Obat o : obatList) {
                cardContainer.add(createObatCard(o));
                cardContainer.add(Box.createVerticalStrut(10));
            }
        }
        cardContainer.revalidate();
        cardContainer.repaint();
    }
    
    private JPanel createObatCard(Obat obat) {
        RoundedPanel card = new RoundedPanel(15);
        card.setBackground(Color.WHITE);
        card.setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY, 1));
        card.setLayout(new BorderLayout(10, 5));
        card.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        // Nama Obat (atas)
        JLabel nameLabel = new JLabel(obat.getNamaObat());
        nameLabel.setFont(new Font("Arial", Font.BOLD, 16));
        nameLabel.setForeground(new Color(0, 51, 102));
        
        // Detail: deskripsi, bentuk, harga
        String deskripsi = obat.getDeskripsiObat() != null ? obat.getDeskripsiObat() : "-";
        String bentuk = obat.getBentukObat() != null ? obat.getBentukObat() : "-";
        String harga = "Rp " + obat.getHarga();
        String perluResep = obat.isPerluResep() ? " (Perlu Resep)" : "";
        
        JTextArea detailArea = new JTextArea();
        detailArea.setEditable(false);
        detailArea.setWrapStyleWord(true);
        detailArea.setLineWrap(true);
        detailArea.setBackground(null);
        detailArea.setFont(new Font("Arial", Font.PLAIN, 12));
        detailArea.setText(deskripsi + "\nBentuk: " + bentuk + "\nHarga: " + harga + "\n" + perluResep);
        
        // Tombol Beli
        JButton beliBtn = new JButton("Beli");
        beliBtn.setBackground(new Color(0, 102, 204));
        beliBtn.setForeground(Color.DARK_GRAY);
        beliBtn.setFocusPainted(false);
        beliBtn.addActionListener(e -> prosesBeliObat(obat));
        
        card.add(nameLabel, BorderLayout.NORTH);
        card.add(detailArea, BorderLayout.CENTER);
        card.add(beliBtn, BorderLayout.EAST);
        
        return card;
    }
    
    private void prosesBeliObat(Obat obat) {
        if (obat.isPerluResep()) {
            JOptionPane.showMessageDialog(this, "Obat ini memerlukan resep dokter. Silakan ambil di tab Resep.");
            return;
        }
        if (obat.getStok() <= 0) {
            JOptionPane.showMessageDialog(this, "Stok obat habis.");
            return;
        }
        String jumlahStr = JOptionPane.showInputDialog(this, "Masukkan jumlah yang akan dibeli (maks " + obat.getStok() + "):", "1");
        if (jumlahStr == null) return;
        int jumlah;
        try {
            jumlah = Integer.parseInt(jumlahStr);
            if (jumlah <= 0) throw new NumberFormatException();
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "Jumlah tidak valid.");
            return;
        }
        if (jumlah > obat.getStok()) {
            JOptionPane.showMessageDialog(this, "Stok tidak mencukupi.");
            return;
        }
        boolean success = obatController.beliObat(obat.getIdObat(), jumlah, pemilik.getIdPemilik());
        if (success) {
            JOptionPane.showMessageDialog(this, "Pembelian berhasil!");
            // Refresh daftar obat
            loadObat();
        } else {
            JOptionPane.showMessageDialog(this, "Gagal melakukan pembelian.");
        }
    }
    
    private void loadResep() {
        resepModel.setRowCount(0);
        List<Resep> resepList = resepController.getResepByPemilik(pemilik.getIdPemilik());
        for (Resep r : resepList) {
            resepModel.addRow(new Object[]{
                r.getIdResep(),
                "Dokter ID " + r.getIdDokter(),
                r.getTanggalResep(),
                r.getStatus()
            });
        }
    }
    
    private void detailResep() {
        int row = tableResep.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Pilih resep terlebih dahulu.");
            return;
        }
        int idResep = (int) resepModel.getValueAt(row, 0);
        JOptionPane.showMessageDialog(this, "Detail resep ID " + idResep + "\nFitur pengambilan obat akan segera hadir.");
    }
}