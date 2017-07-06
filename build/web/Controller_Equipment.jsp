
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Equipment"%> 
<%@page import="DAO.EquipmentDAO"%> 
<%@page import="MODEL.Model_Equipment"%> 
<%@page import="DAO.Model_EquipmentDAO"%> 

<%
    String model = request.getParameter("Model");
    String sn_equip = request.getParameter("SN");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;
if(model!="" && sn_equip!="" || request.getParameter("search")!=""){    
    if (command.equals("save")) {
        int code_unid;
        if ((request.getParameter("CodUnid")).equals("")) {
            code_unid = 0;
        } else {
            code_unid = Integer.parseInt(request.getParameter("CodUnid"));
        }
        Model_Equipment Modequip = new Model_Equipment();
        Modequip.setName(model);
        Model_EquipmentDAO ModequipDao = new Model_EquipmentDAO();
        Modequip = ModequipDao.search_for_name(Modequip);
        if (Modequip != null) {
            String reference = Modequip.getModel_Reference();
            Equipment equip = new Equipment(sn_equip, reference, code_unid);
            EquipmentDAO equipDao = new EquipmentDAO();
            message=equipDao.save(equip);
            session.setAttribute("Message", message);
        }
        request.getRequestDispatcher("View_Register_Scanner.jsp").forward(request, response);

    } else if (command.equals("delete")) {
        Equipment equip = new Equipment(sn_equip);
        EquipmentDAO equipDao = new EquipmentDAO();
        message=equipDao.delete(equip);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Scanner.jsp").forward(request, response);

    } else if (command.equals("edit")) {
        int code_unid;
        if ((request.getParameter("CodUnid")).equals("")) {
            code_unid = 0;
        } else {
            code_unid = Integer.parseInt(request.getParameter("CodUnid"));
        }
        Model_Equipment Modequip = new Model_Equipment();
        Modequip.setName(model);
        Model_EquipmentDAO ModequipDao = new Model_EquipmentDAO();
        Modequip = ModequipDao.search_for_name(Modequip);
        if (Modequip != null) {
            String reference = Modequip.getModel_Reference();
            Equipment equip = new Equipment(sn_equip, reference, code_unid);
            EquipmentDAO equipDao = new EquipmentDAO();
            message=equipDao.edit(equip);
            session.setAttribute("Message", message);
        }
        request.getRequestDispatcher("View_Register_Scanner.jsp").forward(request, response);

    } else if (command.equals("search")) {
        String search = request.getParameter("search");
        Equipment equip = new Equipment(search);
        EquipmentDAO equipDao = new EquipmentDAO();
        equip = equipDao.search(equip);
        if (equip != null) {
            Model_Equipment Modequip = new Model_Equipment(equip.getModel_Reference());
            Model_EquipmentDAO ModequipDao = new Model_EquipmentDAO();
            Modequip = ModequipDao.search_for_reference(Modequip);
            if (Modequip != null) {
                session.setAttribute("field1", Modequip.getName());
            }
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field2", search);
            session.setAttribute("field3", equip.getCode_Unit());
            request.getRequestDispatcher("View_Register_Scanner.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Register_Scanner.jsp").forward(request, response);
        }

    }
    }else{
session.setAttribute("Message", "Favor preencher todos os campos!");
request.getRequestDispatcher("View_Register_Scanner.jsp").forward(request, response);
}
%>