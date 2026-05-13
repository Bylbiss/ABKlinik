/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.view.pemilik;

import abpaw.controller.ChatController;
import abpaw.model.entity.Chat;
import abpaw.model.entity.Dokter;
import abpaw.model.entity.User;
import abpaw.view.components.RoundedPanel;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.sql.Timestamp;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class ChatDetailView extends JFrame {
    private User pemilik;
    private Dokter dokter;
    private ChatController chatController;
    private JTextArea chatArea;
    private JTextField messageField;
    private JButton sendButton;
    private Timer refreshTimer;

    public ChatDetailView(User pemilik, Dokter dokter) {
        this.pemilik = pemilik;
        this.dokter = dokter;
        this.chatController = new ChatController();
        initComponents();
        setLocationRelativeTo(null);
        setVisible(true);
        loadChatHistory();
        startAutoRefresh();
    }

    private void initComponents() {
        setTitle("Chat dengan Dr. " + dokter.getNamaLengkap());
        setSize(500, 600);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new BorderLayout(5, 5));

        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.setBackground(new Color(0, 102, 204));
        topPanel.setBorder(new EmptyBorder(10, 10, 10, 10));
        JLabel nameLabel = new JLabel("Dr. " + dokter.getNamaLengkap());
        nameLabel.setFont(new Font("Arial", Font.BOLD, 16));
        nameLabel.setForeground(Color.WHITE);
        topPanel.add(nameLabel, BorderLayout.WEST);
        add(topPanel, BorderLayout.NORTH);

        chatArea = new JTextArea();
        chatArea.setEditable(false);
        chatArea.setLineWrap(true);
        chatArea.setWrapStyleWord(true);
        chatArea.setFont(new Font("Monospaced", Font.PLAIN, 12));
        JScrollPane scrollPane = new JScrollPane(chatArea);
        scrollPane.setBorder(BorderFactory.createTitledBorder("Riwayat Chat"));
        add(scrollPane, BorderLayout.CENTER);

        JPanel bottomPanel = new JPanel(new BorderLayout(5, 5));
        bottomPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
        messageField = new JTextField();
        sendButton = new JButton("Kirim");
        sendButton.setBackground(new Color(0, 102, 204));
        sendButton.setForeground(Color.WHITE);
        bottomPanel.add(messageField, BorderLayout.CENTER);
        bottomPanel.add(sendButton, BorderLayout.EAST);
        add(bottomPanel, BorderLayout.SOUTH);

        sendButton.addActionListener(this::sendMessage);
        messageField.addActionListener(this::sendMessage);
    }

    private void loadChatHistory() {
        List<Chat> chats = chatController.getChatBetween(dokter.getIdDokter(), pemilik.getIdPemilik());
        chatArea.setText("");
        for (Chat c : chats) {
            String sender = (c.getIdDokter() != null) ? "Dokter" : "Anda";
            chatArea.append("[" + c.getWaktu() + "] " + sender + ": " + c.getPesan() + "\n");
        }
        // Scroll ke bawah
        chatArea.setCaretPosition(chatArea.getDocument().getLength());
    }

    private void sendMessage(ActionEvent e) {
        String pesan = messageField.getText().trim();
        if (pesan.isEmpty()) return;
        boolean success = chatController.sendMessageFromPemilik(pemilik.getIdPemilik(), dokter.getIdDokter(), pesan);
        if (success) {
            messageField.setText("");
            loadChatHistory();
        } else {
            JOptionPane.showMessageDialog(this, "Gagal mengirim pesan.");
        }
    }

    private void startAutoRefresh() {
        refreshTimer = new Timer(true);
        refreshTimer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                SwingUtilities.invokeLater(() -> loadChatHistory());
            }
        }, 3000, 3000);
    }

    @Override
    public void dispose() {
        if (refreshTimer != null) refreshTimer.cancel();
        super.dispose();
    }
}