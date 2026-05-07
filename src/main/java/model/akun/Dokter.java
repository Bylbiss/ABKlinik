/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.akun;

public class Dokter extends Akun {
    private String spesialisasi;
    private double biayaKonsultasi;
    private double rating;

    public Dokter(int id, String username, String password, String namaLengkap, String email, String noHp,
                  String spesialisasi, double biayaKonsultasi, double rating) {
        super(id, username, password, namaLengkap, email, noHp, "DOKTER");
        this.spesialisasi = spesialisasi;
        this.biayaKonsultasi = biayaKonsultasi;
        this.rating = rating;
    }
    @Override public void login() { System.out.println("Dokter login: " + username); }
    @Override public void logout() { System.out.println("Dokter logout"); }

    public String getSpesialisasi() { return spesialisasi; }
    public double getBiayaKonsultasi() { return biayaKonsultasi; }
}