/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appdkempresa.java.Model;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ListView;
import javafx.stage.Stage;

/**
 *
 * @author kaleb
 */
public abstract class CustomInitializable implements Initializable {
    protected Validators validacoes;

    public CustomInitializable() {
        validacoes = new Validators();
    }
    
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    protected void gotoPage(String url){
     try {
            FXMLLoader fXMLLoader = new FXMLLoader(getClass().getResource(url));
            Parent rootl = (Parent) fXMLLoader.load();
            Stage stage = new Stage();
            stage.setScene(new Scene(rootl));
            stage.show();

        } catch (Exception e) {
            System.out.println("gotoPage Error:" + e);
        }
    }
}
