
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Department;

public class DepartmentDAO {
    public String save(Department department) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO Department( Code_Department,Name) values(Null, ?)");
        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, department.getName());
            comando.executeUpdate();
            message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit(Department department) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE Department SET Name = ? WHERE  Code_Department = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, department.getName());
        comando.setInt(2, department.getCode_Department());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete(Department department) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Department ");
        sql.append("WHERE  Code_Department = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, department.getCode_Department());
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
       
    }

    public Department search_for_code (Department department) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Code_Department,Name ");
        sql.append("FROM Department ");
        sql.append("WHERE Code_Department = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
         comando.setInt(1, department.getCode_Department());
        ResultSet resultado = comando.executeQuery();
        Department retorno = null;
        while (resultado.next()) {
            retorno = new Department();
            retorno.setCode_Department(resultado.getInt("Code_Department"));
            retorno.setName(resultado.getString("Name"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }
    public Department search_for_Name (Department department) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Code_Department ");
        sql.append("FROM Department ");
        sql.append("WHERE Name = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
         comando.setString(1, department.getName());
        ResultSet resultado = comando.executeQuery();
        Department retorno = null;
        while (resultado.next()) {
            retorno = new Department();
            retorno.setCode_Department(resultado.getInt("Code_Department"));
            
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List<Department> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Department ORDER BY Name ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Department> lista = new ArrayList<Department>();
        while (resultado.next()) {
            Department department = new Department();
            department.setCode_Department(resultado.getInt("Code_Department"));
            department.setName(resultado.getString("Name"));
            lista.add(department);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
