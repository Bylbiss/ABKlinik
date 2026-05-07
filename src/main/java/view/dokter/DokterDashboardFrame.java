/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.dokter;

import java.awt.CardLayout;
import main.java.model.akun.Dokter;
import main.java.view.utama.DashboardFrame;
import javax.swing.*;

public final class DokterDashboardFrame extends DashboardFrame {
    public DokterDashboardFrame(Dokter dokter) {
        super("Dashboard Dokter - " + dokter.getNamaLengkap());
        initMenu();
    }
    @Override protected void initMenu() {
        JLabel welcome = new JLabel("Dokter Dashboard (coming soon)", SwingConstants.CENTER);
        contentPanel.add(welcome, "welcome");
        ((CardLayout)contentPanel.getLayout()).show(contentPanel, "welcome");
    }
}