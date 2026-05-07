/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.database;

import main.java.model.kupon.Kupon;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KuponDAO {
    
    public List<Kupon> getAllKupon() {
        List<Kupon> list = new ArrayList<>();
        String sql = "SELECT * FROM kupon";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Kupon k = new Kupon(rs.getInt("id_kupon"), rs.getString("kode"),
                        rs.getString("deskripsi"), rs.getDouble("diskon_persen"),
                        rs.getDouble("diskon_maks"), rs.getDouble("minimal_pembelian"),
                        rs.getDate("berlaku_hingga").toLocalDate(), rs.getBoolean("aktif"));
                list.add(k);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    public List<Kupon> getKuponAktif() {
        List<Kupon> list = new ArrayList<>();
        String sql = "SELECT * FROM kupon WHERE aktif = 1 AND berlaku_hingga >= CURDATE()";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Kupon k = new Kupon(rs.getInt("id_kupon"), rs.getString("kode"),
                        rs.getString("deskripsi"), rs.getDouble("diskon_persen"),
                        rs.getDouble("diskon_maks"), rs.getDouble("minimal_pembelian"),
                        rs.getDate("berlaku_hingga").toLocalDate(), true);
                list.add(k);
            }
        } catch (SQLException e) { 
            e.printStackTrace(); 
        }
        return list;
    }
    
    public Kupon validasiKupon(String kode, double total) {
        // cek apakah kode valid dan memenuhi minimal pembelian
        String sql = "SELECT * FROM kupon WHERE kode = ? AND aktif = 1 AND berlaku_hingga >= CURDATE() AND minimal_pembelian <= ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, kode);
            ps.setDouble(2, total);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Kupon(rs.getInt("id_kupon"), rs.getString("kode"),
                        rs.getString("deskripsi"), rs.getDouble("diskon_persen"),
                        rs.getDouble("diskon_maks"), rs.getDouble("minimal_pembelian"),
                        rs.getDate("berlaku_hingga").toLocalDate(), true);
            }
        } catch (SQLException e) { 
            e.printStackTrace(); 
        }
        return null;
    }
    
    public boolean insertKupon(Kupon kupon) {
        String sql = "INSERT INTO kupon (kode, deskripsi, diskon_persen, diskon_maks, minimal_pembelian, berlaku_hingga, aktif) VALUES (?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, kupon.getKode());
            ps.setString(2, kupon.getDeskripsi());
            ps.setDouble(3, kupon.getDiskonPersen());
            ps.setDouble(4, kupon.getDiskonMaks());
            ps.setDouble(5, kupon.getMinimalPembelian());
            ps.setDate(6, Date.valueOf(kupon.getBerlakuHingga()));
            ps.setBoolean(7, true);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    
    public boolean updateKupon(Kupon kupon) {
        String sql = "UPDATE kupon SET kode=?, deskripsi=?, diskon_persen=?, diskon_maks=?, minimal_pembelian=?, berlaku_hingga=?, aktif=? WHERE id_kupon=?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, kupon.getKode());
            ps.setString(2, kupon.getDeskripsi());
            ps.setDouble(3, kupon.getDiskonPersen());
            ps.setDouble(4, kupon.getDiskonMaks());
            ps.setDouble(5, kupon.getMinimalPembelian());
            ps.setDate(6, Date.valueOf(kupon.getBerlakuHingga()));
            ps.setBoolean(7, kupon.isAktif());
            ps.setInt(8, kupon.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    
    public boolean deleteKupon(int id) {
        String sql = "DELETE FROM kupon WHERE id_kupon = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
}