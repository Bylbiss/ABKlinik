/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.utama;

import java.awt.CardLayout;
import javax.swing.*;

public abstract class DashboardFrame extends JFrame {
    protected JPanel contentPanel;

    public DashboardFrame(String title) {
        setTitle(title);
        setSize(1000, 700);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        contentPanel = new JPanel(new CardLayout());
        add(contentPanel);
    }
    protected abstract void initMenu();
}