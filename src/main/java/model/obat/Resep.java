/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.obat;

import java.util.List;

public class Resep {
    private int idResep, idPemesanan, idDokter;
    private String tipePemesanan; // online/offline
    private List<Obat> daftarObat;
    private String catatan;
    
    public Resep(int idResep, int idPemesanan, int idDokter, String tipePemesanan, List<Obat> daftarObat, String catatan) {
        this.idResep = idResep; this.idPemesanan = idPemesanan; this.idDokter = idDokter;
        this.tipePemesanan = tipePemesanan; this.daftarObat = daftarObat; this.catatan = catatan;
    }
    // getter/setter
}