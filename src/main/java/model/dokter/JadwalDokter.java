/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.dokter;

import java.time.LocalDateTime;

public class JadwalDokter {
    private int idDokter;
    private LocalDateTime mulai, selesai;
    private boolean available;
    
    public JadwalDokter(int idDokter, LocalDateTime mulai, LocalDateTime selesai, boolean available) {
        this.idDokter = idDokter; this.mulai = mulai; this.selesai = selesai; this.available = available;
    }
    // getter/setter
    public int getIdDokter() { return idDokter; }
    public boolean isAvailable() { return available; }
}