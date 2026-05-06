/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.controller.admin;

import main.java.database.AkunDAO;
import main.java.model.akun.User;
import main.java.thread.DatabaseTaskThread;

import java.util.List;
import java.util.function.Consumer;

public class ManageUserController {
    private AkunDAO akunDAO = new AkunDAO();

    public void getAllUsers(Consumer<List<User>> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(akunDAO::getAllUsers, onSuccess, onError).execute();
    }
    
    public void updateUser(User user, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> akunDAO.updateUser(user), onSuccess, onError).execute();
    }
    
    public void deleteUser(int id, Consumer<Boolean> onSuccess, Consumer<Exception> onError) {
        new DatabaseTaskThread<>(() -> akunDAO.deleteUser(id), onSuccess, onError).execute();
    }
}