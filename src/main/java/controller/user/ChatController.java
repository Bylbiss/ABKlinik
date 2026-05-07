/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.user;

import main.java.database.TransaksiDAO;
import main.java.model.chat.PesanChat;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class ChatController {
    private TransaksiDAO transaksiDAO = new TransaksiDAO();
    
    public void kirimPesan(PesanChat pesan, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> transaksiDAO.insertChat(pesan), onSuccess, onError).execute();
    }
    
    public void getPesanByPemesanan(int idPemesanan, String tipe, Consumer<List<PesanChat>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> transaksiDAO.getChatByPemesanan(idPemesanan, tipe), onSuccess, onError).execute();
    }
}