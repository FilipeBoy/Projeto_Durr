<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Model_Equipment"%> 
<%@page import="DAO.Model_EquipmentDAO"%> 

<%  String RefMod = request.getParameter("RefMod");
    String Name = request.getParameter("Name");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;
    if(RefMod!="" && Name!="" || request.getParameter("search")!=""){
    if (command.equals("save")) {
        Model_Equipment Modequip = new Model_Equipment(RefMod,Name);
        Model_EquipmentDAO ModequipDao = new Model_EquipmentDAO();
        message=ModequipDao.save(Modequip);
        session.setAttribute("Message", message);    
        request.getRequestDispatcher("View_Register_Scanner_Model.jsp").forward(request, response);
        
    } else if (command.equals("delete")) {
        Model_Equipment Modequip = new Model_Equipment(RefMod);
        Model_EquipmentDAO ModequipDao = new Model_EquipmentDAO();
        message=ModequipDao.delete(Modequip);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Scanner_Model.jsp").forward(request, response);

    } else if (command.equals("edit")) {
        Model_Equipment Modequip = new Model_Equipment(RefMod,Name);
        Model_EquipmentDAO ModequipDao = new Model_EquipmentDAO();
        message=ModequipDao.edit(Modequip);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Scanner_Model.jsp").forward(request, response);

    } else if (command.equals("search")) {
        String search=(request.getParameter("search"));
        Model_Equipment Modequip = new Model_Equipment(search);
        Model_EquipmentDAO ModequipDao = new Model_EquipmentDAO();
        Modequip= ModequipDao.search_for_reference(Modequip);
        if(Modequip != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",search);
            session.setAttribute("field2", Modequip.getName());
            request.getRequestDispatcher("View_Register_Scanner_Model.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Register_Scanner_Model.jsp").forward(request, response);
        }

    }
    }else{
session.setAttribute("Message", "Favor preencher todos os campos!");
request.getRequestDispatcher("View_Register_Scanner_Model.jsp").forward(request, response);
}
%>
