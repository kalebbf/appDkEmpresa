/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appdkempresa.java.Model;

import java.util.ArrayList;

/**
 *
 * @author kaleb
 */
public class PedidoSubmit {

    private Comprador comp;
    private ArrayList<Produto> listaProdutos;

    public PedidoSubmit(Comprador comp, ArrayList<Produto> listaProdutos) {
        this.comp = comp;
        this.listaProdutos = listaProdutos;
    }

    public PedidoSubmit(Comprador comprador) {
         this.comp = comprador;
    }

    public Comprador getComp() {
        return comp;
    }

    public void setComp(Comprador comp) {
        this.comp = comp;
    }

    public ArrayList<Produto> getListaProdutos() {
        return listaProdutos;
    }

    public void setListaProdutos(ArrayList<Produto> listaProdutos) {
        this.listaProdutos = listaProdutos;
    }

    
}
