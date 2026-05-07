/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.transaksi;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class TransaksiChat extends Transaksi {
    private String keluhan;
    private boolean isSekarang;
    private LocalDate tanggalKonsultasi;
    private String waktuKonsultasi; // format "HH:mm"
    private double biayaKonsultasi;
    
    public TransaksiChat(int id, int idUser, int idDokter, int idPet, double totalBayar, 
                         String keluhan, boolean isSekarang, LocalDate tanggalKonsultasi, 
                         String waktuKonsultasi, double biayaKonsultasi) {
        super(id, idUser, idDokter, idPet, LocalDateTime.now(), totalBayar, StatusTransaksi.MENUNGGU);
        this.keluhan = keluhan; this.isSekarang = isSekarang;
        this.tanggalKonsultasi = tanggalKonsultasi; this.waktuKonsultasi = waktuKonsultasi;
        this.biayaKonsultasi = biayaKonsultasi;
    }
    
    @Override
    public void prosesPembayaran() {
        // logic pembayaran
    }
    
    public String getKeluhan() { return keluhan; }
    public LocalDate getTanggalKonsultasi() { return tanggalKonsultasi; }
    public String getWaktuKonsultasi() { return waktuKonsultasi; }
    public double getBiayaKonsultasi() { return biayaKonsultasi; }
}