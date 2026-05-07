/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.hewan;

public class Hewan {
    private int id, idUser;
    private String nama, jenis, umur;

    public Hewan(int id, int idUser, String nama, String jenis, String umur) {
        this.id = id; this.idUser = idUser; this.nama = nama; this.jenis = jenis; this.umur = umur;
    }
    // getter/setter (singkat)
    public int getId() { return id; }
    public int getIdUser() { return idUser; }
    public String getNama() { return nama; }
    public String getJenis() { return jenis; }
    public String getUmur() { return umur; }
}