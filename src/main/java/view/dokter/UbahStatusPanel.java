/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.dokter;

import main.java.controller.dokter.StatusController;

import javax.swing.*;
import java.awt.*;

public class UbahStatusPanel extends JPanel {
    private StatusController statusController = new StatusController();
    
    public UbahStatusPanel() {
        setLayout(new BorderLayout());
        add(new JLabel("Ubah Status Pemesanan (coming soon)"), BorderLayout.CENTER);
    }
}