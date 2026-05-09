/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package viewUser;

import config.Koneksi;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

/**
 *
 * @author LOQ
 */
public class Obat extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private JTextField txtCari;
    private JButton btnCari, btnRefresh;

    public Obat() {
        setLayout(new BorderLayout());
        setBackground(Color.WHITE);
        initComponents();
        loadData("");
    }

    private void initComponents() {
        // Panel pencarian
        JPanel searchPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        searchPanel.setBackground(Color.WHITE);
        searchPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        txtCari = new JTextField(20);
        btnCari = new JButton("🔍 Cari");
        btnRefresh = new JButton("🔄 Refresh");
        
        searchPanel.add(new JLabel("Cari obat:"));
        searchPanel.add(txtCari);
        searchPanel.add(btnCari);
        searchPanel.add(btnRefresh);
        
        // Tabel
        String[] columns = {"ID", "Nama Obat", "Bentuk", "Harga", "Stok", "Perlu Resep"};
        model = new DefaultTableModel(columns, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; // Tabel tidak bisa diedit
            }
        };
        table = new JTable(model);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        table.getTableHeader().setFont(new Font("Segoe UI", Font.BOLD, 12));
        table.setRowHeight(25);
        
        JScrollPane scroll = new JScrollPane(table);
        scroll.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        // Label info
        JLabel lblInfo = new JLabel("ℹ️ Obat yang memerlukan resep hanya bisa dibeli dengan resep dokter.");
        lblInfo.setFont(new Font("Segoe UI", Font.ITALIC, 11));
        lblInfo.setForeground(Color.GRAY);
        lblInfo.setBorder(BorderFactory.createEmptyBorder(5, 10, 10, 10));
        
        add(searchPanel, BorderLayout.NORTH);
        add(scroll, BorderLayout.CENTER);
        add(lblInfo, BorderLayout.SOUTH);
        
        // Event
        btnCari.addActionListener(e -> loadData(txtCari.getText().trim()));
        btnRefresh.addActionListener(e -> {
            txtCari.setText("");
            loadData("");
        });
    }
    
    private void loadData(String keyword) {
        model.setRowCount(0);
        System.out.println("Mencoba ambil data obat...");
        System.out.println("SQL: " + sql);
        String sql;
        
        if (keyword.isEmpty()) {
            sql = "SELECT id_obat, nama_obat, bentuk_obat, harga, stok, perlu_resep FROM obat ORDER BY nama_obat";
        } else {
            sql = "SELECT id_obat, nama_obat, bentuk_obat, harga, stok, perlu_resep FROM obat WHERE nama_obat LIKE '%" + keyword + "%' ORDER BY nama_obat";
        }
        
        try (Statement st = Koneksi.getConnection().createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            
            while (rs.next()) {
                model.addRow(new Object[]{
                    rs.getInt("id_obat"),
                    rs.getString("nama_obat"),
                    rs.getString("bentuk_obat"),
                    "Rp " + formatRupiah(rs.getBigDecimal("harga")),
                    rs.getInt("stok") + " pcs",
                    rs.getInt("perlu_resep") == 1 ? "✅ Ya" : "❌ Tidak"
                });
            }
            
            // Atur lebar kolom
            table.getColumnModel().getColumn(0).setPreferredWidth(50);
            table.getColumnModel().getColumn(1).setPreferredWidth(200);
            table.getColumnModel().getColumn(2).setPreferredWidth(80);
            table.getColumnModel().getColumn(3).setPreferredWidth(100);
            table.getColumnModel().getColumn(4).setPreferredWidth(70);
            table.getColumnModel().getColumn(5).setPreferredWidth(80);
            
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Gagal memuat data obat: " + e.getMessage());
        }
    }
    
    private String formatRupiah(java.math.BigDecimal angka) {  
        return String.format("%,.0f", angka).replace(",", ".");
    }
}
    
  
