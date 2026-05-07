/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.auth;

import main.java.database.AkunDAO;
import main.java.model.akun.User;
import main.java.thread.DatabaseTaskThread;

public class RegistrasiController {
    private AkunDAO akunDAO = new AkunDAO();

    public void registrasi(User user,
                           java.util.function.Consumer<Boolean> onSuccess,
                           java.util.function.Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> akunDAO.registrasiUser(user), onSuccess, onError).execute();
    }
}