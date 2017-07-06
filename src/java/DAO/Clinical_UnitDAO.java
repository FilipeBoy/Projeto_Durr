
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.DataBaseConection;
import MODEL.Clinical_Unit;


public class Clinical_UnitDAO {
    public String save(Clinical_Unit clinical_unit) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO Clinical_Unit(Street,Numberr,Complement,Phone,Neighborhood,City,State,Zip_Code,CPF_CNPJ_Clinical)"
                + " values( ?, ?, ? ,?, ?, ?, ?, ?, ?)");

        try {
            DataBaseConection.getConexaoMySQL();
            java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
            comando.setString(1, clinical_unit.getStreet());
            comando.setString(2, clinical_unit.getNumber());
            comando.setString(3, clinical_unit.getComplement());
            comando.setString(4, clinical_unit.getPhone());
            comando.setString(5, clinical_unit.getNeighborhood());
            comando.setString(6, clinical_unit.getCity());
            comando.setString(7, clinical_unit.getState());
            comando.setString(8, clinical_unit.getZip_Code());
            comando.setString(9, clinical_unit.getCPF_CNPJ_Clinical());
            comando.executeUpdate();
        message="Cadastrado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String edit(Clinical_Unit clinical) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE Clinical_Unit SET Street=?, Numberr=?, Complement=?, Phone=?, Neighborhood=?, City=?, State=?, Zip_Code=?, CPF_CNPJ_Clinical=? WHERE Code_Unit=?");
        try {
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, clinical.getStreet());
        comando.setString(2, clinical.getNumber());
        comando.setString(3, clinical.getComplement());
        comando.setString(4, clinical.getPhone());
        comando.setString(5, clinical.getNeighborhood());
        comando.setString(6, clinical.getCity());
        comando.setString(7, clinical.getState());
        comando.setString(8, clinical.getZip_Code());
        comando.setString(9, clinical.getCPF_CNPJ_Clinical());
        comando.setInt(10, clinical.getCode_Unit());
        comando.executeUpdate();
        message="Atualizado com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public String delete(Clinical_Unit clinical) throws SQLException {
        String message;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM Clinical_Unit ");
        sql.append("WHERE Code_Unit = ? ");
        try {
        DataBaseConection.getConexaoMySQL();
        java.sql.PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, clinical.getCode_Unit());
        comando.executeUpdate();
        message="Excluído com sucesso!";
        } catch (SQLException e) {
            message=e.toString();
        }
        DataBaseConection.FecharConexao();
        return message;
    }

    public Clinical_Unit search_for_Code_Unit (Clinical_Unit clinical) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Street,Numberr,Complement,Phone,Neighborhood,City,State,Zip_Code,CPF_CNPJ_Clinical ");
        sql.append("FROM Clinical_Unit ");
        sql.append("WHERE Code_Unit = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setInt(1, clinical.getCode_Unit());
        ResultSet resultado = comando.executeQuery();
        Clinical_Unit retorno = null;
        while (resultado.next()) {
            retorno = new Clinical_Unit();
            retorno.setStreet(resultado.getString("Street"));
            retorno.setNumber(resultado.getString("Numberr"));
            retorno.setComplement(resultado.getString("Complement"));
            retorno.setPhone(resultado.getString("Phone"));
            retorno.setNeighborhood(resultado.getString("Neighborhood"));
            retorno.setCity(resultado.getString("City"));
            retorno.setState(resultado.getString("State"));
            retorno.setZip_Code(resultado.getString("Zip_Code"));
            retorno.setCPF_CNPJ_Clinical(resultado.getString("CPF_CNPJ_Clinical"));
        }
        DataBaseConection.FecharConexao();
        return retorno;
    }
    
    public String search_for_CPF_Clinical (Clinical_Unit clinical) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Code_Unit ");
        sql.append("FROM Clinical_Unit ");
        sql.append("WHERE CPF_CNPJ_Clinical = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        comando.setString(1, clinical.getCPF_CNPJ_Clinical());
        ResultSet resultado = comando.executeQuery();
        String result="no";
        if(resultado==null){
            result="yes";
        }
        DataBaseConection.FecharConexao();
        return result;
    }

    
    // PESQUISA_LISTA
    public List<Clinical_Unit> list() throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Clinical_Unit ORDER BY Code_Unit ASC");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
        ResultSet resultado = comando.executeQuery();
        List<Clinical_Unit> lista = new ArrayList<Clinical_Unit>();
        while (resultado.next()) {
            Clinical_Unit clinical = new Clinical_Unit();
            clinical.setStreet(resultado.getString("Street"));
            clinical.setNumber(resultado.getString("Numberr"));
            clinical.setComplement(resultado.getString("Complement"));
            clinical.setPhone(resultado.getString("Phone"));
            clinical.setNeighborhood(resultado.getString("Neighborhood"));
            clinical.setCity(resultado.getString("City"));
            clinical.setState(resultado.getString("State"));
            clinical.setZip_Code(resultado.getString("Zip_Code"));
            clinical.setCPF_CNPJ_Clinical(resultado.getString("CPF_CNPJ_Clinical"));
            clinical.setCode_Unit(resultado.getInt("Code_Unit"));
            lista.add(clinical);
        }
        DataBaseConection.FecharConexao();
        return lista;
    }
}
