/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.bean;

import java.io.Serializable;

/**
 *
 * @author Simon
 */
public class Listado implements Serializable{
    private String listado[];
    public Listado() {
        listado = new String[]{"Pedro","Laura","Inés","Hector","Miguel"};
    }

    public String[] getListado() {
        return listado;
    }
    
    
    
}
