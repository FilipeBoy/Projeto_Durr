<%@page import="DAO.EquipmentDAO"%>
<%@page import="MODEL.Equipment"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Maintenance"%> 
<%@page import="DAO.MaintenanceDAO"%> 
<%@page import="MODEL.Item"%> 
<%@page import="DAO.ItemDAO"%> 
<%@page import="DAO.Model_ItemDAO"%> 
<%@page import="MODEL.Item_List"%> 
<%@page import="DAO.Item_ListDAO"%>

<%
    String SN = request.getParameter("SN");
    String Date = request.getParameter("Date");
    String Problem = request.getParameter("Problem");
    String Solution = request.getParameter("Solution");
    String[] Items=request.getParameterValues("item");
    String user = (String) session.getAttribute("CPF");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;
    
    if(SN!="" && Date!="" && Problem!="" && Solution!="" || request.getParameter("search")!=""){

    if (command.equals("save")||command.equals("consult_save")) {
        Maintenance maintenance = new Maintenance(Date,Problem,Solution,SN,user);
        MaintenanceDAO maintenanceDao = new MaintenanceDAO();
        message=maintenanceDao.save(maintenance);
        maintenance=maintenanceDao.search_last();
        int CodMaintenance = maintenance.getCode_Maintenance();
        for (String item : Items) {
                Item_List item_list = new Item_List(item,CodMaintenance);
                Item_ListDAO item_listDao = new Item_ListDAO();
                message=item_listDao.save(item_list);
        }
        session.setAttribute("Message", message); 
        if(command.equals("save")){
            request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("View_Consult_Maintenance.jsp").forward(request, response);
        }
        
        
    } else if (command.equals("delete")||command.equals("consult_delete")) {
        int CodMaintenance = Integer.parseInt(request.getParameter("search"));
        Maintenance maintenance = new Maintenance(CodMaintenance);
        MaintenanceDAO maintenanceDao = new MaintenanceDAO();
        message=maintenanceDao.delete(maintenance);
        Item_ListDAO item_listDao = new Item_ListDAO();
        message=item_listDao.delete(CodMaintenance);
        session.setAttribute("Message", message);
        if(command.equals("delete")){
            request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("View_Consult_Maintenance.jsp").forward(request, response);
        }

    } else if (command.equals("edit")||command.equals("consult_edit")) {
        int CodMaintenance = Integer.parseInt(request.getParameter("search"));
        Maintenance maintenance = new Maintenance(CodMaintenance,Date,Problem,Solution,SN,user);
        MaintenanceDAO maintenanceDao = new MaintenanceDAO();
        message=maintenanceDao.edit(maintenance);
        Item_List item_list = new Item_List(CodMaintenance);
        Item_ListDAO item_listDao = new Item_ListDAO();
        String aux=maintenanceDao.delete(maintenance);
        for (String item : Items) {
                item_list = new Item_List(item,CodMaintenance);
                item_listDao = new Item_ListDAO();
                aux=item_listDao.save(item_list);
            }
        session.setAttribute("Message", message);
        if(command.equals("edit")){
            request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("View_Consult_Maintenance.jsp").forward(request, response);
        }

    } else if (command.equals("search")) {
        int CodMaintenance = Integer.parseInt(request.getParameter("search"));
        Maintenance maintenance = new Maintenance(CodMaintenance);
        MaintenanceDAO maintenanceDao = new MaintenanceDAO();
        maintenance= maintenanceDao.search(maintenance);
        if(maintenance != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",CodMaintenance);
            session.setAttribute("field2",maintenance.getSN_Equipment() );
            session.setAttribute("field3",maintenance.getDate());
            session.setAttribute("field4",maintenance.getProblem());
            session.setAttribute("field5",maintenance.getSolution());
            request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);
        }

    }else if (command.equals("search_Item")) {
        String search = request.getParameter("search");
        Equipment equip = new Equipment(search);
        EquipmentDAO equipDao = new EquipmentDAO();
        equip = equipDao.search(equip);
        if (equip != null) {
            Model_ItemDAO Model_ItemDao = new Model_ItemDAO();
            List<Item> items= Model_ItemDao.list_for_Reference(equip.getModel_Reference());
            session.setAttribute("Returnn", "yes");
            session.setAttribute("items",items);
            request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Register_Maintenance.jsp").forward(request, response);
        }

    } else if (command.equals("consult_search")) {
        int CodMaintenance = Integer.parseInt(request.getParameter("search"));
        Maintenance maintenance = new Maintenance(CodMaintenance);
        MaintenanceDAO maintenanceDao = new MaintenanceDAO();
        maintenance= maintenanceDao.search(maintenance);
        if(maintenance != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",CodMaintenance);
            session.setAttribute("field2",maintenance.getSN_Equipment());
            session.setAttribute("field3",maintenance.getDate());
            session.setAttribute("field4",maintenance.getProblem());
            session.setAttribute("field5",maintenance.getSolution());
            request.getRequestDispatcher("View_Consult_Maintenance.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Consult_Maintenance.jsp").forward(request, response);
        }

    }
    }else{
session.setAttribute("Message", "Favor preencher todos os campos!");
request.getRequestDispatcher("View_Consult_Maintenance.jsp").forward(request, response);
}
%>
