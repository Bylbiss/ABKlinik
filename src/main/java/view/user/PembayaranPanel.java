/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.user;

import main.java.model.akun.User;
import main.java.controller.user.TransaksiController;

import javax.swing.*;
import java.awt.*;

public class PembayaranPanel extends JPanel {
    private User user;
    private TransaksiController transaksiController = new TransaksiController();
    
    public PembayaranPanel(User user) {
        this.user = user;
        setLayout(new BorderLayout());
        add(new JLabel("Halaman Pembayaran (coming soon)"), BorderLayout.CENTER);
    }
}