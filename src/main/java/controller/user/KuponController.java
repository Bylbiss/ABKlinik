/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.user;

import main.java.database.KuponDAO;
import main.java.model.kupon.Kupon;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class KuponController {
    private KuponDAO kuponDAO = new KuponDAO();
    
    public void getKuponAktif(Consumer<List<Kupon>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(kuponDAO::getKuponAktif, onSuccess, onError).execute();
    }
    
    public void validasiKupon(String kode, double total, Consumer<Kupon> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> KuponDAO.validasiKupon(kode, total), onSuccess, onError).execute();
    }
}