/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.admin;

import main.java.model.akun.Admin;
import main.java.view.komponen.SidebarMenu;
import javax.swing.*;
import java.awt.*;

public class AdminDashboardFrame extends JFrame {
    private JPanel contentPanel;
    private CardLayout cardLayout;

    public AdminDashboardFrame(Admin admin) {
        setTitle("Admin Dashboard - " + admin.getNamaLengkap());
        setSize(1100, 700);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        // Header profil kanan atas
        JPanel header = new JPanel(new BorderLayout());
        JLabel welcomeLabel = new JLabel("Welcome, " + admin.getNamaLengkap());
        welcomeLabel.setBorder(BorderFactory.createEmptyBorder(10, 20, 10, 0));
        header.add(welcomeLabel, BorderLayout.WEST);

        JButton btnLogout = new JButton("Logout");
        btnLogout.addActionListener(e -> logout());
        JPanel rightPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        rightPanel.add(btnLogout);
        header.add(rightPanel, BorderLayout.EAST);
        add(header, BorderLayout.NORTH);

        // Sidebar kiri
        SidebarMenu sidebar = new SidebarMenu(this::showPanel);
        add(sidebar, BorderLayout.WEST);

        // Content panel dengan card layout
        cardLayout = new CardLayout();
        contentPanel = new JPanel(cardLayout);
        contentPanel.add(new DataDokterPanel(), "DOKTER");
        contentPanel.add(new DataPasienPanel(), "PASIEN");
        contentPanel.add(new DataKuponPanel(), "DISKON");
        contentPanel.add(new JLabel("Fitur Laporan segera hadir", SwingConstants.CENTER), "LAPORAN");
        add(contentPanel, BorderLayout.CENTER);

        setVisible(true);
    }

    private void showPanel(String panelName) {
        cardLayout.show(contentPanel, panelName);
    }

    private void logout() {
        int confirm = JOptionPane.showConfirmDialog(this, "Yakin logout?", "Konfirmasi", JOptionPane.YES_NO_OPTION);
        if (confirm == JOptionPane.YES_OPTION) {
            dispose();
            new main.java.view.utama.WelcomeFrame().setVisible(true);
        }
    }
}