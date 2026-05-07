/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.user;

import main.java.database.HewanDAO;
import main.java.model.hewan.Hewan;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class HewanController {
    private HewanDAO hewanDAO = new HewanDAO();
    
    public void getHewanByPemilik(int idPemilik, Consumer<List<Hewan>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> hewanDAO.getHewanByPemilik(idPemilik), onSuccess, onError).execute();
    }
    
    public void tambahHewan(Hewan hewan, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> hewanDAO.tambahHewan(hewan), onSuccess, onError).execute();
    }
    
    public void updateHewan(Hewan hewan, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> hewanDAO.updateHewan(hewan), onSuccess, onError).execute();
    }
    
    public void hapusHewan(int idHewan, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> hewanDAO.deleteHewan(idHewan), onSuccess, onError).execute();
    }
}