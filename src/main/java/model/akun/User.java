/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.akun;

public class User extends Akun {
    private String alamat;

    public User(int id, String username, String password, String namaLengkap, String email, String noHp) {
        super(id, username, password, namaLengkap, email, noHp, "USER");
        this.alamat = "";
    }

    @Override
    public void login() { System.out.println("User login: " + username); }

    @Override
    public void logout() { System.out.println("User logout"); }

    public String getAlamat() { return alamat; }
    public void setAlamat(String alamat) { this.alamat = alamat; }

    public String getEmail() {
        return email;
    }
}