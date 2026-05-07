/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.komponen;

import javax.swing.*;
import java.awt.*;

public class HeaderPanel extends JPanel {
    public HeaderPanel(JFrame parent) {
        setLayout(new BorderLayout());
        JLabel logo = new JLabel(" LOGO KLINIK ");
        add(logo, BorderLayout.WEST);
        JButton btnProfil = new JButton("Profile");
        add(btnProfil, BorderLayout.EAST);
        btnProfil.addActionListener(e -> JOptionPane.showMessageDialog(parent, "Profil pengguna"));
    }
}