package MODEL;



//Classes necessárias para uso de Banco de dados // 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//Início da classe de conexão// 
public class DataBaseConection {

    public static String status = "Não conectou...";
    public static Connection connection = null;

//Método Construtor da Classe// 
    public DataBaseConection() {

    }

//Método de Conexão// 
    public static java.sql.Connection getConexaoMySQL() {
        try {
// Carregando o JDBC Driver padrão 
            String driverName = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driverName);
            String severName="DESKTOP-BOY";
            String severPort="1521";
            String sid="XE";
            String url="jdbc:oracle:thin:@"+severName+":"+severPort+":"+sid;
            String userName="HR";
            String password="hr";
            connection = DriverManager.getConnection(url, userName, password);
//Testa sua conexão// 
            if (connection != null) {
                status = ("STATUS--->Conectado com sucesso!");
            } else {
                status = ("STATUS--->Não foi possivel realizar conexão");
            }
            return connection;
        } catch (ClassNotFoundException e) { //Driver não encontrado 
            System.out.println("O driver expecificado nao foi encontrado.");
            return null;
        } catch (SQLException e) {
//Não conseguindo se conectar ao banco 
            System.out.println("Nao foi possivel conectar ao Banco de Dados.");
            return null;
        }
    }

//Método que retorna o status da sua conexão// 
    public static String statusConection() {
        return status;
    }

//Método que fecha sua conexão// 
    public static boolean FecharConexao() {
        try {
            DataBaseConection.getConexaoMySQL().close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

//Método que reinicia sua conexão// 
    public static java.sql.Connection ReiniciarConexao() {
        FecharConexao();
        return DataBaseConection.getConexaoMySQL();
    }
}
