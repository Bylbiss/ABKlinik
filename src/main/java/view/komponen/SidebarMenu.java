/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.komponen;

import javax.swing.*;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeCellRenderer;
import java.awt.*;
import java.util.function.Consumer;

public class SidebarMenu extends JPanel {
    private JTree tree;
    private Consumer<String> onMenuSelected;

    public SidebarMenu(Consumer<String> onMenuSelected) {
        this.onMenuSelected = onMenuSelected;
        setLayout(new BorderLayout());
        setBackground(new Color(45, 45, 45));
        setPreferredSize(new Dimension(220, 0));

        // Root node
        DefaultMutableTreeNode root = new DefaultMutableTreeNode("Menu Utama");

        // Data Master
        DefaultMutableTreeNode dataMaster = new DefaultMutableTreeNode("📁 Data Master");
        DefaultMutableTreeNode dokterNode = new DefaultMutableTreeNode("📋 Data Dokter");
        DefaultMutableTreeNode pasienNode = new DefaultMutableTreeNode("👥 Data Pasien");
        dataMaster.add(dokterNode);
        dataMaster.add(pasienNode);

        // Diskon
        DefaultMutableTreeNode diskonNode = new DefaultMutableTreeNode("🏷️ Diskon");

        // Laporan (opsional)
        DefaultMutableTreeNode laporanNode = new DefaultMutableTreeNode("📊 Laporan");

        root.add(dataMaster);
        root.add(diskonNode);
        root.add(laporanNode);

        tree = new JTree(root);
        tree.setBackground(new Color(45, 45, 45));
        tree.setForeground(Color.WHITE);
        tree.setRowHeight(25);
        tree.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        tree.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Custom cell renderer untuk ikon
        DefaultTreeCellRenderer renderer = (DefaultTreeCellRenderer) tree.getCellRenderer();
        renderer.setBackgroundNonSelectionColor(new Color(45, 45, 45));
        renderer.setBackgroundSelectionColor(new Color(70, 70, 70));

        tree.addTreeSelectionListener(e -> {
            DefaultMutableTreeNode selected = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
            if (selected != null && selected.isLeaf()) {
                String menu = selected.toString();
                if (menu.equals("📋 Data Dokter")) onMenuSelected.accept("DOKTER");
                else if (menu.equals("👥 Data Pasien")) onMenuSelected.accept("PASIEN");
                else if (menu.equals("🏷️ Diskon")) onMenuSelected.accept("DISKON");
                else if (menu.equals("📊 Laporan")) onMenuSelected.accept("LAPORAN");
            }
        });

        add(new JScrollPane(tree), BorderLayout.CENTER);
    }
}}