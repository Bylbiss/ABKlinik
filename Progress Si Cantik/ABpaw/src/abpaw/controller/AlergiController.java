/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abpaw.controller;

import abpaw.model.dao.AlergiDAO;
import abpaw.model.entity.Alergi;
import java.util.List;

public class AlergiController {
    private AlergiDAO alergiDAO;
    
    public AlergiController() {
        alergiDAO = new AlergiDAO();
    }
    
    public List<Alergi> getAlergiByPet(int idPet) {
        return alergiDAO.getAlergiByPet(idPet);
    }
}