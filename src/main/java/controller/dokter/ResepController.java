/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.dokter;

import main.java.database.ObatDAO;
import main.java.model.obat.Resep;
import main.java.thread.DatabaseTaskThread;

import java.util.function.Consumer;

public class ResepController {
    private ObatDAO obatDAO = new ObatDAO();
    
    public void simpanResep(Resep resep, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> obatDAO.insertResep(resep), onSuccess, onError).execute();
    }
}