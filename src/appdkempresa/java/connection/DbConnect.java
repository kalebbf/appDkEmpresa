/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appdkempresa.java.connection;

import appdkempresa.java.Model.Comprador;
import appdkempresa.java.Model.PedidoSubmit;
import appdkempresa.java.Model.Produto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kaleb
 */
public class DbConnect {

    private Connection con;
    private Statement stmt;
    private ResultSet rs;

    public DbConnect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dkbase", "root", "");
            stmt = con.createStatement();
        } catch (Exception ex) {
            System.out.println("Error db Connection : " + ex);
        }
    }

    public void getData() {
        try {
            String query = "select * from comprador";

            rs = stmt.executeQuery(query);
            System.out.println("Records from database");
            while (rs.next()) {
                String name = rs.getString("nome");
                System.out.println(name);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Produto> getProdutos() {
        ArrayList<Produto> listProd = new ArrayList<>();
        try {
            String query = "select * from produto";

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String name = rs.getString("nome");
                int id = rs.getInt("id");
                String descricao = rs.getString("descricao");
                String ingredientes = rs.getString("ingredientes");
                Produto prod = new Produto(
                        id, name, descricao, ingredientes
                );
                listProd.add(prod);

            }
            return listProd;
        } catch (Exception ex) {
            System.out.println(ex);
            return null;
        }

    }

    public ArrayList<Comprador> getRecebedores() {
        try {
            String query = "select * from comprador";

            ResultSet rs = stmt.executeQuery(query);
            ArrayList<Comprador> listaComp = new ArrayList<>();
            while (rs.next()) {
                String name = rs.getString("nome");
                int id = rs.getInt("id");
                Date dataInicio = rs.getDate("data_inicio");
                Comprador comprador = new Comprador(
                        name, id, dataInicio
                );
                listaComp.add(comprador);

            }
            return listaComp;
        } catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }

    public boolean insertNovoPedido(PedidoSubmit pedido) {
        String id = generatedIdRecibo();
        Date data = new Date();
        String query = "insert into recibos(id,data,id_comprador) values('" + id + "','"
                + (new SimpleDateFormat("yyyy-MM-dd").format(data)) + "','" + pedido.getComp().getId() + "') ";
        try {
            if (!stmt.execute(query)) {
                return insertItemsRecibo(pedido.getListaProdutos(), id);
            }
            return false;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return true;
    }

    private boolean insertItemsRecibo(ArrayList<Produto> list, String id_recibo) {

        for (Produto p : list) {
            String query = "insert into compra_realizada(qtd,id_produto,id_recibo) values('" + p.getQtd() + "',"
                    + "'" + p.getId() + "','" + id_recibo + "') ";
            try {
                //INSERT INTO `compra_realizada`(`descricao`, `qtd`, `valor`, `id_recibo`, `id_produto`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5])
                stmt.execute(query);
            } catch (SQLException ex) {
            System.out.println(ex.getMessage());
                //return false;
            }
        }
        return true;

    }

    private String generatedIdRecibo() {
        String query = "select * from recibos where id = (select max(id)  from recibos)";
        try {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                int nId = rs.getInt("id");
                nId ++;
                String result = ("0000" + (nId)).substring(("0000" + nId).length() - 4, ("0000" + nId).length());
                System.out.println(result);
                return result;
            }
        } catch (SQLException ex) {
            return "0001";
        }
        return "";
    }
}
