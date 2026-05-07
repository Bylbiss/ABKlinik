/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.dokter;

import main.java.database.TransaksiDAO;
import main.java.thread.DatabaseTaskThread;

import java.util.function.Consumer;

public class StatusController {
    private TransaksiDAO transaksiDAO = new TransaksiDAO();
    
    public void updateStatusPemesananOnline(int idPemesanan, String statusBaru, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> transaksiDAO.updateStatusOnline(idPemesanan, statusBaru), onSuccess, onError).execute();
    }
    
    public void updateStatusAntreanOffline(int idAntrean, String statusBaru, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> transaksiDAO.updateStatusOffline(idAntrean, statusBaru), onSuccess, onError).execute();
    }
}