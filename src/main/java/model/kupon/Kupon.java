/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.kupon;

import java.time.LocalDate;

public class Kupon {
    private int id;
    private String kode;
    private String deskripsi;
    private double diskonPersen;
    private double diskonMaks;
    private double minimalPembelian;
    private LocalDate berlakuHingga;
    private boolean aktif;
    
    public Kupon(int id, String kode, String deskripsi, double diskonPersen, double diskonMaks,
                 double minimalPembelian, LocalDate berlakuHingga, boolean aktif) {
        this.id = id; this.kode = kode; this.deskripsi = deskripsi; this.diskonPersen = diskonPersen;
        this.diskonMaks = diskonMaks; this.minimalPembelian = minimalPembelian;
        this.berlakuHingga = berlakuHingga; this.aktif = aktif;
    }
    // getter/setter
    public String getKode() { return kode; }
    public double getDiskonPersen() { return diskonPersen; }
    public double getDiskonMaks() { return diskonMaks; }
    public double getMinimalPembelian() { return minimalPembelian; }
    public LocalDate getBerlakuHingga() { return berlakuHingga; }
    public boolean isAktif() { return aktif; }

    public String getDeskripsi() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getId() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}