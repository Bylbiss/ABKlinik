/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.komponen;

import javax.swing.*;
import java.awt.*;
import java.util.HashMap;
import java.util.Map;

public class SidebarMenu extends JPanel {
    private Map<String, Runnable> actions = new HashMap<>();
    
    public SidebarMenu() {
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
        setBackground(new Color(240, 240, 240));
        setPreferredSize(new Dimension(200, 0));
    }
    
    public void addMenuItem(String name, Runnable action) {
        JButton btn = new JButton(name);
        btn.setAlignmentX(Component.CENTER_ALIGNMENT);
        btn.addActionListener(e -> action.run());
        add(btn);
        add(Box.createRigidArea(new Dimension(0, 5)));
        actions.put(name, action);
    }
}