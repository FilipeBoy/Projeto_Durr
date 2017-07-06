
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.DataBaseConection"%> 
<%@page import="MODEL.Employee"%>

<%
    String menssagem = new String("");
    if (request.getParameter("CPF") == null || request.getParameter("password") == null || request.getParameter("CPF") == "" || request.getParameter("password") == "") {
        session.setAttribute("Menssagem", "CPF ou Password não infomado!");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } else {
        String CPFUsuario =request.getParameter("CPF");
        String PasswordUsurario = new String(request.getParameter("password"));
        menssagem = ("Falha na autenticação!CPF ou Password incorreto!");
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT Name,Password ");
        sql.append("FROM Employee ");
        sql.append("WHERE CPF_Employee = ? ");
        DataBaseConection.getConexaoMySQL();
        PreparedStatement comando = DataBaseConection.connection.prepareStatement(sql.toString());
         comando.setString(1, CPFUsuario);
        ResultSet rs = comando.executeQuery();
        String password = new String("");
        String name = new String("");
        
        while (rs.next()) {
            name = rs.getString("Name");
            password = rs.getString("Password");
        }
        
        if (password.equals(PasswordUsurario)) {
            session.setAttribute("Name", name);
            session.setAttribute("CPF", CPFUsuario);
            session.setAttribute("Message", null);
            request.getRequestDispatcher("View_Home.jsp").forward(request, response);
        } else {
            session.setAttribute("Name", null);
            session.setAttribute("Message", menssagem);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        DataBaseConection.FecharConexao();
    }


%>


