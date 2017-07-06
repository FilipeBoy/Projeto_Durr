
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Maintenance;

public class MaintenanceDAO {
    
    public String save( Maintenance maintenance) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO  Maintenance(Code_Maintenance,Maintenance_Date,Problem,Solution,SN_Equipment,CPF_Employee) values(Null,?,?,?,?,?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, maintenance.getDate());
            comando.setString(2, maintenance.getProblem());
            comando.setString(3, maintenance.getSolution());
            comando.setString(4, maintenance.getSN_Equipment());
            comando.setString(5, maintenance.getCPF_Employee());
            comando.executeUpdate();
        message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        
        return message;
    }

    public String edit( Maintenance maintenance) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE  Maintenance SET Maintenance_Date=?,Problem=?,Solution=?,SN_Equipment=?,CPF_Employee=? WHERE  Code_Maintenance = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, maintenance.getDate());
        comando.setString(2, maintenance.getProblem());
        comando.setString(3, maintenance.getSolution());
        comando.setString(4, maintenance.getSN_Equipment());
        comando.setString(5, maintenance.getCPF_Employee());
        comando.setInt(6, maintenance.getCode_Maintenance());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete( Maintenance maintenance) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Maintenance ");
        sql.append("WHERE  Code_Maintenance = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, maintenance.getCode_Maintenance());
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public  Maintenance search ( Maintenance maintenance) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Maintenance_Date,Problem,Solution,SN_Equipment,CPF_Employee ");
        sql.append("FROM Maintenance ");
        sql.append("WHERE Code_Maintenance = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, maintenance.getCode_Maintenance());
        ResultSet resultado = comando.executeQuery();
         Maintenance retorno = null;
        while (resultado.next()) {
            retorno = new  Maintenance();
            retorno.setDate(resultado.getDate("Maintenance_Date").toString());
            retorno.setProblem(resultado.getString("Problem"));
            retorno.setSolution(resultado.getString("Solution"));
            retorno.setSN_Equipment(resultado.getString("SN_Equipment"));
            retorno.setCPF_Employee(resultado.getString("CPF_Employee"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }
    
     public  Maintenance search_last () throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT MAX(Code_Maintenance)Code FROM  Maintenance");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
         Maintenance retorno = null;
        while (resultado.next()) {
            retorno = new  Maintenance();
            retorno.setCode_Maintenance(resultado.getInt("Code"));
            System.out.println("resultado ="+resultado.getInt("Code"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List<Maintenance> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Maintenance ORDER BY Code_Maintenance");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Maintenance> lista = new ArrayList<Maintenance>();
        while (resultado.next()) {
            Maintenance maintenance = new  Maintenance();
            maintenance.setCode_Maintenance(resultado.getInt("Code_Maintenance"));
            maintenance.setDate(resultado.getDate("Maintenance_Date").toString());
            maintenance.setProblem(resultado.getString("Problem"));
            maintenance.setSolution(resultado.getString("Solution"));
            maintenance.setSN_Equipment(resultado.getString("SN_Equipment"));
            maintenance.setCPF_Employee(resultado.getString("CPF_Employee"));
            lista.add(maintenance);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
    
     public List<Maintenance> list_maintenance_Equipment(String SN_Equipment) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Maintenance where SN_Equipment=? ORDER BY Code_Maintenance");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, SN_Equipment);
        ResultSet resultado = comando.executeQuery();
        List<Maintenance> lista = new ArrayList<Maintenance>();
        while (resultado.next()) {
            Maintenance maintenance = new  Maintenance();
            maintenance.setCode_Maintenance(resultado.getInt("Code_Maintenance"));
            maintenance.setDate(resultado.getDate("Maintenance_Date").toString());
            maintenance.setProblem(resultado.getString("Problem"));
            maintenance.setSolution(resultado.getString("Solution"));
            maintenance.setSN_Equipment(resultado.getString("SN_Equipment"));
            maintenance.setCPF_Employee(resultado.getString("CPF_Employee"));
            lista.add(maintenance);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
     
     public List<Maintenance> list_maintenance_Date(String Date1,String Date2) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Maintenance where Maintenance_Date BETWEEN ? AND ? ORDER BY Maintenance_Date");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, Date1);
        comando.setString(2, Date2);
        ResultSet resultado = comando.executeQuery();
        List<Maintenance> lista = new ArrayList<Maintenance>();
        while (resultado.next()) {
            Maintenance maintenance = new  Maintenance();
            maintenance.setCode_Maintenance(resultado.getInt("Code_Maintenance"));
            maintenance.setDate(resultado.getDate("Maintenance_Date").toString());
            maintenance.setProblem(resultado.getString("Problem"));
            maintenance.setSolution(resultado.getString("Solution"));
            maintenance.setSN_Equipment(resultado.getString("SN_Equipment"));
            maintenance.setCPF_Employee(resultado.getString("CPF_Employee"));
            lista.add(maintenance);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
