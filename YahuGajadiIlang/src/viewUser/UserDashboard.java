/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package viewUser;

import javax.swing.*;
import java.awt.*;

/**
 *
 * @author LOQ
 */
public class UserDashboard extends JFrame {
    private int idPemilik;
    private String namaPemilik;
    private CardLayout cardLayout;
    private JPanel contentPanel;

    public UserDashboard(int idPemilik, String namaPemilik) {
        this.idPemilik = idPemilik;
        this.namaPemilik = namaPemilik;
        setTitle("ABPaw - Dashboard " + namaPemilik);
        setSize(1000, 650);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        initUI();
        setVisible(true);
    }

    private void initUI() {
        setLayout(new BorderLayout());

        // ========== HEADER ==========
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setBackground(new Color(0, 102, 204));
        headerPanel.setBorder(BorderFactory.createEmptyBorder(15, 20, 15, 20));

        JLabel lblLogo = new JLabel("🐾 ABPaw");
        lblLogo.setFont(new Font("Arial", Font.BOLD, 24));
        lblLogo.setForeground(Color.WHITE);
        headerPanel.add(lblLogo, BorderLayout.WEST);

        JLabel lblUser = new JLabel("👤 Halo, " + ambilNamaDepan() + "!");
        lblUser.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblUser.setForeground(Color.WHITE);
        headerPanel.add(lblUser, BorderLayout.EAST);

        add(headerPanel, BorderLayout.NORTH);

        // ========== MENU BUTTONS (GRID 2x2) ==========
        JPanel menuPanel = new JPanel(new GridLayout(2, 2, 20, 20));
        menuPanel.setBorder(BorderFactory.createEmptyBorder(30, 50, 20, 50));
        menuPanel.setBackground(Color.WHITE);

        // Tombol Chat Dokter
        JButton btnChat = createMenuButton("💬", "Chat Dokter", new Color(46, 204, 113));
        btnChat.addActionListener(e -> showChatDokter());

        // Tombol Pesan Offline
        JButton btnOffline = createMenuButton("📅", "Pesan Offline", new Color(52, 152, 219));
        btnOffline.addActionListener(e -> showPesanOffline());

        // Tombol Obat
        JButton btnObat = createMenuButton("💊", "Info Obat", new Color(241, 196, 15));
        btnObat.addActionListener(e -> showObat());

        // Tombol Riwayat
        JButton btnRiwayat = createMenuButton("📜", "Riwayat", new Color(155, 89, 182));
        btnRiwayat.addActionListener(e -> showRiwayat());

        menuPanel.add(btnChat);
        menuPanel.add(btnOffline);
        menuPanel.add(btnObat);
        menuPanel.add(btnRiwayat);

        // ========== CONTENT PANEL (CardLayout) ==========
        cardLayout = new CardLayout();
        contentPanel = new JPanel(cardLayout);
        contentPanel.setBackground(Color.WHITE);

        // Panel default (sambutan)
        JPanel welcomePanel = new JPanel(new GridBagLayout());
        welcomePanel.setBackground(Color.WHITE);
        JLabel lblWelcome = new JLabel("<HTML><center><h1>Selamat Datang di ABPaw!</h1><br>Silakan pilih menu di atas untuk mulai menggunakan layanan kami.</center></HTML>");
        lblWelcome.setFont(new Font("Segoe UI", Font.PLAIN, 16));
        lblWelcome.setForeground(Color.GRAY);
        welcomePanel.add(lblWelcome);
        contentPanel.add(welcomePanel, "WELCOME");

        // TEMPORARY: panel kosong untuk menu yang belum dibuat
        contentPanel.add(new JPanel(), "CHAT");
        contentPanel.add(new JPanel(), "OFFLINE");
        contentPanel.add(new JPanel(), "OBAT");
        contentPanel.add(new JPanel(), "RIWAYAT");

        add(menuPanel, BorderLayout.CENTER);
        add(contentPanel, BorderLayout.SOUTH); // content di bawah menu

        // Atur ukuran content panel
        contentPanel.setPreferredSize(new Dimension(900, 400));

        // Tombol logout di pojok kanan bawah (opsional)
        JPanel bottomPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        bottomPanel.setBackground(Color.WHITE);
        JButton btnLogout = new JButton("🚪 Logout");
        btnLogout.addActionListener(e -> logout());
        bottomPanel.add(btnLogout);
        add(bottomPanel, BorderLayout.SOUTH);

        // Tampilkan welcome panel
        cardLayout.show(contentPanel, "WELCOME");
    }

    private JButton createMenuButton(String icon, String text, Color color) {
        JButton btn = new JButton("<HTML><center><span style='font-size:40px;'>" + icon + "</span><br>" + text + "</center></HTML>");
        btn.setBackground(color);
        btn.setForeground(Color.WHITE);
        btn.setFont(new Font("Arial", Font.BOLD, 14));
        btn.setFocusPainted(false);
        btn.setBorder(BorderFactory.createEmptyBorder(20, 10, 20, 10));
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private String ambilNamaDepan() {
        // Pisahkan nama depan dari nama lengkap
        if (namaPemilik != null && namaPemilik.contains(" ")) {
            return namaPemilik.split(" ")[0];
        }
        return namaPemilik;
    }

    private void showChatDokter() {
        cardLayout.show(contentPanel, "CHAT");
        // Hapus panel temporary, ganti dengan yang asli
        contentPanel.remove(contentPanel.getComponent(1)); // index "CHAT"
        ChatDokter chatView = new ChatDokter(idPemilik, namaPemilik, cardLayout, contentPanel);
        contentPanel.add(chatView, "CHAT");
        cardLayout.show(contentPanel, "CHAT");
    }

    private void showPesanOffline() {
        cardLayout.show(contentPanel, "OFFLINE");
        contentPanel.remove(contentPanel.getComponent(2));
        PesanOfflineView offlineView = new PesanOffline(idPemilik, namaPemilik);
        contentPanel.add(offlineView, "OFFLINE");
        cardLayout.show(contentPanel, "OFFLINE");
    }

    private void showObat() {
        cardLayout.show(contentPanel, "OBAT");
        contentPanel.remove(contentPanel.getComponent(3));
        ObatView obatView = new Obat();
        contentPanel.add(obatView, "OBAT");
        cardLayout.show(contentPanel, "OBAT");
    }

    private void showRiwayat() {
        cardLayout.show(contentPanel, "RIWAYAT");
        contentPanel.remove(contentPanel.getComponent(4));
        RiwayatView riwayatView = new Riwayat(idPemilik);
        contentPanel.add(riwayatView, "RIWAYAT");
        cardLayout.show(contentPanel, "RIWAYAT");
    }

    private void logout() {
        int confirm = JOptionPane.showConfirmDialog(this, "Yakin ingin logout?", "Konfirmasi", JOptionPane.YES_NO_OPTION);
        if (confirm == JOptionPane.YES_OPTION) {
            dispose();
            new main.LoginFrame().setVisible(true);
        }
    }
}
