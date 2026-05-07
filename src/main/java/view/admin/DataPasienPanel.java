/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import main.java.controller.admin.ManageUserController;
import main.java.model.akun.User;
import main.java.thread.DatabaseTaskThread;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class DataPasienPanel extends JPanel {
    private JTable table;
    private DefaultTableModel tableModel;
    private ManageUserController controller = new ManageUserController();

    public DataPasienPanel() {
        setLayout(new BorderLayout());
        initTable();
        loadData();
        add(createButtonPanel(), BorderLayout.SOUTH);
    }

    private void initTable() {
        tableModel = new DefaultTableModel(new String[]{"ID", "Nama", "Username", "Email", "No HP"}, 0) {
            @Override public boolean isCellEditable(int row, int col) { return false; }
        };
        table = new JTable(tableModel);
        add(new JScrollPane(table), BorderLayout.CENTER);
    }

    private void loadData() {
        new DatabaseTaskThread<>(controller::getAllUsers, this::updateTable, e -> {}).execute();
    }

    private void updateTable(List<User> list) {
        tableModel.setRowCount(0);
        for (User u : list) {
            tableModel.addRow(new Object[]{u.getId(), u.getNamaLengkap(), u.getUsername(), u.getEmail(), u.getNoHp()});
        }
    }

    private JPanel createButtonPanel() {
        JPanel panel = new JPanel(new FlowLayout());
        JButton btnEdit = new JButton("✏️ Edit");
        JButton btnHapus = new JButton("🗑️ Hapus");
        JButton btnResetPass = new JButton("🔐 Reset Password");

        btnEdit.addActionListener(e -> editUser());
        btnHapus.addActionListener(e -> hapusUser());
        btnResetPass.addActionListener(e -> resetPassword());

        panel.add(btnEdit);
        panel.add(btnHapus);
        panel.add(btnResetPass);
        return panel;
    }

    private void editUser() {
        int row = table.getSelectedRow();
        if (row < 0) return;
        User u = new User((int) tableModel.getValueAt(row, 0),
                (String) tableModel.getValueAt(row, 2),
                "", (String) tableModel.getValueAt(row, 1),
                (String) tableModel.getValueAt(row, 3),
                (String) tableModel.getValueAt(row, 4));
        // Form edit sederhana
        JTextField nama = new JTextField(u.getNamaLengkap());
        JTextField email = new JTextField(u.getEmail());
        JTextField noHp = new JTextField(u.getNoHp());
        Object[] form = {"Nama:", nama, "Email:", email, "No HP:", noHp};
        int opt = JOptionPane.showConfirmDialog(this, form, "Edit User", JOptionPane.OK_CANCEL_OPTION);
        if (opt == JOptionPane.OK_OPTION) {
            u.setNamaLengkap(nama.getText());
            u.setEmail(email.getText());
            u.setNoHp(noHp.getText());
            new DatabaseTaskThread<>(() -> controller.updateUser(u), success -> { if (success) loadData(); }, err -> {}).execute();
        }
    }

    private void hapusUser() {
        int row = table.getSelectedRow();
        if (row < 0) return;
        int id = (int) tableModel.getValueAt(row, 0);
        int confirm = JOptionPane.showConfirmDialog(this, "Hapus user ini?", "Hapus", JOptionPane.YES_NO_OPTION);
        if (confirm == JOptionPane.YES_OPTION) {
            new DatabaseTaskThread<>(() -> controller.deleteUser(id), success -> { if (success) loadData(); }, err -> {}).execute();
        }
    }

    private void resetPassword() {
        int row = table.getSelectedRow();
        if (row < 0) return;
        String newPass = JOptionPane.showInputDialog(this, "Password baru untuk " + tableModel.getValueAt(row, 2));
        if (newPass != null && !newPass.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Fitur reset password user menyusul");
        }
    }
}