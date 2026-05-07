/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import main.java.controller.admin.ManageKuponController;
import main.java.model.kupon.Kupon;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class DataKuponPanel extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ManageKuponController controller = new ManageKuponController();
    
    public DataKuponPanel() {
        setLayout(new BorderLayout());
        model = new DefaultTableModel(new String[]{"ID", "Kode", "Diskon %", "Minimal", "Berlaku"}, 0);
        table = new JTable(model);
        add(new JScrollPane(table), BorderLayout.CENTER);
        JButton btnRefresh = new JButton("Refresh");
        add(btnRefresh, BorderLayout.SOUTH);
        btnRefresh.addActionListener(e -> loadData());
        loadData();
    }
    
    private void loadData() {
        controller.getAllKupon(this::updateTable, e -> JOptionPane.showMessageDialog(this, "Error: " + e.getMessage()));
    }
    
    private void updateTable(List<Kupon> list) {
        model.setRowCount(0);
        for (Kupon k : list) {
            model.addRow(new Object[]{k.getId(), k.getKode(), k.getDiskonPersen(), k.getMinimalPembelian(), k.getBerlakuHingga()});
        }
    }
}