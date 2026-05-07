/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.util;

public class Validator {
    public static boolean isEmailValid(String email) {
        return email != null && email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$");
    }
    
    public static boolean isNoHpValid(String noHp) {
        return noHp != null && noHp.matches("\\d{10,13}");
    }
    
    public static boolean isPasswordValid(String pass) {
        return pass != null && pass.length() >= main.java.config.AppConfig.MIN_PASSWORD_LENGTH;
    }
}