/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.database;

import main.java.model.hewan.Hewan;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HewanDAO {
    public List<Hewan> getHewanByPemilik(int idPemilik) {
        List<Hewan> list = new ArrayList<>();
        String sql = "SELECT * FROM pets WHERE id_pemilik = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idPemilik);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Hewan h = new Hewan(rs.getInt("id_pet"), idPemilik, rs.getString("nama_pet"),
                        rs.getString("jenis_hewan"), rs.getString("usia"));
                list.add(h);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean tambahHewan(Hewan hewan) {
        String sql = "INSERT INTO pets (id_pemilik, nama_pet, jenis_hewan, usia) VALUES (?,?,?,?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, hewan.getIdUser());
            ps.setString(2, hewan.getNama());
            ps.setString(3, hewan.getJenis());
            ps.setString(4, hewan.getUmur());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
}