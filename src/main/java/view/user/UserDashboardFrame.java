/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.user;

import java.awt.CardLayout;
import main.java.model.akun.User;
import main.java.view.utama.DashboardFrame;
import javax.swing.*;

public final class UserDashboardFrame extends DashboardFrame {
    private User user;
    public UserDashboardFrame(User user) {
        super("Dashboard User - " + user.getNamaLengkap());
        this.user = user;
        initMenu();
    }
    @Override protected void initMenu() {
        JLabel welcome = new JLabel("Selamat datang, " + user.getNamaLengkap(), SwingConstants.CENTER);
        contentPanel.add(welcome, "welcome");
        ((CardLayout)contentPanel.getLayout()).show(contentPanel, "welcome");
    }
}