/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.utama;

import main.java.controller.auth.LoginController;
import main.java.model.akun.Akun;
import main.java.model.akun.Admin;
import main.java.model.akun.Dokter;
import main.java.model.akun.User;
import main.java.view.admin.AdminDashboardFrame;
import main.java.view.dokter.DokterDashboardFrame;
import main.java.view.user.UserDashboardFrame;

import javax.swing.*;
import java.awt.*;

public class LoginPanel extends JDialog {
    private JTextField tfUsername;
    private JPasswordField pfPassword;
    private JComboBox<String> cbRole; // ADMIN, DOKTER, USER
    private LoginController loginController = new LoginController();

    public LoginPanel(JFrame parent) {
        super(parent, "Login", true);
        setSize(350, 200);
        setLocationRelativeTo(parent);
        setLayout(new GridLayout(4,2));
        add(new JLabel("Username:"));
        tfUsername = new JTextField(); add(tfUsername);
        add(new JLabel("Password:"));
        pfPassword = new JPasswordField(); add(pfPassword);
        add(new JLabel("Role:"));
        cbRole = new JComboBox<>(new String[]{"ADMIN","DOKTER","USER"}); add(cbRole);
        JButton btnLogin = new JButton("Login");
        add(btnLogin);
        JButton btnCancel = new JButton("Cancel");
        add(btnCancel);

        btnLogin.addActionListener(e -> doLogin());
        btnCancel.addActionListener(e -> dispose());
        setVisible(true);
    }

    private void doLogin() {
        String user = tfUsername.getText().trim();
        String pass = new String(pfPassword.getPassword());
        String role = (String) cbRole.getSelectedItem();
        loginController.login(user, pass, role, this::onSuccess, this::onError);
    }

    private void onSuccess(Akun akun) {
        if (akun == null) {
            JOptionPane.showMessageDialog(this, "Login gagal", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        dispose(); // tutup dialog
        if (akun instanceof Admin) {
            new AdminDashboardFrame((Admin) akun).setVisible(true);
        } else if (akun instanceof Dokter) {
            new DokterDashboardFrame((Dokter) akun).setVisible(true);
        } else {
            new UserDashboardFrame((User) akun).setVisible(true);
        }
    }

    private void onError(Exception e) {
        JOptionPane.showMessageDialog(this, "Error: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}