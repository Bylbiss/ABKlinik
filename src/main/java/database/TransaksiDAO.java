/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.database;

import main.java.model.chat.PesanChat;
import main.java.model.transaksi.TransaksiChat;
import main.java.model.transaksi.TransaksiOffline;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransaksiDAO {
    
    public int insertTransaksiChat(TransaksiChat transaksi) {
        String sql = "INSERT INTO pemesanan_online (kode_pemesanan, id_pemilik, id_dokter, id_pet, tanggal_konsultasi, waktu_konsultasi, keluhan, biaya_konsultasi, total_biaya, status_pemesanan, waktu_pemesanan) VALUES (?,?,?,?,?,?,?,?,?,?,NOW())";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, generateKode());
            ps.setInt(2, transaksi.getIdUser());
            ps.setInt(3, transaksi.getIdDokter());
            ps.setInt(4, transaksi.getIdPet());
            ps.setDate(5, Date.valueOf(transaksi.getTanggalKonsultasi()));
            ps.setString(6, transaksi.getWaktuKonsultasi());
            ps.setString(7, transaksi.getKeluhan());
            ps.setDouble(8, transaksi.getBiayaKonsultasi());
            ps.setDouble(9, transaksi.getTotalBayar());
            ps.setString(10, "menunggu");
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) { e.printStackTrace(); }
        return -1;
    }
    
    public String insertTransaksiOffline(TransaksiOffline transaksi) {
        String sql = "INSERT INTO pemesanan_offline (id_dokter, id_pemilik, id_pet, nomor_antrean, tanggal_antrean, waktu_antrean, keluhan, status_antrean) VALUES (?,?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String nomorAntrean = generateAntrean(transaksi.getIdDokter());
            ps.setInt(1, transaksi.getIdDokter());
            ps.setInt(2, transaksi.getIdUser());
            ps.setInt(3, transaksi.getIdPet());
            ps.setString(4, nomorAntrean);
            ps.setDate(5, Date.valueOf(transaksi.getTanggalAntrean()));
            ps.setTime(6, Time.valueOf(transaksi.getWaktuAntrean() + ":00"));
            ps.setString(7, transaksi.getKeluhan());
            ps.setString(8, "menunggu");
            ps.executeUpdate();
            return nomorAntrean;
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }
    
    public List<Object> getRiwayatByUser(int idUser) {
        // Gabungan online dan offline
        List<Object> list = new ArrayList<>();
        // Ambil dari pemesanan_online
        String sqlOnline = "SELECT * FROM pemesanan_online WHERE id_pemilik = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sqlOnline)) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("kode_pemesanan") + " - " + rs.getString("status_pemesanan"));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        String sqlOffline = "SELECT * FROM pemesanan_offline WHERE id_pemilik = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sqlOffline)) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add("Antrean " + rs.getString("nomor_antrean") + " - " + rs.getString("status_antrean"));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    public boolean updateStatusOnline(int idPemesanan, String status) {
        String sql = "UPDATE pemesanan_online SET status_pemesanan = ? WHERE id_pemesanan = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, idPemesanan);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    
    public boolean updateStatusOffline(int idAntrean, String status) {
        String sql = "UPDATE pemesanan_offline SET status_antrean = ? WHERE id_antrean = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, idAntrean);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    
    public boolean insertChat(PesanChat pesan) {
        String sql = "INSERT INTO chat (id_dokter, id_pemilik, pesan, status_baca) VALUES (?,?,?,?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pesan.getIdDokter());
            ps.setInt(2, pesan.getIdPemilik());
            ps.setString(3, pesan.getIsiPesan());
            ps.setString(4, "unread");
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    
    public List<PesanChat> getChatByPemesanan(int idPemesanan, String tipe) {
        // Untuk sederhana, ambil berdasarkan id_dokter dan id_pemilik dari pemesanan.
        // Tidak diimplementasi detail.
        return new ArrayList<>();
    }
    
    private String generateKode() {
        return "INV-" + System.currentTimeMillis();
    }
    
    private String generateAntrean(int idDokter) {
        return "A-" + idDokter + "-" + (System.currentTimeMillis() % 10000);
    }
}