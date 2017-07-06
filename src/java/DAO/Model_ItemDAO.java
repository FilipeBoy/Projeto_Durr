
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Model_Item;
import MODEL.Item;

public class Model_ItemDAO {
    
    public void save( Model_Item model_item) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO  Model_Item (Model_Reference,Item_Reference) values(?,?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, model_item.getModel_Reference());
            comando.setString(2, model_item.getItem_Reference());
            comando.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }

    public void edit( Model_Item model_item) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE  Model_Item SET Item_Reference=?,Model_Reference = ? WHERE  Model_Reference = ?");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_item.getItem_Reference());
        comando.setString(2, model_item.getModel_Reference());
        comando.setInt(3, model_item.getCode_Model_Item());
        comando.executeUpdate();
        DataBaseConection.FecharConexao();
    }

    public void delete( Model_Item model_item) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Model_Item ");
        sql.append("WHERE  Item_Reference = ? ");
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_item.getItem_Reference());
        comando.executeUpdate();
        DataBaseConection.FecharConexao();
    }

    public  Model_Item search ( Model_Item model_item) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Model_Reference,Item_Reference ");
        sql.append("FROM Model_Item ");
        sql.append("WHERE Code_Model_Item = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_item.getModel_Reference());
        ResultSet resultado = comando.executeQuery();
         Model_Item retorno = null;
        while (resultado.next()) {
            retorno = new  Model_Item();
            retorno.setModel_Reference(resultado.getString("Model_Reference"));
            retorno.setItem_Reference(resultado.getString("Item_Reference"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List<Model_Item> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Model_Item ORDER BY Code_Model_Item ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Model_Item> lista = new ArrayList<Model_Item>();
        while (resultado.next()) {
            Model_Item model_item = new  Model_Item();
            model_item.setCode_Model_Item(resultado.getInt("Code_Model_Item"));
            model_item.setModel_Reference(resultado.getString("Model_Reference"));
            model_item.setItem_Reference(resultado.getString("Item_Reference"));
            lista.add(model_item);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
    
    public List<Item> list_for_Reference( String model_Equipment) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT I.Name,I.Item_Reference,I.Amount FROM Model_Item M, Item I WHERE M.Model_Reference=? AND M.Item_Reference=I.Item_Reference ORDER BY I.Name ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_Equipment);
        ResultSet resultado = comando.executeQuery();
        List< Item> lista = new ArrayList< Item>();
        while (resultado.next()) {
            Item item = new  Item();
            item.setName(resultado.getString("Name"));
            item.setItem_Reference(resultado.getString("Item_Reference"));
            item.setAmount(resultado.getInt("Amount"));
            lista.add(item);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
     public List<Model_Item> list_for_Model( String Item_Reference) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Model_Reference FROM Model_Item WHERE Item_Reference=? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1,Item_Reference);
        ResultSet resultado = comando.executeQuery();
        List< Model_Item> lista = new ArrayList< Model_Item>();
        while (resultado.next()) {
            Model_Item item = new  Model_Item();
            item.setModel_Reference(resultado.getString("Model_Reference"));
            lista.add(item);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
