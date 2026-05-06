/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.user;

import main.java.model.akun.User;
import main.java.controller.user.ObatController;

import javax.swing.*;
import java.awt.*;

public class BeliObatPanel extends JPanel {
    private User user;
    private ObatController obatController = new ObatController();
    
    public BeliObatPanel(User user) {
        this.user = user;
        setLayout(new BorderLayout());
        add(new JLabel("Daftar Obat (coming soon)"), BorderLayout.CENTER);
    }
}