/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.user;

import main.java.model.akun.User;
import main.java.controller.user.HewanController;
import main.java.model.hewan.Hewan;

import javax.swing.*;
import java.awt.*;

public class TambahHewanPanel extends JPanel {
    private User user;
    private HewanController hewanController = new HewanController();
    private JTextField tfNama, tfJenis, tfUmur;
    
    public TambahHewanPanel(User user) {
        this.user = user;
        setLayout(new GridLayout(4,2));
        add(new JLabel("Nama Hewan:")); tfNama = new JTextField(); add(tfNama);
        add(new JLabel("Jenis:")); tfJenis = new JTextField(); add(tfJenis);
        add(new JLabel("Umur:")); tfUmur = new JTextField(); add(tfUmur);
        JButton btnSimpan = new JButton("Simpan");
        add(btnSimpan);
        btnSimpan.addActionListener(e -> simpan());
    }
    
    private void simpan() {
        Hewan hewan = new Hewan(0, user.getId(), tfNama.getText(), tfJenis.getText(), tfUmur.getText());
        hewanController.tambahHewan(hewan, success -> {
            if (success) JOptionPane.showMessageDialog(this, "Hewan ditambahkan");
            else JOptionPane.showMessageDialog(this, "Gagal");
        }, e -> JOptionPane.showMessageDialog(this, "Error: " + e.getMessage()));
    }
}