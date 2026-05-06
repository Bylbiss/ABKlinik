/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.util;

// Untuk demo, karena password plain text, biarkan saja. Tapi siapkan fungsi hash.
public class PasswordHasher {
    public static String hash(String plain) { return plain; } // plain, ganti dengan BCrypt jika perlu
    public static boolean verify(String plain, String hash) { return plain.equals(hash); }
}