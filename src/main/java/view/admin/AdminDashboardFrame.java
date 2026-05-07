/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import java.awt.CardLayout;
import main.java.model.akun.Admin;
import main.java.view.utama.DashboardFrame;
import javax.swing.*;

public final class AdminDashboardFrame extends DashboardFrame {
    public AdminDashboardFrame(Admin admin) {
        super("Dashboard Admin - " + admin.getNamaLengkap());
        initMenu();
    }
    @Override protected void initMenu() {
        JLabel welcome = new JLabel("Admin Dashboard (coming soon)", SwingConstants.CENTER);
        contentPanel.add(welcome, "welcome");
        ((CardLayout)contentPanel.getLayout()).show(contentPanel, "welcome");
    }
}