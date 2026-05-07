/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.database;

import main.java.model.obat.Obat;
import main.java.model.obat.Resep;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ObatDAO {
    public List<Obat> getAllObat() {
        List<Obat> list = new ArrayList<>();
        String sql = "SELECT * FROM obat";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Obat o = new Obat(rs.getInt("id_obat"), rs.getString("nama_obat"),
                        rs.getString("deskripsi_obat"), rs.getDouble("harga"), rs.getInt("stok"));
                list.add(o);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    public List<Obat> getObatByResep(int idResep) {
        List<Obat> list = new ArrayList<>();
        String sql = "SELECT o.* FROM detail_resep d JOIN obat o ON d.id_obat = o.id_obat WHERE d.id_resep = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idResep);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Obat o = new Obat(rs.getInt("id_obat"), rs.getString("nama_obat"),
                        rs.getString("deskripsi_obat"), rs.getDouble("harga"), rs.getInt("stok"));
                list.add(o);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    public boolean insertResep(Resep resep) {
        // Implementasi simpan resep ke tabel resep_obat dan detail_resep
        // Sederhana: return true dummy
        return true;
    }
}