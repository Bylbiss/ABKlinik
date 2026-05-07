/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.user;

import main.java.model.akun.User;
import main.java.controller.user.ChatController;

import javax.swing.*;
import java.awt.*;

public class ChatDokterPanel extends JPanel {
    private User user;
    private ChatController chatController = new ChatController();
    
    public ChatDokterPanel(User user) {
        this.user = user;
        setLayout(new BorderLayout());
        JTextArea chatArea = new JTextArea();
        chatArea.setEditable(false);
        add(new JScrollPane(chatArea), BorderLayout.CENTER);
        JTextField input = new JTextField();
        add(input, BorderLayout.SOUTH);
        // TODO: load dokter list dan chat
    }
}