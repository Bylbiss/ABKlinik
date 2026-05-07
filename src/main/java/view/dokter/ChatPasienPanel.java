/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.view.dokter;

import main.java.controller.user.ChatController;
import main.java.model.akun.Dokter;

import javax.swing.*;
import java.awt.*;

public class ChatPasienPanel extends JPanel {
    private Dokter dokter;
    private ChatController chatController = new ChatController();
    private JTextArea chatArea;
    private JTextField inputField;
    
    public ChatPasienPanel(Dokter dokter) {
        this.dokter = dokter;
        setLayout(new BorderLayout());
        chatArea = new JTextArea();
        chatArea.setEditable(false);
        add(new JScrollPane(chatArea), BorderLayout.CENTER);
        inputField = new JTextField();
        add(inputField, BorderLayout.SOUTH);
        // TODO: load chat history
    }
}