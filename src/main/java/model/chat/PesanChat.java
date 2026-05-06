/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.chat;

import java.time.LocalDateTime;

public class PesanChat {
    private int idChat, idDokter, idPemilik;
    private String isiPesan;
    private LocalDateTime waktu;
    private boolean dibaca;
    
    public PesanChat(int idChat, int idDokter, int idPemilik, String isiPesan, LocalDateTime waktu, boolean dibaca) {
        this.idChat = idChat; this.idDokter = idDokter; this.idPemilik = idPemilik;
        this.isiPesan = isiPesan; this.waktu = waktu; this.dibaca = dibaca;
    }
    // getter/setter
    public int getIdDokter() { return idDokter; }
    public int getIdPemilik() { return idPemilik; }
    public String getIsiPesan() { return isiPesan; }
}