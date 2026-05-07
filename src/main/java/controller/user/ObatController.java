/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.user;

import main.java.database.ObatDAO;
import main.java.model.obat.Obat;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class ObatController {
    private ObatDAO obatDAO = new ObatDAO();
    
    public void getAllObat(Consumer<List<Obat>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(obatDAO::getAllObat, onSuccess, onError).execute();
    }
    
    public void getObatByResep(int idResep, Consumer<List<Obat>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> obatDAO.getObatByResep(idResep), onSuccess, onError).execute();
    }
}