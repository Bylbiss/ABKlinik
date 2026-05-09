/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.view.pemilik;

import abpaw.controller.PemesananController;
import abpaw.model.entity.PemesananOffline;
import abpaw.model.entity.PemesananOnline;
import abpaw.model.entity.User;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class RiwayatView extends JPanel {
    private User pemilik;
    private PemesananController pemesananController;
    private JTable tableRiwayat;
    private DefaultTableModel model;
    private JComboBox<String> filterStatus;
    
    public RiwayatView(User pemilik) {
        this.pemilik = pemilik;
        this.pemesananController = new PemesananController();
        initComponents();
        loadRiwayat();
    }
    
    private void initComponents() {
        setLayout(new BorderLayout(10, 10));
        setBorder(new EmptyBorder(10, 10, 10, 10));
        
        JPanel topPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        topPanel.add(new JLabel("Filter Status:"));
        filterStatus = new JComboBox<>(new String[]{"Semua", "menunggu", "sudah bayar", "selesai", "batal"});
        filterStatus.addActionListener(e -> loadRiwayat());
        topPanel.add(filterStatus);
        add(topPanel, BorderLayout.NORTH);
        
        String[] cols = {"ID", "Tipe", "Kode", "Dokter", "Hewan", "Tanggal", "Total", "Status"};
        model = new DefaultTableModel(cols, 0) {
            @Override
            public boolean isCellEditable(int row, int col) { return false; }
        };
        tableRiwayat = new JTable(model);
        JScrollPane sp = new JScrollPane(tableRiwayat);
        add(sp, BorderLayout.CENTER);
        
        JPanel bottomPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        JButton btnDetail = new JButton("Detail / Struk");
        btnDetail.addActionListener(e -> showDetail());
        JButton btnChat = new JButton("Chat Dokter");
        btnChat.addActionListener(e -> chatFromRiwayat());
        bottomPanel.add(btnDetail);
        bottomPanel.add(btnChat);
        add(bottomPanel, BorderLayout.SOUTH);
    }
    
    private void loadRiwayat() {
        model.setRowCount(0);
        String filter = (String) filterStatus.getSelectedItem();
        boolean semua = filter.equals("Semua");
        
        // Pemesanan online
        List<PemesananOnline> onlineList = pemesananController.getPemesananOnlineByPemilik(pemilik.getIdPemilik());
        for (PemesananOnline po : onlineList) {
            if (semua || po.getStatus().equalsIgnoreCase(filter)) {
                model.addRow(new Object[]{
                    po.getIdTransaksi(), "Online", po.getKodePemesanan(),
                    "Dokter ID " + po.getIdDokter(), "Pet ID " + po.getIdPet(),
                    po.getTanggalKonsultasi(), po.getTotalBiaya(), po.getStatus()
                });
            }
        }
        // Pemesanan offline
        List<PemesananOffline> offlineList = pemesananController.getPemesananOfflineByPemilik(pemilik.getIdPemilik());
        for (PemesananOffline poff : offlineList) {
            if (semua || poff.getStatus().equalsIgnoreCase(filter)) {
                model.addRow(new Object[]{
                    poff.getIdTransaksi(), "Offline", poff.getNomorAntrean(),
                    "Dokter ID " + poff.getIdDokter(), "Pet ID " + poff.getIdPet(),
                    poff.getTanggalAntrean(), "-", poff.getStatus()
                });
            }
        }
    }
    
    private void showDetail() {
        int row = tableRiwayat.getSelectedRow();
        if (row == -1) return;
        String tipe = (String) model.getValueAt(row, 1);
        int id = (int) model.getValueAt(row, 0);
        if (tipe.equals("Online")) {
            PemesananOnline po = pemesananController.getPemesananOnlineById(id);
            if (po != null) new StrukView((JFrame) SwingUtilities.getWindowAncestor(this), po);
        } else {
            PemesananOffline poff = pemesananController.getPemesananOfflineById(id);
            if (poff != null) new StrukView((JFrame) SwingUtilities.getWindowAncestor(this), poff);
        }
    }
    
    private void chatFromRiwayat() {
        int row = tableRiwayat.getSelectedRow();
        if (row == -1) return;
        int idDokter = (int) model.getValueAt(row, 3).toString().replace("Dokter ID ", "");
        // Harusnya ambil object dokter dari pemesanan, tapi sementara simple
        // Kita perlu query dokter by id
        // Untuk sementara, buat dummy
        JOptionPane.showMessageDialog(this, "Fitur chat dari riwayat akan diimplementasikan.");
    }
}