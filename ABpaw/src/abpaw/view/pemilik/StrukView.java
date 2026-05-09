/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.view.pemilik;

import abpaw.model.entity.PemesananOffline;
import abpaw.model.entity.PemesananOnline;
import abpaw.model.entity.Transaksi;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;

public class StrukView extends JDialog {
    private Transaksi transaksi;
    
    public StrukView(JFrame parent, Transaksi transaksi) {
        super(parent, "Struk Pemesanan", true);
        this.transaksi = transaksi;
        initComponents();
        setSize(400, 500);
        setLocationRelativeTo(parent);
        setVisible(true);
    }
    
    private void initComponents() {
        setLayout(new BorderLayout());
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
        mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        mainPanel.setBackground(Color.WHITE);
        
        JLabel title = new JLabel("STRUK PEMESANAN");
        title.setFont(new Font("Arial", Font.BOLD, 18));
        title.setAlignmentX(Component.CENTER_ALIGNMENT);
        mainPanel.add(title);
        mainPanel.add(Box.createVerticalStrut(15));
        
        if (transaksi instanceof PemesananOnline) {
            PemesananOnline po = (PemesananOnline) transaksi;
            addRow(mainPanel, "Kode Pemesanan:", po.getKodePemesanan());
            addRow(mainPanel, "Tanggal Konsultasi:", po.getTanggalKonsultasi().toString());
            addRow(mainPanel, "Waktu Konsultasi:", po.getWaktuKonsultasi());
            addRow(mainPanel, "Biaya Konsultasi:", "Rp " + po.getBiayaKonsultasi());
            addRow(mainPanel, "Diskon:", "Rp " + po.getJumlahDiskon());
            addRow(mainPanel, "Total Bayar:", "Rp " + po.getTotalBiaya());
            addRow(mainPanel, "Status:", po.getStatus());
            addRow(mainPanel, "Waktu Pemesanan:", po.getWaktuPemesanan().toString());
        } else if (transaksi instanceof PemesananOffline) {
            PemesananOffline poff = (PemesananOffline) transaksi;
            addRow(mainPanel, "Nomor Antrean:", poff.getNomorAntrean());
            addRow(mainPanel, "Tanggal Antrean:", poff.getTanggalAntrean().toString());
            addRow(mainPanel, "Waktu Antrean:", poff.getWaktuAntrean().toString());
            if (poff.getEstimasiWaktu() != null)
                addRow(mainPanel, "Estimasi Waktu:", poff.getEstimasiWaktu().toString());
            addRow(mainPanel, "Status:", poff.getStatus());
        }
        
        mainPanel.add(Box.createVerticalStrut(20));
        JButton btnClose = new JButton("Tutup");
        btnClose.addActionListener(e -> dispose());
        btnClose.setAlignmentX(Component.CENTER_ALIGNMENT);
        mainPanel.add(btnClose);
        
        JScrollPane scroll = new JScrollPane(mainPanel);
        scroll.setBorder(null);
        add(scroll, BorderLayout.CENTER);
    }
    
    private void addRow(JPanel panel, String label, String value) {
        JPanel row = new JPanel(new BorderLayout(5, 0));
        row.setOpaque(false);
        JLabel lblLabel = new JLabel(label);
        lblLabel.setFont(new Font("Arial", Font.BOLD, 12));
        JLabel lblValue = new JLabel(value);
        row.add(lblLabel, BorderLayout.WEST);
        row.add(lblValue, BorderLayout.EAST);
        panel.add(row);
        panel.add(Box.createVerticalStrut(8));
    }
}