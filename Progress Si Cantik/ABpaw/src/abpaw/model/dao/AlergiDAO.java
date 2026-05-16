/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.model.dao;

import abpaw.model.entity.Alergi;
import abpaw.model.db.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlergiDAO {
    
    public List<Alergi> getAlergiByPet(int idPet) {
        List<Alergi> list = new ArrayList<>();
        String sql = "SELECT * FROM alergi_pet WHERE id_pet = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPet);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Alergi a = new Alergi();
                a.setIdAlergi(rs.getInt("id_alergi"));
                a.setIdPet(rs.getInt("id_pet"));
                a.setIdObat(rs.getInt("id_obat"));
                a.setNamaAlergi(rs.getString("nama_alergi"));
                a.setCreatedByType(rs.getString("created_by_type"));
                a.setCreatedById(rs.getInt("created_by_id"));
                a.setStatus(rs.getString("status"));
                a.setVerifiedBy(rs.getInt("verified_by"));
                a.setVerifiedAt(rs.getTimestamp("verified_at"));
                a.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}