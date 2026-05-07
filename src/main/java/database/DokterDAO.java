/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.database;

import main.java.model.akun.Dokter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DokterDAO {
    public List<Dokter> getAllDokter() {
        List<Dokter> list = new ArrayList<>();
        String sql = "SELECT * FROM dokter";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Dokter d = new Dokter(rs.getInt("id_dokter"), rs.getString("username"),
                        rs.getString("password"), rs.getString("nama_depan") + " " + rs.getString("nama_belakang"),
                        rs.getString("email"), rs.getString("no_hp"),
                        rs.getString("spesialisasi"), rs.getDouble("biaya_konsultasi"), 0);
                list.add(d);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    public boolean updateBiayaKonsultasi(int idDokter, double biayaBaru) {
        String sql = "UPDATE dokter SET biaya_konsultasi = ? WHERE id_dokter = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, biayaBaru);
            ps.setInt(2, idDokter);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    
    public boolean insertDokter(Dokter dokter) {
        // implementasi insert, asumsi ada method getters
        return true;
    }
    
    public boolean deleteDokter(int id) {
        String sql = "DELETE FROM dokter WHERE id_dokter = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
}