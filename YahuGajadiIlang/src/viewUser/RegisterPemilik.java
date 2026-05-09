/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package viewUser;

import config.Koneksi;
import javax.swing.*;
import java.awt.*;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author LOQ
 */
public class RegisterPemilik extends JFrame {
    private JTextField txtNamaDepan, txtNamaBelakang, txtUsername, txtEmail, txtNoHp, txtAlamat;
    private JPasswordField txtPassword;
    private JTextField txtNamaPet, txtRas, txtBerat;
    private JComboBox<String> cbJenisKelamin, cbJenisHewan, cbSterilisasi;
    private JButton btnDaftar, btnKeLogin;

    public RegisterPemilik() {
        setTitle("Daftar Akun Baru - ABPaw");
        setSize(550, 650);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);
        initUI();
    }

    private void initUI() {
        JPanel mainPanel = new JPanel(new BorderLayout());
        mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        // Form data pemilik
        JPanel panelPemilik = new JPanel(new GridLayout(8, 2, 5, 5));
        panelPemilik.setBorder(BorderFactory.createTitledBorder("Data Diri Pemilik"));

        panelPemilik.add(new JLabel("Nama Depan:"));
        txtNamaDepan = new JTextField(); panelPemilik.add(txtNamaDepan);
        panelPemilik.add(new JLabel("Nama Belakang:"));
        txtNamaBelakang = new JTextField(); panelPemilik.add(txtNamaBelakang);
        panelPemilik.add(new JLabel("Username:"));
        txtUsername = new JTextField(); panelPemilik.add(txtUsername);
        panelPemilik.add(new JLabel("Password:"));
        txtPassword = new JPasswordField(); panelPemilik.add(txtPassword);
        panelPemilik.add(new JLabel("Email:"));
        txtEmail = new JTextField(); panelPemilik.add(txtEmail);
        panelPemilik.add(new JLabel("No HP:"));
        txtNoHp = new JTextField(); panelPemilik.add(txtNoHp);
        panelPemilik.add(new JLabel("Alamat:"));
        txtAlamat = new JTextField(); panelPemilik.add(txtAlamat);

        // Form data hewan pertama
        JPanel panelPet = new JPanel(new GridLayout(7, 2, 5, 5));
        panelPet.setBorder(BorderFactory.createTitledBorder("Data Hewan Peliharaan Pertama"));

        panelPet.add(new JLabel("Nama Hewan:"));
        txtNamaPet = new JTextField(); panelPet.add(txtNamaPet);
        panelPet.add(new JLabel("Jenis Kelamin:"));
        cbJenisKelamin = new JComboBox<>(new String[]{"jantan", "betina", "tidak_diketahui"}); panelPet.add(cbJenisKelamin);
        panelPet.add(new JLabel("Jenis Hewan:"));
        cbJenisHewan = new JComboBox<>(new String[]{"sapi","kambing","kerbau","ayam","kucing","kelinci","anjing","hamster","burung","ikan","musang","kura-kura","landak","babi","kuda","domba","monyet"}); panelPet.add(cbJenisHewan);
        panelPet.add(new JLabel("Ras:"));
        txtRas = new JTextField(); panelPet.add(txtRas);
        panelPet.add(new JLabel("Tanggal Lahir (YYYY-MM-DD):"));
        JTextField txtTglLahir = new JTextField(); panelPet.add(txtTglLahir);
        panelPet.add(new JLabel("Berat (kg):"));
        txtBerat = new JTextField(); panelPet.add(txtBerat);
        panelPet.add(new JLabel("Sterilisasi:"));
        cbSterilisasi = new JComboBox<>(new String[]{"belum", "sudah"}); panelPet.add(cbSterilisasi);

        // Tombol
        JPanel btnPanel = new JPanel(new FlowLayout());
        btnDaftar = new JButton("Daftar");
        btnKeLogin = new JButton("Sudah punya akun? Login");
        btnPanel.add(btnDaftar);
        btnPanel.add(btnKeLogin);

        mainPanel.add(panelPemilik, BorderLayout.NORTH);
        mainPanel.add(panelPet, BorderLayout.CENTER);
        mainPanel.add(btnPanel, BorderLayout.SOUTH);

        add(mainPanel);

        btnDaftar.addActionListener(e -> register(txtTglLahir.getText()));
        btnKeLogin.addActionListener(e -> {
            dispose();
            new main.LoginFrame().setVisible(true);
        });
    }

    private void register(String tglLahirStr) {
        // Validasi
        if (txtNamaDepan.getText().isEmpty() || txtUsername.getText().isEmpty() || txtPassword.getPassword().length == 0) {
            JOptionPane.showMessageDialog(this, "Nama depan, username, password harus diisi!");
            return;
        }

        try (Connection conn = Koneksi.getConnection()) {
            conn.setAutoCommit(false);

            // Insert ke tabel pemilik
            String sqlPemilik = "INSERT INTO pemilik (nama_pemilik, username, password, email, no_hp, alamat) VALUES (?,?,?,?,?,?)";
            int idPemilik = -1;
            try (PreparedStatement ps = conn.prepareStatement(sqlPemilik, Statement.RETURN_GENERATED_KEYS)) {
                String namaLengkap = txtNamaDepan.getText() + " " + txtNamaBelakang.getText();
                ps.setString(1, namaLengkap);
                ps.setString(2, txtUsername.getText());
                ps.setString(3, new String(txtPassword.getPassword()).trim());
                ps.setString(4, txtEmail.getText());
                ps.setString(5, txtNoHp.getText());
                ps.setString(6, txtAlamat.getText());
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) idPemilik = rs.getInt(1);
            }
            if (idPemilik == -1) throw new SQLException("Gagal insert pemilik");

            // Insert ke tabel pets
            if (!txtNamaPet.getText().isEmpty()) {
                Date tglLahir = null;
                Integer usia = null;
                if (!tglLahirStr.isEmpty()) {
                    tglLahir = Date.valueOf(tglLahirStr);
                    usia = Period.between(tglLahir.toLocalDate(), LocalDate.now()).getYears();
                }
                double berat = 0;
                try { berat = Double.parseDouble(txtBerat.getText()); } catch (Exception e) {}

                String sqlPet = "INSERT INTO pets (id_pemilik, nama_pet, jenis_kelamin, jenis_hewan, ras, tanggal_lahir, usia, berat, sterilisasi) VALUES (?,?,?,?,?,?,?,?,?)";
                try (PreparedStatement ps = conn.prepareStatement(sqlPet)) {
                    ps.setInt(1, idPemilik);
                    ps.setString(2, txtNamaPet.getText());
                    ps.setString(3, (String) cbJenisKelamin.getSelectedItem());
                    ps.setString(4, (String) cbJenisHewan.getSelectedItem());
                    ps.setString(5, txtRas.getText());
                    ps.setDate(6, tglLahir);
                    ps.setObject(7, usia);
                    ps.setDouble(8, berat);
                    ps.setString(9, (String) cbSterilisasi.getSelectedItem());
                    ps.executeUpdate();
                }
            }

            conn.commit();
            JOptionPane.showMessageDialog(this, "Pendaftaran berhasil! Silakan login.");
            dispose();
            new main.LoginFrame().setVisible(true);
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Gagal daftar: " + ex.getMessage());
        }
    }
}
