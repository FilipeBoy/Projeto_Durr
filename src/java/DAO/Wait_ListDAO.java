
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Wait_List;

public class Wait_ListDAO {
    
    public String save( Wait_List wait_list) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO  Wait_List (Arrival_Date,Problem,Prognosis,Status,SN_Equipment) values(?,?,?,?,?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, wait_list.getArrival_Date());
            comando.setString(2, wait_list.getProblem());
            comando.setString(3, wait_list.getPrognosis());
            comando.setString(4, wait_list.getStatus());
            comando.setString(5, wait_list.getSN_Equipment());
            comando.executeUpdate();
        message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit( Wait_List wait_list) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE  Wait_List SET Arrival_Date=?,Problem=?,Prognosis=?,Status=?,SN_Equipment=? WHERE  Code_List = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, wait_list.getArrival_Date());
        comando.setString(2, wait_list.getProblem());
        comando.setString(3, wait_list.getPrognosis());
        comando.setString(4, wait_list.getStatus());
        comando.setString(5, wait_list.getSN_Equipment());
        comando.setInt(6, wait_list.getCode_List());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete( Wait_List wait_list) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Wait_List ");
        sql.append("WHERE  Code_List = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, wait_list.getCode_List());
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public  Wait_List search ( Wait_List wait_list) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Arrival_Date,Problem,Prognosis,Status,SN_Equipment ");
        sql.append("FROM Wait_List ");
        sql.append("WHERE Code_List = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, wait_list.getCode_List());
        ResultSet resultado = comando.executeQuery();
         Wait_List retorno = null;
        while (resultado.next()) {
            retorno = new  Wait_List();
            retorno.setArrival_Date(resultado.getDate("Arrival_Date").toString());
            retorno.setProblem(resultado.getString("Problem"));
            retorno.setPrognosis(resultado.getString("Prognosis"));
            retorno.setStatus(resultado.getString("Status"));
            retorno.setSN_Equipment(resultado.getString("SN_Equipment"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List<Wait_List> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Wait_List ORDER BY Code_List");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Wait_List> lista = new ArrayList<Wait_List>();
        while (resultado.next()) {
            Wait_List wait_list = new  Wait_List();
            wait_list.setCode_List(resultado.getInt("Code_List"));
            wait_list.setArrival_Date(resultado.getDate("Arrival_Date").toString());
            wait_list.setProblem(resultado.getString("Problem"));;
            wait_list.setPrognosis(resultado.getString("Prognosis"));
            wait_list.setStatus(resultado.getString("Status"));
            wait_list.setSN_Equipment(resultado.getString("SN_Equipment"));
            lista.add(wait_list);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
