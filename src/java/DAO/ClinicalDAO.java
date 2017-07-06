
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Clinical;


public class ClinicalDAO {
    public String save(Clinical clinical) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO Clinical(CPF_CNPJ_Clinical,Name) values(?, ?)");

        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, clinical.getCPF_CNPJ_Clinical());
            comando.setString(2, clinical.getName());
            comando.executeUpdate();
            message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit(Clinical clinical) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE Clinical SET Name = ? WHERE CPF_CNPJ_Clinical = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, clinical.getName());
        comando.setString(2, clinical.getCPF_CNPJ_Clinical());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete(Clinical clinical) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Clinical ");
        sql.append("WHERE CPF_CNPJ_Clinical = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, clinical.getCPF_CNPJ_Clinical());
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public Clinical search (Clinical clinical) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Name ");
        sql.append("FROM Clinical ");
        sql.append("WHERE CPF_CNPJ_Clinical = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, clinical.getCPF_CNPJ_Clinical());
        ResultSet resultado = comando.executeQuery();
        Clinical retorno = null;
        while (resultado.next()) {
            retorno = new Clinical();
            retorno.setName(resultado.getString("Name"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List<Clinical> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Clinical ORDER BY Name ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Clinical> lista = new ArrayList<Clinical>();
        while (resultado.next()) {
            Clinical clinical = new Clinical();
            clinical.setCPF_CNPJ_Clinical(resultado.getString("CPF_CNPJ_Clinical"));
            clinical.setName(resultado.getString("Name"));
            lista.add(clinical);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
    
}
