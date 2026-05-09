/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.view.pemilik;

import abpaw.controller.PemesananController;
import abpaw.controller.KuponController;
import abpaw.controller.PetsController;
import abpaw.model.entity.*;
import abpaw.view.components.RoundedPanel;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class PemesananOnlineView extends JDialog {
    private User pemilik;
    private Dokter dokter;
    private Pets selectedPet;
    private PemesananController pemesananController;
    private PetsController petsController;
    private KuponController kuponController;
    
    private JComboBox<Pets> cbPet;
    private JTextArea taKeluhan;
    private JTextField txtKupon;
    private JButton btnApplyKupon;
    private JLabel lblDiskon, lblTotal;
    private JComboBox<String> cbPembayaran;
    private JButton btnBayar;
    private JPanel jamPanel;
    private JComboBox<String> cbJam;
    private boolean modeLangsung; // true = pesan sekarang, false = pesan nanti
    private BigDecimal biayaAwal, diskon, total;
    private Kupon kuponTerpakai;
    
    public PemesananOnlineView(JFrame parent, User pemilik, Dokter dokter, boolean langsung) {
        super(parent, "Pemesanan Konsultasi Online", true);
        this.pemilik = pemilik;
        this.dokter = dokter;
        this.modeLangsung = langsung;
        this.pemesananController = new PemesananController();
        this.petsController = new PetsController();
        this.kuponController = new KuponController();
        
        initComponents();
        loadPets();
        loadJamJikaNanti();
        hitungBiaya();
        setSize(500, 550);
        setLocationRelativeTo(parent);
        setVisible(true);
    }
    
    private void initComponents() {
        setLayout(new BorderLayout());
        JPanel mainPanel = new JPanel(new GridBagLayout());
        mainPanel.setBorder(new EmptyBorder(15, 15, 15, 15));
        mainPanel.setBackground(Color.WHITE);
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(8, 8, 8, 8);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        
        // Label nama dokter
        mainPanel.add(new JLabel("Dokter: " + dokter.getNamaLengkap()), gbc);
        
        gbc.gridy++;
        mainPanel.add(new JLabel("Pilih Hewan:"), gbc);
        cbPet = new JComboBox<>();
        gbc.gridy++;
        mainPanel.add(cbPet, gbc);
        
        gbc.gridy++;
        mainPanel.add(new JLabel("Keluhan (opsional):"), gbc);
        taKeluhan = new JTextArea(3, 20);
        JScrollPane scrollKeluhan = new JScrollPane(taKeluhan);
        gbc.gridy++;
        mainPanel.add(scrollKeluhan, gbc);
        
        // Kupon
        gbc.gridy++;
        JPanel kuponPanel = new JPanel(new BorderLayout(5, 0));
        kuponPanel.setOpaque(false);
        txtKupon = new JTextField();
        btnApplyKupon = new JButton("Gunakan");
        btnApplyKupon.addActionListener(e -> applyKupon());
        kuponPanel.add(txtKupon, BorderLayout.CENTER);
        kuponPanel.add(btnApplyKupon, BorderLayout.EAST);
        mainPanel.add(new JLabel("Kode Kupon:"), gbc);
        gbc.gridy++;
        mainPanel.add(kuponPanel, gbc);
        
        // Diskon & total
        gbc.gridy++;
        mainPanel.add(new JLabel("Diskon:"), gbc);
        lblDiskon = new JLabel("Rp 0");
        gbc.gridy++;
        mainPanel.add(lblDiskon, gbc);
        gbc.gridy++;
        mainPanel.add(new JLabel("Total Biaya:"), gbc);
        lblTotal = new JLabel("");
        lblTotal.setFont(new Font("Arial", Font.BOLD, 14));
        gbc.gridy++;
        mainPanel.add(lblTotal, gbc);
        
        // Jika pesan nanti, tambahkan pilihan jam
        if (!modeLangsung) {
            gbc.gridy++;
            mainPanel.add(new JLabel("Pilih Jam Konsultasi:"), gbc);
            jamPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
            cbJam = new JComboBox<>();
            jamPanel.add(cbJam);
            gbc.gridy++;
            mainPanel.add(jamPanel, gbc);
        }
        
        // Metode pembayaran
        gbc.gridy++;
        mainPanel.add(new JLabel("Metode Pembayaran:"), gbc);
        cbPembayaran = new JComboBox<>(new String[]{"Bank Transfer", "E-Wallet", "Kartu Kredit"});
        gbc.gridy++;
        mainPanel.add(cbPembayaran, gbc);
        
        // Tombol bayar
        btnBayar = new JButton(modeLangsung ? "Bayar Sekarang" : "Pesan & Bayar Nanti");
        btnBayar.setBackground(new Color(0, 102, 204));
        btnBayar.setForeground(Color.WHITE);
        btnBayar.addActionListener(e -> prosesPemesanan());
        gbc.gridy++;
        mainPanel.add(btnBayar, gbc);
        
        add(mainPanel, BorderLayout.CENTER);
    }
    
    private void loadPets() {
        List<Pets> petsList = petsController.getPetsByPemilik(pemilik.getIdPemilik());
        cbPet.removeAllItems();
        for (Pets p : petsList) {
            cbPet.addItem(p);
        }
        if (petsList.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Anda belum memiliki hewan. Silakan tambahkan di menu Profil.");
            btnBayar.setEnabled(false);
        }
    }
    
    private void loadJamJikaNanti() {
        if (!modeLangsung) {
            // Jam operasional 09:00 - 17:00, interval 1 jam
            for (int i = 9; i <= 17; i++) {
                String jam = String.format("%02d:00", i);
                cbJam.addItem(jam);
            }
        }
    }
    
    private void hitungBiaya() {
        biayaAwal = dokter.getBiayaKonsultasi();
        diskon = (kuponTerpakai != null && kuponTerpakai.isValid()) ? 
                 kuponTerpakai.hitungPotongan(biayaAwal) : BigDecimal.ZERO;
        total = biayaAwal.subtract(diskon);
        if (total.compareTo(BigDecimal.ZERO) < 0) total = BigDecimal.ZERO;
        
        lblDiskon.setText("Rp " + diskon.toString());
        lblTotal.setText("Rp " + total.toString());
    }
    
    private void applyKupon() {
        String kode = txtKupon.getText().trim();
        if (kode.isEmpty()) return;
        Kupon kupon = kuponController.getKuponByKode(kode);
        if (kupon == null || !kupon.isValid()) {
            JOptionPane.showMessageDialog(this, "Kupon tidak valid atau sudah kadaluarsa.");
            return;
        }
        if (biayaAwal.compareTo(kupon.getMinimalPembelian()) < 0) {
            JOptionPane.showMessageDialog(this, "Minimal pembelian Rp " + kupon.getMinimalPembelian() + " untuk kupon ini.");
            return;
        }
        kuponTerpakai = kupon;
        hitungBiaya();
        JOptionPane.showMessageDialog(this, "Kupon berhasil digunakan! Diskon: " + kupon.getDiskonPersen() + "%");
    }
    
    private void prosesPemesanan() {
        Pets pet = (Pets) cbPet.getSelectedItem();
        if (pet == null) {
            JOptionPane.showMessageDialog(this, "Pilih hewan terlebih dahulu.");
            return;
        }
        String keluhan = taKeluhan.getText().trim();
        String kodeKupon = (kuponTerpakai != null) ? kuponTerpakai.getKode() : null;
        BigDecimal diskonFinal = diskon;
        BigDecimal totalFinal = total;
        
        if (modeLangsung) {
            // Pemesanan langsung: status = selesai? Atau langsung bayar dan masuk chat
            // Di sini kita buat pemesanan dengan status "sudah bayar"
            String kodePemesanan = "ONL" + System.currentTimeMillis();
            LocalDate tanggalKonsultasi = LocalDate.now();
            String waktuKonsultasi = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm"));
            PemesananOnline pesan = new PemesananOnline();
            pesan.setKodePemesanan(kodePemesanan);
            pesan.setIdPemilik(pemilik.getIdPemilik());
            pesan.setIdDokter(dokter.getIdDokter());
            pesan.setIdPet(pet.getIdPet());
            pesan.setTanggalKonsultasi(tanggalKonsultasi);
            pesan.setWaktuKonsultasi(waktuKonsultasi);
            pesan.setKeluhan(keluhan);
            pesan.setBiayaKonsultasi(biayaAwal);
            pesan.setKuponDigunakan(kodeKupon);
            pesan.setJumlahDiskon(diskonFinal);
            pesan.setTotalBiaya(totalFinal);
            pesan.setStatus("sudah bayar");
            pesan.setWaktuPemesanan(Timestamp.valueOf(LocalDateTime.now()));
            
            boolean success = pemesananController.createPemesananOnline(pesan);
            if (success) {
                JOptionPane.showMessageDialog(this, "Pembayaran berhasil! Anda akan diarahkan ke chat.");
                dispose();
                // Buka chat dengan dokter
                new ChatDetailView((JFrame) getParent(), pemilik, dokter);
            } else {
                JOptionPane.showMessageDialog(this, "Gagal memproses pemesanan.");
            }
        } else {
            // Pesan nanti: status menunggu, tampilkan struk
            String kodePemesanan = "ONL" + System.currentTimeMillis();
            LocalDate tanggalKonsultasi = LocalDate.now().plusDays(1); // contoh besok
            String waktuKonsultasi = (String) cbJam.getSelectedItem();
            PemesananOnline pesan = new PemesananOnline();
            pesan.setKodePemesanan(kodePemesanan);
            pesan.setIdPemilik(pemilik.getIdPemilik());
            pesan.setIdDokter(dokter.getIdDokter());
            pesan.setIdPet(pet.getIdPet());
            pesan.setTanggalKonsultasi(tanggalKonsultasi);
            pesan.setWaktuKonsultasi(waktuKonsultasi);
            pesan.setKeluhan(keluhan);
            pesan.setBiayaKonsultasi(biayaAwal);
            pesan.setKuponDigunakan(kodeKupon);
            pesan.setJumlahDiskon(diskonFinal);
            pesan.setTotalBiaya(totalFinal);
            pesan.setStatus("menunggu");
            pesan.setWaktuPemesanan(Timestamp.valueOf(LocalDateTime.now()));
            
            boolean success = pemesananController.createPemesananOnline(pesan);
            if (success) {
                JOptionPane.showMessageDialog(this, "Pesanan berhasil disimpan. Silakan lanjutkan pembayaran nanti.");
                dispose();
                // Tampilkan struk
                new StrukView((JFrame) getParent(), pesan);
            } else {
                JOptionPane.showMessageDialog(this, "Gagal menyimpan pesanan.");
            }
        }
    }
}