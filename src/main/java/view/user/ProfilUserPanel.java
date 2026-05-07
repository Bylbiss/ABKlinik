/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.user;

import main.java.model.akun.User;
import main.java.controller.user.HewanController;

import javax.swing.*;
import java.awt.*;

public class ProfilUserPanel extends JPanel {
    private User user;
    private HewanController hewanController = new HewanController();
    
    public ProfilUserPanel(User user) {
        this.user = user;
        setLayout(new GridLayout(0,2));
        add(new JLabel("Nama:"));
        add(new JLabel(user.getNamaLengkap()));
        add(new JLabel("Email:"));
        add(new JLabel(user.getEmail()));
        add(new JLabel("No HP:"));
        add(new JLabel(user.getNoHp()));
        // Tambah tombol edit, dll
    }
}