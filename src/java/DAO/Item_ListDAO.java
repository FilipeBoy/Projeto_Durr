
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Item_List;

public class Item_ListDAO {
    
    public String save( Item_List item_list) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO  Item_List(Item_Reference,Code_Maintenance) values(?,?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, item_list.getItem_Reference());
            comando.setInt(2, item_list.getCode_Maintenance());
            comando.executeUpdate();
        message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        
        return message;
    }

    public String edit( Item_List item_list) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE  Item_List SET Item_Reference=?,Code_Maintenance=? WHERE  Code_Item = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, item_list.getItem_Reference());
        comando.setInt(2, item_list.getCode_Maintenance());
        comando.setInt(3, item_list.getCode_Item());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        
        return message;
    }

    public String delete( int code) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Item_List ");
        sql.append("WHERE Code_Maintenance  = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, code);
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
       
        return message;
    }

    public  Item_List search ( Item_List item_list) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Item_Reference,Code_Maintenance ");
        sql.append("FROM Item_List ");
        sql.append("WHERE Code_Item = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, item_list.getCode_Item());
        ResultSet resultado = comando.executeQuery();
         Item_List retorno = null;
        while (resultado.next()) {
            retorno = new  Item_List();
            retorno.setItem_Reference(resultado.getString("Item_Reference"));
            retorno.setCode_Maintenance(resultado.getInt("Code_Maintenance"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List< Item_List> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Item_List ORDER BY Code_Item ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Item_List> lista = new ArrayList<Item_List>();
        while (resultado.next()) {
            Item_List item_list = new  Item_List();
            item_list.setCode_Item(resultado.getInt("Code_Item"));
            item_list.setItem_Reference(resultado.getString("Item_Reference"));
            item_list.setCode_Maintenance(resultado.getInt("Code_Maintenance"));
            lista.add(item_list);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
        public List< Item_List> list_for_Maintenance(int code) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Item_Reference FROM Item_List WHERE Code_Maintenance=? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1,code);
        ResultSet resultado = comando.executeQuery();
        List<Item_List> lista = new ArrayList<Item_List>();
        while (resultado.next()) {
            Item_List item_list = new  Item_List();
            item_list.setItem_Reference(resultado.getString("Item_Reference"));
            lista.add(item_list);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
