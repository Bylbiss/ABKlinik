/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.view;

import abpaw.controller.AuthController;
import javax.swing.*;
import java.awt.*;
import java.util.regex.Pattern;

public class RegisterView extends JFrame {
    private JTextField txtNamaDepan, txtNamaBelakang, txtUsername, txtNoHp, txtEmail, txtAlamat;
    private JPasswordField txtPassword, txtConfirmPassword;
    private JButton btnRegister;
    private JLabel lblMessage;
    private AuthController authController;

    public RegisterView() {
        authController = new AuthController();
        initComponents();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void initComponents() {
        setTitle("Daftar Akun Baru - AB Paw");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(500, 600);
        setLayout(new BorderLayout());

        JPanel formPanel = new JPanel(new GridBagLayout());
        formPanel.setBackground(Color.WHITE);
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(8, 10, 8, 10);
        gbc.fill = GridBagConstraints.HORIZONTAL;

        JLabel titleLabel = new JLabel("Daftar Akun Pemilik");
        titleLabel.setFont(new Font("Arial", Font.BOLD, 18));
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        formPanel.add(titleLabel, gbc);

        String[] labels = {"Nama Depan:", "Nama Belakang:", "Username:", "Password:", "Konfirmasi Password:", "No. HP (hanya angka):", "Email:", "Alamat:"};
        JComponent[] fields = {
            txtNamaDepan = new JTextField(15),
            txtNamaBelakang = new JTextField(15),
            txtUsername = new JTextField(15),
            txtPassword = new JPasswordField(15),
            txtConfirmPassword = new JPasswordField(15),
            txtNoHp = new JTextField(15),
            txtEmail = new JTextField(15),
            txtAlamat = new JTextField(15)
        };

        gbc.gridwidth = 1;
        for (int i = 0; i < labels.length; i++) {
            gbc.gridy = i + 1;
            gbc.gridx = 0;
            formPanel.add(new JLabel(labels[i]), gbc);
            gbc.gridx = 1;
            formPanel.add(fields[i], gbc);
        }

        btnRegister = new JButton("Daftar");
        btnRegister.setBackground(new Color(34, 139, 34));
        btnRegister.setForeground(Color.WHITE);
        btnRegister.setFocusPainted(false);
        gbc.gridy = labels.length + 1;
        gbc.gridx = 0;
        gbc.gridwidth = 2;
        formPanel.add(btnRegister, gbc);

        lblMessage = new JLabel(" ");
        lblMessage.setForeground(Color.RED);
        gbc.gridy = labels.length + 2;
        formPanel.add(lblMessage, gbc);

        JPanel footerPanel = new JPanel();
        JLabel loginLink = new JLabel("Sudah punya akun? Masuk di sini");
        loginLink.setForeground(new Color(0, 102, 204));
        loginLink.setCursor(new Cursor(Cursor.HAND_CURSOR));
        loginLink.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                dispose();
                new LoginView();
            }
        });
        footerPanel.add(loginLink);
        add(formPanel, BorderLayout.CENTER);
        add(footerPanel, BorderLayout.SOUTH);

        btnRegister.addActionListener(e -> register());
    }

    private void register() {
        String namaDepan = txtNamaDepan.getText().trim();
        String namaBelakang = txtNamaBelakang.getText().trim();
        String username = txtUsername.getText().trim();
        String password = new String(txtPassword.getPassword());
        String confirm = new String(txtConfirmPassword.getPassword());
        String noHp = txtNoHp.getText().trim();
        String email = txtEmail.getText().trim();
        String alamat = txtAlamat.getText().trim();

        // Validasi
        if (namaDepan.isEmpty() || username.isEmpty() || password.isEmpty() || noHp.isEmpty()) {
            lblMessage.setText("Field yang bertanda * harus diisi!");
            return;
        }
        if (!password.equals(confirm)) {
            lblMessage.setText("Password dan konfirmasi password tidak cocok!");
            return;
        }
        if (password.length() < 6) {
            lblMessage.setText("Password minimal 6 karakter!");
            return;
        }
        if (!Pattern.matches("\\d+", noHp)) {
            lblMessage.setText("No HP harus berupa angka!");
            return;
        }
        if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            lblMessage.setText("Format email tidak valid!");
            return;
        }

        boolean success = authController.registerPemilik(namaDepan + " " + namaBelakang, username, password, noHp, email, alamat);
        if (success) {
            JOptionPane.showMessageDialog(this, "Pendaftaran berhasil! Silakan login.");
            dispose();
            new LoginView();
        } else {
            lblMessage.setText("Username atau email sudah terdaftar!");
        }
    }
}