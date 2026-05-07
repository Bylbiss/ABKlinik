/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.admin;

import main.java.database.KuponDAO;
import main.java.model.kupon.Kupon;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class ManageKuponController {
    private KuponDAO kuponDAO = new KuponDAO();

    public void getAllKupon(Consumer<List<Kupon>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(kuponDAO::getAllKupon, onSuccess, onError).execute();
    }
    
    public void tambahKupon(Kupon kupon, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> kuponDAO.insertKupon(kupon), onSuccess, onError).execute();
    }
    
    public void updateKupon(Kupon kupon, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> kuponDAO.updateKupon(kupon), onSuccess, onError).execute();
    }
    
    public void hapusKupon(int id, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> kuponDAO.deleteKupon(id), onSuccess, onError).execute();
    }
}