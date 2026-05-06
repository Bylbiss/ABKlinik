/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import main.java.controller.admin.ManageUserController;
import main.java.model.akun.User;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class DataPasienPanel extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ManageUserController controller = new ManageUserController();
    
    public DataPasienPanel() {
        setLayout(new BorderLayout());
        model = new DefaultTableModel(new String[]{"ID", "Nama", "Username", "Email", "No HP"}, 0);
        table = new JTable(model);
        add(new JScrollPane(table), BorderLayout.CENTER);
        JButton btnRefresh = new JButton("Refresh");
        add(btnRefresh, BorderLayout.SOUTH);
        btnRefresh.addActionListener(e -> loadData());
        loadData();
    }
    
    private void loadData() {
        controller.getAllUsers(this::updateTable, e -> JOptionPane.showMessageDialog(this, "Error: " + e.getMessage()));
    }
    
    private void updateTable(List<User> list) {
        model.setRowCount(0);
        for (User u : list) {
            model.addRow(new Object[]{u.getId(), u.getNamaLengkap(), u.getUsername(), u.getEmail(), u.getNoHp()});
        }
    }
}