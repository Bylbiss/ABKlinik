/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.dokter;

import main.java.controller.dokter.ResepController;
import main.java.model.obat.Resep;

import javax.swing.*;
import java.awt.*;

public class ResepObatPanel extends JPanel {
    private ResepController resepController = new ResepController();
    
    public ResepObatPanel() {
        setLayout(new BorderLayout());
        add(new JLabel("Form Resep Obat (coming soon)"), BorderLayout.CENTER);
    }
}