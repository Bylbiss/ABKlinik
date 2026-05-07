/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.model.dokter;

public enum Spesialisasi {
    UMUM("Dokter Umum"),
    PENYAKIT_DALAM("Spesialis Penyakit Dalam"),
    GIGI("Spesialis Gigi"),
    BEDAH("Spesialis Bedah"),
    KULIT("Spesialis Kulit"),
    PARASITOLOGI("Spesialis Parasitologi & Infeksi"),
    REPRODUKSI("Spesialis Reproduksi");
    
    private String displayName;
    Spesialisasi(String displayName) { this.displayName = displayName; }
    public String getDisplayName() { return displayName; }
}