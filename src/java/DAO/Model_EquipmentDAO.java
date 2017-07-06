
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Model_Equipment;

public class Model_EquipmentDAO {
    
    public String save( Model_Equipment model_equipament) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO  Model_Equipment(Model_Reference,Name) values(?,?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, model_equipament.getModel_Reference());
            comando.setString(2, model_equipament.getName());
            comando.executeUpdate();
        message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit( Model_Equipment model_equipament) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE  Model_Equipment SET Name=? WHERE  Model_Reference = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_equipament.getName());
        comando.setString(2, model_equipament.getModel_Reference());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete( Model_Equipment model_equipament) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Model_Equipment ");
        sql.append("WHERE  Model_Reference = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_equipament.getModel_Reference());
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public  Model_Equipment search_for_reference ( Model_Equipment model_equipament) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Name ");
        sql.append("FROM Model_Equipment ");
        sql.append("WHERE Model_Reference = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_equipament.getModel_Reference());
        ResultSet resultado = comando.executeQuery();
         Model_Equipment retorno = null;
        while (resultado.next()) {
            retorno = new  Model_Equipment();
            retorno.setName(resultado.getString("Name"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }
    
    public  Model_Equipment search_for_name ( Model_Equipment model_equipament) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Model_Reference ");
        sql.append("FROM Model_Equipment ");
        sql.append("WHERE Name = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, model_equipament.getName());
        ResultSet resultado = comando.executeQuery();
         Model_Equipment retorno = null;
        while (resultado.next()) {
            retorno = new  Model_Equipment();
            retorno.setModel_Reference(resultado.getString("Model_Reference"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List<Model_Equipment> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Model_Equipment ORDER BY Name ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Model_Equipment> lista = new ArrayList<Model_Equipment>();
        while (resultado.next()) {
            Model_Equipment model_equipament = new  Model_Equipment();
            model_equipament.setName(resultado.getString("Name"));
            model_equipament.setModel_Reference(resultado.getString("Model_Reference"));
            lista.add(model_equipament);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
