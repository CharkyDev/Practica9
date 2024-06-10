/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Beans/Bean.java to edit this template
 */
package com.mycompany.practica9;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author tibur
 */
public class Escuela implements java.io.Serializable {
    
    
    private String claveEscuela;
    private String nombreEscuela;
    private String domicilio;
    private int codigoPostal;
    private String turno;
    private int idLocalidad;
    
    public void setClaveEscuela(String claveEscuela){
        this.claveEscuela = claveEscuela;
    }
    public void setNombreEscuela(String nombreEscuela){
        this.nombreEscuela = nombreEscuela;
    }
    public void setDomicilio(String domicilio){
        this.domicilio = domicilio;
    }
    
    public void setCodigoPostal(int codigoPostal){
        this.codigoPostal = codigoPostal;
    }
    public void setTurno(String turno){
        this.turno = turno;
    }
    public void setIdLocalidad(int idLocalidad){
        this.idLocalidad = idLocalidad;
    }
    public String getClaveEscuela(){
        return claveEscuela;
    }
    
}
