/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.view.dokter;

import abpaw.controller.PemesananController;
import abpaw.controller.PemilikController;
import abpaw.controller.ObatController;
import abpaw.controller.PembelianObatController;
import abpaw.model.entity.Pemilik;
import abpaw.model.entity.Dokter;
import abpaw.model.entity.Obat;
import abpaw.model.entity.PembelianObat;
import abpaw.model.entity.PemesananOffline;
import abpaw.model.entity.PemesananOnline;
import abpaw.model.entity.Resep;  
import abpaw.model.entity.DetailResep;  
import abpaw.model.dao.DetailResepDAO; 
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;
import java.util.ArrayList;
import java.math.BigDecimal;

public class UpdateStatusView extends JPanel {

    private Dokter dokter;
    private PemesananController pemesananController;
    private PemilikController pemilikController;
    private JTable tablePemesanan;
    private DefaultTableModel model;
    private JComboBox<String> cbStatusBaru;
    private JButton btnUpdate;
    private JTextField txtBiayaJasa;

    public UpdateStatusView(Dokter dokter) {
        this.dokter = dokter;
        this.pemesananController = new PemesananController();
        this.pemilikController = new PemilikController();
        initComponents();
        loadPemesanan();
    }

    private void initComponents() {
        setLayout(new BorderLayout(10, 10));
        setBorder(new EmptyBorder(10, 10, 10, 10));

        JLabel title = new JLabel("Update Status Pemesanan Pasien", JLabel.CENTER);
        title.setFont(new Font("Arial", Font.BOLD, 16));
        add(title, BorderLayout.NORTH);

        String[] cols = {"No", "Tipe", "Kode Pemesanan", "Pemilik", "Tanggal", "Status", "ID"};
        model = new DefaultTableModel(cols, 0) {
            @Override
            public boolean isCellEditable(int row, int col) {
                return false;
            }
        };
        tablePemesanan = new JTable(model);
        tablePemesanan.getSelectionModel().addListSelectionListener(e -> {
            int row = tablePemesanan.getSelectedRow();
            if (row != -1) {
                String statusSekarang = (String) model.getValueAt(row, 5);
                cbStatusBaru.setSelectedItem(statusSekarang);
            }
        });
        JScrollPane sp = new JScrollPane(tablePemesanan);
        add(sp, BorderLayout.CENTER);

        JPanel bottomPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 10, 10));

        JLabel lblBiayaJasa = new JLabel("Biaya Jasa (Rp):");
        txtBiayaJasa = new JTextField(8);
        txtBiayaJasa.setToolTipText("Isi untuk pemesanan offline");

        bottomPanel.add(lblBiayaJasa);
        bottomPanel.add(txtBiayaJasa);
        bottomPanel.add(new JLabel("Ubah Status Menjadi:"));

        cbStatusBaru = new JComboBox<>(new String[]{"menunggu", "diproses", "selesai", "batal"});

        Color pinkColor = new Color(232, 62, 140);
        btnUpdate = new JButton("Update Status");
        btnUpdate.setBackground(pinkColor);
        btnUpdate.setForeground(Color.WHITE);
        btnUpdate.addActionListener(e -> updateStatus());

        JButton btnBuatResep = new JButton("Buat Resep Offline");
        btnBuatResep.setBackground(new Color(34, 139, 34));
        btnBuatResep.setForeground(Color.WHITE);
        btnBuatResep.addActionListener(e -> buatResepOffline());

        bottomPanel.add(cbStatusBaru);
        bottomPanel.add(btnUpdate);
        bottomPanel.add(btnBuatResep);

        add(bottomPanel, BorderLayout.SOUTH);
    }

    private void loadPemesanan() {
        model.setRowCount(0);
        int counter = 1;

        List<PemesananOnline> onlineList = pemesananController.getPemesananOnlineByDokter(dokter.getIdDokter());
        for (PemesananOnline po : onlineList) {
            String namaPemilik = "Pemilik ID " + po.getIdPemilik();
            Pemilik p = pemilikController.getPemilikById(po.getIdPemilik());
            if (p != null) {
                namaPemilik = p.getNamaPemilik();
            }
            model.addRow(new Object[]{
                counter++, "Online", po.getKodePemesanan(),
                namaPemilik, po.getTanggalKonsultasi(), po.getStatus(), po.getIdTransaksi()
            });
        }

        List<PemesananOffline> offlineList = pemesananController.getPemesananOfflineByDokter(dokter.getIdDokter());
        for (PemesananOffline poff : offlineList) {
            String namaPemilik = "Pemilik ID " + poff.getIdPemilik();
            Pemilik p = pemilikController.getPemilikById(poff.getIdPemilik());
            if (p != null) {
                namaPemilik = p.getNamaPemilik();
            }
            model.addRow(new Object[]{
                counter++, "Offline", poff.getNomorAntrean(),
                namaPemilik, poff.getTanggalAntrean(), poff.getStatus(), poff.getIdTransaksi()
            });
        }

        if (model.getRowCount() > 0) {
            tablePemesanan.getColumnModel().getColumn(6).setMinWidth(0);
            tablePemesanan.getColumnModel().getColumn(6).setMaxWidth(0);
            tablePemesanan.getColumnModel().getColumn(6).setWidth(0);
        }
    }

    private void updateStatus() {
        int row = tablePemesanan.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Pilih pemesanan terlebih dahulu.");
            return;
        }
        int id = (int) model.getValueAt(row, 6);
        String tipe = (String) model.getValueAt(row, 1);
        String statusBaru = (String) cbStatusBaru.getSelectedItem();

        BigDecimal biayaJasa = null;
        if (tipe.equals("Offline")) {
            String biayaStr = txtBiayaJasa.getText().trim();
            if (!biayaStr.isEmpty()) {
                try {
                    biayaJasa = new BigDecimal(biayaStr);
                    if (biayaJasa.compareTo(BigDecimal.ZERO) < 0) {
                        JOptionPane.showMessageDialog(this, "Biaya jasa tidak boleh negatif.");
                        return;
                    }
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(this, "Biaya jasa harus berupa angka.");
                    return;
                }
            }
        }

        boolean success = false;
        if (tipe.equals("Online")) {
            success = pemesananController.updateStatusPemesananOnline(id, statusBaru);
        } else {
            if (biayaJasa != null && biayaJasa.compareTo(BigDecimal.ZERO) > 0) {
                success = pemesananController.updateBiayaJasaOffline(id, biayaJasa);
            }
            if (success || biayaJasa == null) {
                success = pemesananController.updateStatusPemesananOffline(id, statusBaru);
            }
        }

        if (success) {
            JOptionPane.showMessageDialog(this, "Status berhasil diubah menjadi " + statusBaru);
            loadPemesanan();
            txtBiayaJasa.setText("");
        } else {
            JOptionPane.showMessageDialog(this, "Gagal mengubah status.");
        }
    }

    private void buatResepOffline() {
        int row = tablePemesanan.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Pilih pemesanan offline terlebih dahulu.");
            return;
        }
        String tipe = (String) model.getValueAt(row, 1);
        if (!tipe.equals("Offline")) {
            JOptionPane.showMessageDialog(this, "Resep hanya bisa dibuat untuk pemesanan OFFLINE.");
            return;
        }
        int idPemesanan = (int) model.getValueAt(row, 6);
        buatResepDialogOffline(idPemesanan);
    }

     private void buatResepDialogOffline(int idPemesanan) {
        PemesananOffline poff = pemesananController.getPemesananOfflineById(idPemesanan);
        if (poff == null) {
            JOptionPane.showMessageDialog(this, "Data pemesanan tidak ditemukan.");
            return;
        }

        int idPemilik = poff.getIdPemilik();

        JDialog dialog = new JDialog((JFrame) SwingUtilities.getWindowAncestor(this), "Buat Resep Offline", true);
        dialog.setLayout(new BorderLayout());
        dialog.setSize(550, 500);
        dialog.setLocationRelativeTo(this);

        JPanel inputPanel = new JPanel(new GridBagLayout());
        inputPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;

        inputPanel.add(new JLabel("Pilih Obat:"), gbc);
        JComboBox<Obat> cbObat = new JComboBox<>();
        ObatController obatController = new ObatController();
        for (Obat o : obatController.getAllObat()) {
            cbObat.addItem(o);
        }
        gbc.gridx = 1;
        inputPanel.add(cbObat, gbc);

        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(new JLabel("Takaran (contoh: 2x1 sehari):"), gbc);
        JTextField txtTakaran = new JTextField(15);
        gbc.gridx = 1;
        inputPanel.add(txtTakaran, gbc);

        gbc.gridy++;
        gbc.gridx = 0;
        inputPanel.add(new JLabel("Jumlah:"), gbc);
        JTextField txtJumlah = new JTextField(5);
        gbc.gridx = 1;
        inputPanel.add(txtJumlah, gbc);

        JButton btnTambah = new JButton("+ Tambah ke Daftar");
        btnTambah.setBackground(new Color(0, 102, 204));
        btnTambah.setForeground(Color.WHITE);
        gbc.gridy++;
        gbc.gridx = 0;
        gbc.gridwidth = 2;
        inputPanel.add(btnTambah, gbc);

        String[] cols = {"ID Obat", "Nama Obat", "Takaran", "Jumlah", "Harga", "Subtotal"};
        DefaultTableModel modelObat = new DefaultTableModel(cols, 0);
        JTable tableObat = new JTable(modelObat);
        // Sembunyikan kolom ID Obat
        tableObat.getColumnModel().getColumn(0).setMinWidth(0);
        tableObat.getColumnModel().getColumn(0).setMaxWidth(0);
        tableObat.getColumnModel().getColumn(0).setWidth(0);

        JScrollPane spTable = new JScrollPane(tableObat);
        spTable.setBorder(BorderFactory.createTitledBorder("Daftar Obat yang Diresepkan"));
        spTable.setPreferredSize(new Dimension(500, 200));

        JPanel bottomPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        JButton btnSimpan = new JButton("Simpan Resep");
        btnSimpan.setBackground(new Color(34, 139, 34));
        btnSimpan.setForeground(Color.WHITE);
        bottomPanel.add(btnSimpan);

        dialog.add(inputPanel, BorderLayout.NORTH);
        dialog.add(spTable, BorderLayout.CENTER);
        dialog.add(bottomPanel, BorderLayout.SOUTH);

        List<Object[]> tempList = new ArrayList<>();

        btnTambah.addActionListener(e -> {
            Obat selected = (Obat) cbObat.getSelectedItem();
            if (selected == null) {
                JOptionPane.showMessageDialog(dialog, "Pilih obat.");
                return;
            }
            String takaran = txtTakaran.getText().trim();
            if (takaran.isEmpty()) {
                JOptionPane.showMessageDialog(dialog, "Masukkan takaran.");
                return;
            }
            int jumlah;
            try {
                jumlah = Integer.parseInt(txtJumlah.getText().trim());
                if (jumlah <= 0) throw new NumberFormatException();
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(dialog, "Jumlah harus angka positif.");
                return;
            }
            BigDecimal subtotal = selected.getHarga().multiply(BigDecimal.valueOf(jumlah));
            modelObat.addRow(new Object[]{
                selected.getIdObat(), selected.getNamaObat(), takaran, jumlah, "Rp " + selected.getHarga(), "Rp " + subtotal
            });
            tempList.add(new Object[]{selected.getIdObat(), takaran, jumlah, selected.getHarga()});
            txtTakaran.setText("");
            txtJumlah.setText("");
            cbObat.requestFocus();
        });

        btnSimpan.addActionListener(e -> {
            if (tempList.isEmpty()) {
                JOptionPane.showMessageDialog(dialog, "Tambahkan minimal 1 obat.");
                return;
            }

            // ====== SIMPAN KE TABEL RESEP ======
            ResepController resepController = new ResepController();
            Resep resep = new Resep();
            resep.setIdPemesanan(idPemesanan);
            resep.setTipePemesanan("Offline");
            resep.setIdDokter(dokter.getIdDokter());
            resep.setTanggalResep(java.sql.Date.valueOf(java.time.LocalDate.now()));
            resep.setStatus("belum_diproses");

            // Convert tempList ke Vector untuk createResep
            java.util.Vector<Object> dataVector = new java.util.Vector<>();
            for (Object[] item : tempList) {
                java.util.Vector<Object> row = new java.util.Vector<>();
                row.add(item[0]); // idObat
                row.add(""); // namaObat (tidak dipakai)
                row.add(item[1]); // takaran
                row.add(item[2]); // jumlah
                dataVector.add(row);
            }

            boolean success = resepController.createResep(resep, dataVector);

            if (success) {
                JOptionPane.showMessageDialog(dialog, "Resep berhasil disimpan!\nPemilik dapat mengambil obat melalui menu Resep Saya.");
                dialog.dispose();
            } else {
                JOptionPane.showMessageDialog(dialog, "Gagal menyimpan resep. Silakan coba lagi.");
            }
        });

        dialog.setVisible(true);
    }
}
