/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.utama;

import javax.swing.*;
import java.awt.*;

public class WelcomeFrame extends JFrame {
    private JButton btnDaftar, btnMasuk;
    public WelcomeFrame() {
        setTitle("Selamat Datang di Klinik Hewan");
        setSize(400, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        JLabel logo = new JLabel("LOGO KLINIK", SwingConstants.CENTER);
        add(logo, BorderLayout.CENTER);

        JPanel panelTombol = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        btnDaftar = new JButton("Daftar");
        btnMasuk = new JButton("Masuk");
        panelTombol.add(btnDaftar);
        panelTombol.add(btnMasuk);
        add(panelTombol, BorderLayout.NORTH);

        btnDaftar.addActionListener(e -> bukaRegister());
        btnMasuk.addActionListener(e -> bukaLogin());

        setVisible(true);
    }
    private void bukaRegister() { new RegisterPanel(this); }
    private void bukaLogin() { new LoginPanel(this); }
}