/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.transaksi;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class TransaksiOffline extends Transaksi {
    private String keluhan;
    private LocalDate tanggalAntrean;
    private LocalTime waktuAntrean;
    private String nomorAntrean;
    
    public TransaksiOffline(int id, int idUser, int idDokter, int idPet, double totalBayar,
                            String keluhan, LocalDate tanggalAntrean, LocalTime waktuAntrean) {
        super(id, idUser, idDokter, idPet, LocalDateTime.now(), totalBayar, StatusTransaksi.MENUNGGU);
        this.keluhan = keluhan; this.tanggalAntrean = tanggalAntrean; this.waktuAntrean = waktuAntrean;
    }
    
    @Override
    public void prosesPembayaran() {}
    
    public String getKeluhan() { return keluhan; }
    public LocalDate getTanggalAntrean() { return tanggalAntrean; }
    public LocalTime getWaktuAntrean() { return waktuAntrean; }
    public void setNomorAntrean(String nomorAntrean) { this.nomorAntrean = nomorAntrean; }
}