/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appdkempresa.java.Model;


/**
 *
 * @author kaleb
 */
public class Produto {
    private int id;
    private String nome;
    private String descricao;
    private String ingredientes;
    private int Qtd;
    public Produto( int id,String name ,String descricao,String ingredientes) {
        this.nome = name;
        this.id = id;
        this.descricao = descricao;
        this.ingredientes = ingredientes;
    }

    public int getQtd() {
        return Qtd;
    }

    public void setQtd(int Qtd) {
        this.Qtd = Qtd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    @Override
    public String toString() {
        return nome;
    }
 
}
