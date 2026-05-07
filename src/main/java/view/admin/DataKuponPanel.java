/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import main.java.controller.admin.ManageKuponController;
import main.java.model.kupon.Kupon;
import main.java.thread.DatabaseTaskThread;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class DataKuponPanel extends JPanel {
    private JTable table;
    private DefaultTableModel tableModel;
    private ManageKuponController controller = new ManageKuponController();

    public DataKuponPanel() {
        setLayout(new BorderLayout());
        initTable();
        loadData();
        add(createButtonPanel(), BorderLayout.SOUTH);
    }

    private void initTable() {
        tableModel = new DefaultTableModel(new String[]{"ID", "Kode", "Deskripsi", "Diskon %", "Min Belanja", "Berlaku Hingga", "Aktif"}, 0);
        table = new JTable(tableModel);
        add(new JScrollPane(table), BorderLayout.CENTER);
    }

    private void loadData() {
        new DatabaseTaskThread<>(controller::getAllKupon, this::updateTable, e -> {}).execute();
    }

    private void updateTable(List<Kupon> list) {
        tableModel.setRowCount(0);
        for (Kupon k : list) {
            tableModel.addRow(new Object[]{k.getId(), k.getKode(), k.getDeskripsi(),
                    k.getDiskonPersen(), k.getMinimalPembelian(), k.getBerlakuHingga(), k.isAktif()});
        }
    }

    private JPanel createButtonPanel() {
        JPanel panel = new JPanel(new FlowLayout());
        JButton btnTambah = new JButton("➕ Tambah");
        JButton btnEdit = new JButton("✏️ Edit");
        JButton btnHapus = new JButton("🗑️ Hapus");
        btnTambah.addActionListener(e -> tambahDiskon());
        btnEdit.addActionListener(e -> editDiskon());
        btnHapus.addActionListener(e -> hapusDiskon());
        panel.add(btnTambah);
        panel.add(btnEdit);
        panel.add(btnHapus);
        return panel;
    }

    private void tambahDiskon() {
        JTextField kode = new JTextField(), deskripsi = new JTextField(), diskon = new JTextField(), min = new JTextField(), berlaku = new JTextField();
        Object[] form = {"Kode:", kode, "Deskripsi:", deskripsi, "Diskon %:", diskon, "Minimal Pembelian:", min, "Berlaku hingga (yyyy-mm-dd):", berlaku};
        int opt = JOptionPane.showConfirmDialog(this, form, "Tambah Kupon", JOptionPane.OK_CANCEL_OPTION);
        if (opt == JOptionPane.OK_OPTION) {
            Kupon k = new Kupon(0, kode.getText(), deskripsi.getText(),
                    Double.parseDouble(diskon.getText()), 0, Double.parseDouble(min.getText()),
                    LocalDate.parse(berlaku.getText(), DateTimeFormatter.ofPattern("yyyy-MM-dd")), true);
            new DatabaseTaskThread<>(() -> controller.tambahKupon(k), success -> { if (success) loadData(); }, err -> {}).execute();
        }
    }

    private void editDiskon() {
        int row = table.getSelectedRow();
        if (row < 0) return;
        // Ambil data dan tampilkan form edit (mirip tambah tapi dengan nilai awal)
        JOptionPane.showMessageDialog(this, "Fitur edit silakan dikembangkan");
    }

    private void hapusDiskon() {
        int row = table.getSelectedRow();
        if (row < 0) return;
        int id = (int) tableModel.getValueAt(row, 0);
        int confirm = JOptionPane.showConfirmDialog(this, "Hapus kupon?", "Hapus", JOptionPane.YES_NO_OPTION);
        if (confirm == JOptionPane.YES_OPTION) {
            new DatabaseTaskThread<>(() -> controller.hapusKupon(id), success -> { if (success) loadData(); }, err -> {}).execute();
        }
    }
}