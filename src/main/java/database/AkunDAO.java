package main.java.database;

import main.java.model.akun.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AkunDAO {

    public Akun autentikasi(String usernameOrEmail, String password, String role) {
        String table = "";
        String userField = "";
        if (role.equals("ADMIN")) {
            table = "admin";
            userField = "username";
        } else if (role.equals("DOKTER")) {
            table = "dokter";
            userField = "username";
        } else if (role.equals("USER")) {
            table = "pemilik";
            userField = "email";
        } else return null;

        String sql = "SELECT * FROM " + table + " WHERE " + userField + " = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usernameOrEmail);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (role.equals("ADMIN")) {
                    return new Admin(rs.getInt("id_admin"), rs.getString("username"),
                            rs.getString("password"), rs.getString("nama"),
                            rs.getString("email"), "");
                } else if (role.equals("DOKTER")) {
                    return new Dokter(rs.getInt("id_dokter"), rs.getString("username"),
                            rs.getString("password"), rs.getString("nama_depan") + " " + rs.getString("nama_belakang"),
                            rs.getString("email"), rs.getString("no_hp"),
                            rs.getString("spesialisasi"), rs.getDouble("biaya_konsultasi"), 0);
                } else {
                    return new User(rs.getInt("id_pemilik"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("nama_pemilik"),
                            rs.getString("email"),
                            rs.getString("no_hp"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean registrasiUser(User user) {
        String sql = "INSERT INTO pemilik (nama_pemilik, email, password, no_hp, alamat) VALUES (?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getNamaLengkap());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getNoHp());
            ps.setString(5, user.getAlamat());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM pemilik";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                User u = new User(rs.getInt("id_pemilik"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("nama_pemilik"),
                        rs.getString("email"),
                        rs.getString("no_hp"));
                u.setAlamat(rs.getString("alamat"));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE pemilik SET nama_pemilik=?, password=?, no_hp=?, email=?, alamat=? WHERE id_pemilik=?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getNamaLengkap());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getNoHp());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getAlamat());
            ps.setInt(6, user.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int id) {
        String sql = "DELETE FROM pemilik WHERE id_pemilik = ?";
        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}