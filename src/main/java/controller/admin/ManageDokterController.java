/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.admin;

import main.java.database.DokterDAO;
import main.java.model.akun.Dokter;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class ManageDokterController {
    private DokterDAO dokterDAO = new DokterDAO();

    public void getAllDokter(Consumer<List<Dokter>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(dokterDAO::getAllDokter, onSuccess, onError).execute();
    }
    
    public void updateBiayaDokter(int idDokter, double biayaBaru, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> dokterDAO.updateBiayaKonsultasi(idDokter, biayaBaru), onSuccess, onError).execute();
    }
    
    public void tambahDokter(Dokter dokter, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> dokterDAO.insertDokter(dokter), onSuccess, onError).execute();
    }
    
    public void hapusDokter(int idDokter, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> dokterDAO.deleteDokter(idDokter), onSuccess, onError).execute();
    }
}