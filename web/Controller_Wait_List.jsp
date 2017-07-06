<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Wait_List"%> 
<%@page import="DAO.Wait_ListDAO"%> 

<%
    String SN = request.getParameter("SN");
    String Status = request.getParameter("Status");
    String Problem = request.getParameter("Problem");
    String Prognosis = request.getParameter("Prognosis");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;
    
if(SN!="" && Status!="" && Problem!="" &&Prognosis!="" || request.getParameterValues("search")!=null){
    if (command.equals("save")) {
        String Date = request.getParameter("Date").toString();
        Wait_List waitList = new Wait_List(Date,Problem,Prognosis,Status,SN);
        Wait_ListDAO waitListDao = new Wait_ListDAO();
        message=waitListDao.save(waitList);
        session.setAttribute("Message", message);    
        request.getRequestDispatcher("View_Check_Entry.jsp").forward(request, response);
        
    } else if (command.equals("delete")) {
        int Code_List = Integer.parseInt(request.getParameter("search"));
        Wait_List waitList = new Wait_List(Code_List);
        Wait_ListDAO waitListDao = new Wait_ListDAO();
        message=waitListDao.delete(waitList);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Check_Entry.jsp").forward(request, response);

    } else if (command.equals("edit")) {
        String Date = request.getParameter("Date").toString();
        int Code_List = Integer.parseInt(request.getParameter("search"));
         Wait_List waitList = new Wait_List(Code_List,Date,Problem,Prognosis,Status,SN);
        Wait_ListDAO waitListDao = new Wait_ListDAO();
        message=waitListDao.edit(waitList);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Check_Entry.jsp").forward(request, response);

    } else if (command.equals("search")) {
        int Code_List = Integer.parseInt(request.getParameter("search"));
        Wait_List waitList = new Wait_List(Code_List);
        Wait_ListDAO waitListDao = new Wait_ListDAO();
        waitList= waitListDao.search(waitList);
        if(waitList != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",Code_List);
            session.setAttribute("field2", waitList.getSN_Equipment());
            session.setAttribute("field3", waitList.getArrival_Date());
            session.setAttribute("field4", waitList.getStatus());
            session.setAttribute("field5", waitList.getProblem());
            session.setAttribute("field6", waitList.getPrognosis());
        } else {
            session.setAttribute("Message", "Registro não encontrado");
        }
        request.getRequestDispatcher("View_Check_Entry.jsp").forward(request, response);
    } else if (command.equals("search2")) {
        String[] Code= request.getParameterValues("search");
        for (String List : Code) {
            int Code_List = Integer.parseInt(List);
            Wait_List waitList = new Wait_List(Code_List);
            Wait_ListDAO waitListDao = new Wait_ListDAO();
            waitList= waitListDao.search(waitList);
            if(waitList != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",Code_List);
            session.setAttribute("field2", waitList.getSN_Equipment());
            session.setAttribute("field3", waitList.getArrival_Date());
            session.setAttribute("field4", waitList.getStatus());
            session.setAttribute("field5", waitList.getProblem());
            session.setAttribute("field6", waitList.getPrognosis());
            } else {
            session.setAttribute("Message", "Registro não encontrado");
            }
        }
        request.getRequestDispatcher("View_Check_Entry.jsp").forward(request, response);
    }else if (command.equals("delete2")) {
        String[] Code= request.getParameterValues("search");
        for (String List : Code) {
            int Code_List = Integer.parseInt(List);
            System.out.println("Code_List ="+Code_List);
             Wait_List waitList = new Wait_List(Code_List);
            Wait_ListDAO waitListDao = new Wait_ListDAO();
            message=waitListDao.delete(waitList);
            session.setAttribute("Message", message);
        }
        request.getRequestDispatcher("View_Check_Entry.jsp").forward(request, response);

    }else if (command.equals("start")) {
        String[] Code= request.getParameterValues("search");
        for (String List : Code) {
            int Code_List = Integer.parseInt(List);
            Wait_List waitList = new Wait_List(Code_List);
            Wait_ListDAO waitListDao = new Wait_ListDAO();
            waitList= waitListDao.search(waitList);
            if(waitList != null){
            session.setAttribute("Returnn_Wait", "yes");
            session.setAttribute("field2", waitList.getSN_Equipment());
            session.setAttribute("field4", waitList.getProblem());
            session.setAttribute("field5", waitList.getPrognosis());
            }
        }
        request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);

    }
}else{
session.setAttribute("Message", "Favor preencher todos os campos!");
session.setAttribute("Returnn", "yes");
request.getRequestDispatcher("View_Check_Entry.jsp").forward(request, response);
}
%>
