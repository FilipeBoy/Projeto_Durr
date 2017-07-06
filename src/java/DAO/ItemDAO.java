
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Item;

public class ItemDAO {
    
    public String save( Item item) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO  Item(Item_Reference,Name,Amount) values(?,?,?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, item.getItem_Reference());
            comando.setString(2, item.getName());
            comando.setInt(3, item.getAmount());
            comando.executeUpdate();
        message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit( Item item) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE  Item SET Name=?,Amount=? WHERE  Item_Reference = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, item.getName());
        comando.setInt(2, item.getAmount());
        comando.setString(3, item.getItem_Reference());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete( Item item) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Item ");
        sql.append("WHERE  Item_Reference = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, item.getItem_Reference());
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public  Item search ( Item item) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Name,Amount ");
        sql.append("FROM Item ");
        sql.append("WHERE Item_Reference = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, item.getItem_Reference());
        ResultSet resultado = comando.executeQuery();
         Item retorno = null;
        while (resultado.next()) {
            retorno = new  Item();
            retorno.setName(resultado.getString("Name"));
            retorno.setAmount(resultado.getInt("Amount"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List< Item> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Item ORDER BY Name ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
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
    
}
