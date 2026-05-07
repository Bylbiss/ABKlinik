/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.akun;

public abstract class Akun {
    protected int id;
    protected String username, password, namaLengkap, email, noHp, role;

    public Akun(int id, String username, String password, String namaLengkap, String email, String noHp, String role) {
        this.id = id; this.username = username; this.password = password;
        this.namaLengkap = namaLengkap; this.email = email; this.noHp = noHp; this.role = role;
    }
    public abstract void login();
    public abstract void logout();
    // getter/setter (sederhana, bisa auto-generate)
    public int getId() { return id; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getNamaLengkap() { return namaLengkap; }
    public String getRole() { return role; }
    public String getNoHp() { return noHp; }
    public void setPassword(String password) { this.password = password; }
    // tambahkan getter/setter lain jika diperlukan
}