/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.utama;

import main.java.controller.auth.RegistrasiController;
import main.java.model.akun.User;
import javax.swing.*;
import java.awt.*;

public class RegisterPanel extends JDialog {
    private JTextField tfNama, tfUsername, tfEmail, tfNoHp, tfAlamat;
    private JPasswordField pfPassword, pfConfirm;
    private RegistrasiController regController = new RegistrasiController();

    public RegisterPanel(JFrame parent) {
        super(parent, "Daftar User", true);
        setSize(400, 350);
        setLocationRelativeTo(parent);
        setLayout(new GridLayout(7,2));
        add(new JLabel("Nama Lengkap:")); tfNama = new JTextField(); add(tfNama);
        add(new JLabel("Username:")); tfUsername = new JTextField(); add(tfUsername);
        add(new JLabel("Email:")); tfEmail = new JTextField(); add(tfEmail);
        add(new JLabel("No HP:")); tfNoHp = new JTextField(); add(tfNoHp);
        add(new JLabel("Alamat:")); tfAlamat = new JTextField(); add(tfAlamat);
        add(new JLabel("Password:")); pfPassword = new JPasswordField(); add(pfPassword);
        add(new JLabel("Konfirmasi:")); pfConfirm = new JPasswordField(); add(pfConfirm);
        JButton btnDaftar = new JButton("Daftar");
        add(btnDaftar);
        JButton btnBatal = new JButton("Batal");
        add(btnBatal);

        btnDaftar.addActionListener(e -> doRegister());
        btnBatal.addActionListener(e -> dispose());
        setVisible(true);
    }

    private void doRegister() {
        String pass = new String(pfPassword.getPassword());
        String confirm = new String(pfConfirm.getPassword());
        if (!pass.equals(confirm)) {
            JOptionPane.showMessageDialog(this, "Password tidak cocok");
            return;
        }
        User user = new User(0, tfUsername.getText(), pass, tfNama.getText(),
                     tfEmail.getText(), tfNoHp.getText());
        user.setAlamat(tfAlamat.getText());
        regController.registrasi(user, success -> {
            if (success) {
                JOptionPane.showMessageDialog(this, "Pendaftaran berhasil! Silakan login.");
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Registrasi gagal, username mungkin sudah ada");
            }
        }, e -> JOptionPane.showMessageDialog(this, "Error: " + e.getMessage()));
    }
}