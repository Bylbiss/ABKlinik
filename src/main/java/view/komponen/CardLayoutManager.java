/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.komponen;

import javax.swing.*;
import java.awt.*;

public class CardLayoutManager {
    private JPanel container;
    private CardLayout layout;
    
    public CardLayoutManager(JPanel container) {
        this.container = container;
        this.layout = new CardLayout();
        container.setLayout(layout);
    }
    
    public void addPanel(String name, JPanel panel) {
        container.add(panel, name);
    }
    
    public void showPanel(String name) {
        layout.show(container, name);
    }
}