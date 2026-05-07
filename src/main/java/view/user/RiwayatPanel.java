/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.user;

import main.java.model.akun.User;
import main.java.controller.user.TransaksiController;

import javax.swing.*;
import java.awt.*;

public class RiwayatPanel extends JPanel {
    private User user;
    private TransaksiController transaksiController = new TransaksiController();
    private JList<String> riwayatList;
    
    public RiwayatPanel(User user) {
        this.user = user;
        setLayout(new BorderLayout());
        riwayatList = new JList<>();
        add(new JScrollPane(riwayatList), BorderLayout.CENTER);
        loadRiwayat();
    }
    
    private void loadRiwayat() {
        transaksiController.getRiwayatUser(user.getId(), list -> {
            DefaultListModel<String> model = new DefaultListModel<>();
            for (Object o : list) model.addElement(o.toString());
            riwayatList.setModel(model);
        }, e -> JOptionPane.showMessageDialog(this, "Error: " + e.getMessage()));
    }
}