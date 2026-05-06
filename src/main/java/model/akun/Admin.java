/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.akun;

public class Admin extends Akun {
    public Admin(int id, String username, String password, String namaLengkap, String email, String noHp) {
        super(id, username, password, namaLengkap, email, noHp, "ADMIN");
    }
    @Override public void login() { System.out.println("Admin login: " + username); }
    @Override public void logout() { System.out.println("Admin logout"); }
}