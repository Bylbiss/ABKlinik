/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.auth;

import main.java.database.AkunDAO;
import main.java.model.akun.Akun;
import main.java.thread.DatabaseTaskThread;

public class LoginController {
    private AkunDAO akunDAO = new AkunDAO();

    public void login(String username, String password, String role,
                      java.util.function.Consumer<Akun> onSuccess,
                      java.util.function.Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> akunDAO.autentikasi(username, password, role),
                onSuccess, onError).execute();
    }
}