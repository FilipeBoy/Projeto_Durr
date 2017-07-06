<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Department"%> 
<%@page import="DAO.DepartmentDAO"%> 

<%
    String Name = request.getParameter("Name");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;
if(Name!="" || request.getParameter("search")!=""){
    if (command.equals("save")) {
        Department depto = new Department(Name);
        DepartmentDAO deptoDao = new DepartmentDAO();
        message=deptoDao.save(depto);
        session.setAttribute("Message", message);    
        request.getRequestDispatcher("View_Register_Department.jsp").forward(request, response);
        
    } else if (command.equals("delete")) {
        int CodDepto = Integer.parseInt(request.getParameter("CodDepto"));
        Department depto = new Department(CodDepto);
        DepartmentDAO deptoDao = new DepartmentDAO();
        message=deptoDao.delete(depto);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Department.jsp").forward(request, response);

    } else if (command.equals("edit")) {
        int CodDepto = Integer.parseInt(request.getParameter("CodDepto"));
        Department depto = new Department(CodDepto,Name);
        DepartmentDAO deptoDao = new DepartmentDAO();
        message=deptoDao.edit(depto);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Department.jsp").forward(request, response);

    } else if (command.equals("search")) {
        int CodDepto = Integer.parseInt(request.getParameter("search"));
        Department depto = new Department(CodDepto);
        DepartmentDAO deptoDao = new DepartmentDAO();
        depto= deptoDao.search_for_code(depto);
        if(depto != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",depto.getCode_Department());
            session.setAttribute("field2", depto.getName());
            request.getRequestDispatcher("View_Register_Department.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Register_Department.jsp").forward(request, response);
        }

    }
    }else{
session.setAttribute("Message", "Favor preencher todos os campos!");
request.getRequestDispatcher("View_Register_Department.jsp").forward(request, response);
}
%>