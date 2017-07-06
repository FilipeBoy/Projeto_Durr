
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Employee;

public class EmployeeDAO {
    public String save(Employee employee) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO Employee(CPF_Employee,Name,Function,Password,Code_Department) values(?,?,?,?,?)");

        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, employee.getCPF_Employee());
            comando.setString(2, employee.getName());
            comando.setString(3, employee.getFunction());
            comando.setString(4, employee.getPassword());
            comando.setInt(5, employee.getCode_Department());
            comando.executeUpdate();
        message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit(Employee employee) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE Employee SET Name = ?,Function=?,Password=?,Code_Department=? WHERE  CPF_Employee = ?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, employee.getName());
        comando.setString(2, employee.getFunction());
        comando.setString(3, employee.getPassword());
        comando.setInt(4, employee.getCode_Department());
        comando.setString(5, employee.getCPF_Employee());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete(Employee employee) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Employee ");
        sql.append("WHERE  CPF_Employee = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, employee.getCPF_Employee());
        comando.executeUpdate();
         message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public Employee search (Employee employee) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Name,Function,Password,Code_Department ");
        sql.append("FROM Employee ");
        sql.append("WHERE CPF_Employee = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
         comando.setString(1, employee.getCPF_Employee());
        ResultSet resultado = comando.executeQuery();
        Employee retorno = null;
        while (resultado.next()) {
            retorno = new Employee();
            retorno.setName(resultado.getString("Name"));
            retorno.setFunction(resultado.getString("Function"));
            retorno.setPassword(resultado.getString("Password"));
            retorno.setCode_Department(resultado.getInt("Code_Department"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }

    
    // PESQUISA_LISTA
    public List<Employee> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Employee ORDER BY Name ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Employee> lista = new ArrayList<Employee>();
        while (resultado.next()) {
            Employee employee = new Employee();
            employee.setCPF_Employee(resultado.getString("CPF_Employee"));
            employee.setName(resultado.getString("Name"));
            employee.setFunction(resultado.getString("Function"));
            employee.setPassword(resultado.getString("Password"));
            employee.setCode_Department(resultado.getInt("Code_Department"));
            lista.add(employee);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
