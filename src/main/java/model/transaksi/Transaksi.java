/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.transaksi;

import java.time.LocalDateTime;

public abstract class Transaksi {
    protected int id, idUser, idDokter, idPet;
    protected LocalDateTime waktuTransaksi;
    protected double totalBayar;
    protected StatusTransaksi status;
    
    public Transaksi(int id, int idUser, int idDokter, int idPet, LocalDateTime waktuTransaksi, double totalBayar, StatusTransaksi status) {
        this.id = id; this.idUser = idUser; this.idDokter = idDokter; this.idPet = idPet;
        this.waktuTransaksi = waktuTransaksi; this.totalBayar = totalBayar; this.status = status;
    }
    public abstract void prosesPembayaran();
    // getter/setter
    public int getIdUser() { return idUser; }
    public int getIdDokter() { return idDokter; }
    public int getIdPet() { return idPet; }
    public double getTotalBayar() { return totalBayar; }
}