package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Equipment;

public class EquipmentDAO {

    public String save(Equipment equipment) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO  Equipment(SN_Equipment,Model_Reference,Code_Unit) values(?,?,?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, equipment.getSN_Equipment());
            comando.setString(2, equipment.getModel_Reference());
            comando.setInt(3, equipment.getCode_Unit());
            comando.executeUpdate();
            message = "Cadastrado com sucesso!";
        } catch (SQLException e) {
            message = e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit(Equipment equipment) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE  Equipment SET Model_Reference=?,Code_Unit=? WHERE  SN_Equipment = ?");
        try {
            DataBaseConection.getConexaoMySQL();
            PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, equipment.getModel_Reference());
            comando.setInt(2, equipment.getCode_Unit());
            comando.setString(3, equipment.getSN_Equipment());
            comando.executeUpdate();
            message = "Atualizado com sucesso!";
        } catch (SQLException e) {
            message = e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }
    

    public String delete(Equipment equipment) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Equipment ");
        sql.append("WHERE  SN_Equipment = ? ");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, equipment.getSN_Equipment());
            comando.executeUpdate();
            message = "Excluído com sucesso!";
        } catch (SQLException e) {
            message = e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public Equipment search(Equipment equipment) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Model_Reference,Code_Unit ");
        sql.append("FROM Equipment ");
        sql.append("WHERE SN_Equipment = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, equipment.getSN_Equipment());
        ResultSet resultado = comando.executeQuery();
        Equipment retorno = null;
        while (resultado.next()) {
            retorno = new Equipment();
            retorno.setModel_Reference(resultado.getString("Model_Reference"));
            retorno.setCode_Unit(resultado.getInt("Code_Unit"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }
    
    public Equipment search_for_reference(Equipment equipment) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Model_Reference ");
        sql.append("FROM Equipment ");
        sql.append("WHERE SN_Equipment = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, equipment.getSN_Equipment());
        ResultSet resultado = comando.executeQuery();
        Equipment retorno = null;
        while (resultado.next()) {
            retorno = new Equipment();
            retorno.setModel_Reference(resultado.getString("Model_Reference"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    // PESQUISA_LISTA
    public List< Equipment> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Equipment ORDER BY SN_Equipment ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List< Equipment> lista = new ArrayList< Equipment>();
        while (resultado.next()) {
            Equipment equipment = new Equipment();
            equipment.setSN_Equipment(resultado.getString("SN_Equipment"));
            equipment.setModel_Reference(resultado.getString("Model_Reference"));
            equipment.setCode_Unit(resultado.getInt("Code_Unit"));
            lista.add(equipment);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
