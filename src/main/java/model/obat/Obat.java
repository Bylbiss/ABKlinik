/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.obat;

public class Obat {
    private int id;
    private String nama, deskripsi;
    private double harga;
    private int stok;
    
    public Obat(int id, String nama, String deskripsi, double harga, int stok) {
        this.id = id; this.nama = nama; this.deskripsi = deskripsi; this.harga = harga; this.stok = stok;
    }
    // getter
    public int getId() { return id; }
    public String getNama() { return nama; }
    public double getHarga() { return harga; }
}