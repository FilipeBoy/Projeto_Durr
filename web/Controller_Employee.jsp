<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Department"%> 
<%@page import="DAO.DepartmentDAO"%> 
<%@page import="MODEL.Employee"%> 
<%@page import="DAO.EmployeeDAO"%> 

<%
    
    String CPF_Employee = request.getParameter("CPF");
    String Name = request.getParameter("Name");
    String Function=request.getParameter("Function");
    String NameDepto =request.getParameter("NameDepto");
    String Password =request.getParameter("Password");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;
 if(CPF_Employee!="" && Name!="" && Function!=""&& NameDepto!=""&& Password!=""|| request.getParameter("search")!=""){
    if (command.equals("save")) {
        Department depto = new Department(NameDepto);
        DepartmentDAO deptoDao = new DepartmentDAO();
        depto  = deptoDao.search_for_Name(depto);
        int codeDepto=depto.getCode_Department();
        Employee employee = new Employee(CPF_Employee,Name,Function,Password,codeDepto);
        EmployeeDAO employeeDao = new EmployeeDAO();
        message=employeeDao.save(employee);
        session.setAttribute("Message", message);    
        request.getRequestDispatcher("View_Register_Employee.jsp").forward(request, response);
        
    } else if (command.equals("delete")) {
        Employee employee = new Employee(CPF_Employee);
        EmployeeDAO employeeDao = new EmployeeDAO();
        message=employeeDao.delete(employee);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Employee.jsp").forward(request, response);

    } else if (command.equals("edit")) {
        Department depto = new Department(NameDepto);
        DepartmentDAO deptoDao = new DepartmentDAO();
        depto  = deptoDao.search_for_Name(depto);
        int codeDepto=depto.getCode_Department();
        Employee employee = new Employee(CPF_Employee,Name,Function,Password,codeDepto);
        EmployeeDAO employeeDao = new EmployeeDAO();
        message=employeeDao.edit(employee);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Employee.jsp").forward(request, response);

    } else if (command.equals("search")) {
       String CPF_Search = request.getParameter("search");
        Employee employee = new Employee(CPF_Search);
        EmployeeDAO employeeDao = new EmployeeDAO();
        employee= employeeDao.search(employee);
        if(employee != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",CPF_Search );
            session.setAttribute("field2",employee.getName());
            session.setAttribute("field3",employee.getFunction());
            session.setAttribute("field4",employee.getPassword());
            Department depto = new Department(employee.getCode_Department());
            DepartmentDAO deptoDao = new DepartmentDAO();
            depto  = deptoDao.search_for_code(depto);
            session.setAttribute("field5",depto.getName());
            request.getRequestDispatcher("View_Register_Employee.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Register_Employee.jsp").forward(request, response);
        }

    }
    }else{
session.setAttribute("Message", "Favor preencher todos os campos!");
request.getRequestDispatcher("View_Register_Employee.jsp").forward(request, response);
}
%>

