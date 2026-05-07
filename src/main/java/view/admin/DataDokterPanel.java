/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import main.java.controller.admin.ManageDokterController;
import main.java.model.akun.Dokter;
import main.java.thread.DatabaseTaskThread;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class DataDokterPanel extends JPanel {
    private JTable table;
    private DefaultTableModel tableModel;
    private ManageDokterController controller = new ManageDokterController();

    public DataDokterPanel() {
        setLayout(new BorderLayout());
        initTable();
        loadData();
        add(createButtonPanel(), BorderLayout.SOUTH);
    }

    private void initTable() {
        tableModel = new DefaultTableModel(new String[]{"ID", "Nama", "Username", "Spesialisasi", "Biaya Konsultasi"}, 0) {
            @Override public boolean isCellEditable(int row, int col) { return false; }
        };
        table = new JTable(tableModel);
        add(new JScrollPane(table), BorderLayout.CENTER);
    }

    private void loadData() {
        new DatabaseTaskThread<>(controller::getAllDokter, this::updateTable, e -> {
            JOptionPane.showMessageDialog(this, "Gagal load data: " + e.getMessage());
        }).execute();
    }

    private void updateTable(List<Dokter> list) {
        tableModel.setRowCount(0);
        for (Dokter d : list) {
            tableModel.addRow(new Object[]{d.getId(), d.getNamaLengkap(), d.getUsername(),
                    d.getSpesialisasi(), "Rp " + d.getBiayaKonsultasi()});
        }
    }

    private JPanel createButtonPanel() {
        JPanel panel = new JPanel(new FlowLayout());
        JButton btnEditHarga = new JButton("✏️ Ubah Harga");
        JButton btnTambah = new JButton("➕ Tambah Dokter");
        JButton btnHapus = new JButton("🗑️ Hapus");
        JButton btnResetPass = new JButton("🔐 Reset Password");

        btnEditHarga.addActionListener(e -> ubahHarga());
        btnTambah.addActionListener(e -> tambahDokter());
        btnHapus.addActionListener(e -> hapusDokter());
        btnResetPass.addActionListener(e -> resetPassword());

        panel.add(btnEditHarga);
        panel.add(btnTambah);
        panel.add(btnHapus);
        panel.add(btnResetPass);
        return panel;
    }

    private void ubahHarga() {
        int row = table.getSelectedRow();
        if (row < 0) { JOptionPane.showMessageDialog(this, "Pilih dokter dulu"); return; }
        int id = (int) tableModel.getValueAt(row, 0);
        String hargaBaru = JOptionPane.showInputDialog(this, "Masukkan biaya konsultasi baru:");
        if (hargaBaru != null && !hargaBaru.isEmpty()) {
            try {
                double biaya = Double.parseDouble(hargaBaru);
                new DatabaseTaskThread<>(() -> controller.updateBiayaDokter(id, biaya),
                        success -> { if (success) loadData(); },
                        err -> JOptionPane.showMessageDialog(this, "Gagal update")).execute();
            } catch (NumberFormatException ex) { JOptionPane.showMessageDialog(this, "Angka tidak valid"); }
        }
    }

    private void tambahDokter() {
        // Form sederhana
        JTextField nama = new JTextField(), user = new JTextField(), pass = new JTextField(), spes = new JTextField(), harga = new JTextField();
        Object[] form = {"Nama Lengkap:", nama, "Username:", user, "Password:", pass, "Spesialisasi:", spes, "Biaya Konsultasi:", harga};
        int opt = JOptionPane.showConfirmDialog(this, form, "Tambah Dokter", JOptionPane.OK_CANCEL_OPTION);
        if (opt == JOptionPane.OK_OPTION) {
            Dokter d = new Dokter(0, user.getText(), pass.getText(), nama.getText(), "", "", spes.getText(), Double.parseDouble(harga.getText()), 0);
            new DatabaseTaskThread<>(() -> controller.tambahDokter(d), success -> { if (success) loadData(); }, err -> {}).execute();
        }
    }

    private void hapusDokter() {
        int row = table.getSelectedRow();
        if (row < 0) return;
        int id = (int) tableModel.getValueAt(row, 0);
        int confirm = JOptionPane.showConfirmDialog(this, "Yakin hapus?", "Hapus", JOptionPane.YES_NO_OPTION);
        if (confirm == JOptionPane.YES_OPTION) {
            new DatabaseTaskThread<>(() -> controller.hapusDokter(id), success -> { if (success) loadData(); }, err -> {}).execute();
        }
    }

    private void resetPassword() {
        int row = table.getSelectedRow();
        if (row < 0) return;
        String newPass = JOptionPane.showInputDialog(this, "Password baru untuk " + tableModel.getValueAt(row, 2));
        if (newPass != null && !newPass.isEmpty()) {
            // Panggil method reset password di controller (perlu ditambahkan di ManageDokterController)
            JOptionPane.showMessageDialog(this, "Fitur reset password segera diimplementasi");
        }
    }
}