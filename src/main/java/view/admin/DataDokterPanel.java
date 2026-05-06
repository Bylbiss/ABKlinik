/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import main.java.controller.admin.ManageDokterController;
import main.java.model.akun.Dokter;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class DataDokterPanel extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ManageDokterController controller = new ManageDokterController();
    
    public DataDokterPanel() {
        setLayout(new BorderLayout());
        model = new DefaultTableModel(new String[]{"ID", "Nama", "Spesialisasi", "Biaya"}, 0);
        table = new JTable(model);
        add(new JScrollPane(table), BorderLayout.CENTER);
        JButton btnRefresh = new JButton("Refresh");
        add(btnRefresh, BorderLayout.SOUTH);
        btnRefresh.addActionListener(e -> loadData());
        loadData();
    }
    
    private void loadData() {
        controller.getAllDokter(this::updateTable, e -> JOptionPane.showMessageDialog(this, "Error: " + e.getMessage()));
    }
    
    private void updateTable(List<Dokter> list) {
        model.setRowCount(0);
        for (Dokter d : list) {
            model.addRow(new Object[]{d.getId(), d.getNamaLengkap(), d.getSpesialisasi(), d.getBiayaKonsultasi()});
        }
    }
}