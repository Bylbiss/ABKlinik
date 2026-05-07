/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.user;

import main.java.database.TransaksiDAO;
import main.java.model.transaksi.TransaksiChat;
import main.java.model.transaksi.TransaksiOffline;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class TransaksiController {
    private TransaksiDAO transaksiDAO = new TransaksiDAO();
    
    public void buatTransaksiChat(TransaksiChat transaksi, Consumer<Integer> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> transaksiDAO.insertTransaksiChat(transaksi), onSuccess, onError).execute();
    }
    
    public void buatTransaksiOffline(TransaksiOffline transaksi, Consumer<String> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> transaksiDAO.insertTransaksiOffline(transaksi), onSuccess, onError).execute();
    }
    
    public void getRiwayatUser(int idUser, Consumer<List<Object>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> transaksiDAO.getRiwayatByUser(idUser), onSuccess, onError).execute();
    }
}