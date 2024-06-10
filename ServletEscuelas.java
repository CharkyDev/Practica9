/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.practica9.resources;

import com.mycompany.practica9.Escuela;
import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tibur
 */
@WebServlet(name = "ServletEscuelas", urlPatterns = {"/ServletEscuelas"})
public class ServletEscuelas extends HttpServlet {

    Connection connect;
    Statement statement;
    ResultSet resultSet;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String URL ="jdbc:mysql://localhost/mrysiEscuelas?user=root&password=root";
            
            connect = DriverManager.getConnection(URL);
            statement =  connect.createStatement();
            
            request.setAttribute("ListaEscuelas", getListaEscuelas());
            
            connect.close();
        }catch(ClassNotFoundException | SQLException ex){
            System.out.println(ex);
        }
    }
    public List<Escuela> getListaEscuelas() throws SQLException{
        String query = "SELECT * from Escuelas";
        resultSet = statement.executeQuery(query);
        
        List<Escuela> Escuelas = new ArrayList();
        Escuela escuela;
        while(resultSet.next()){
            escuela = new Escuela();
            escuela.setClaveEscuela(resultSet.getString(1));
            escuela.setNombreEscuela(resultSet.getString(2));
            escuela.setDomicilio(resultSet.getString(3));
            escuela.setCodigoPostal(resultSet.getInt(4));
            escuela.setTurno(resultSet.getString(5));
            escuela.setIdLocalidad(resultSet.getInt(6));
            Escuelas.add(escuela);
        }
        return Escuelas;
    }

}
