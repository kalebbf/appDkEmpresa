/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appdkempresa.java.Model;

import java.util.Date;

/**
 *
 * @author kaleb
 */
public class Comprador {
    private String nome;
    private int id;
    private Date dataInicio;

    public Comprador(String nome, int id, Date dataInicio) {
        this.nome = nome;
        this.id = id;
        this.dataInicio = dataInicio;
    }

    public Comprador(String string, int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    @Override
    public String toString() {
        return nome+" - "+dataInicio.toString();
    }
    
    
}
