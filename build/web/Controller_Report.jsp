<%@page import="java.util.List"%>
<%@page import="MODEL.Clinical"%>
<%@page import="MODEL.Clinical_Unit"%>
<%@page import="MODEL.Department"%>
<%@page import="MODEL.Employee"%>
<%@page import="MODEL.Equipment"%>
<%@page import="MODEL.Item"%>
<%@page import="MODEL.Item_List"%>
<%@page import="MODEL.Maintenance"%>
<%@page import="MODEL.Model_Equipment"%>
<%@page import="MODEL.Model_Item"%>
<%@page import="MODEL.Wait_List"%>
<%@page import="DAO.ClinicalDAO"%>
<%@page import="DAO.Clinical_UnitDAO"%>
<%@page import="DAO.DepartmentDAO"%>
<%@page import="DAO.EmployeeDAO"%>
<%@page import="DAO.ItemDAO"%>
<%@page import="DAO.Item_ListDAO"%>
<%@page import="DAO.MaintenanceDAO"%>
<%@page import="DAO.Model_EquipmentDAO"%>
<%@page import="DAO.Model_ItemDAO"%>
<%@page import="DAO.Wait_ListDAO"%>
<%@page import="DAO.EquipmentDAO"%>
<%
    String botao = request.getParameter("Command");
    String[] items = request.getParameterValues("item");

    if (botao.equals("option1")) {
        String RefItem="";
        for (String selected_item : items) {
        RefItem = selected_item;
        }
        Item item = new Item(RefItem);
        ItemDAO itemDao = new ItemDAO();
        item = itemDao.search(item);
        if (item != null) {
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1", RefItem);
            session.setAttribute("field2", item.getName());
            session.setAttribute("field3", item.getAmount());
            request.getRequestDispatcher("View_Register_Item.jsp").forward(request, response);
        } else {
            session.setAttribute("Message", "Registro não encontrado");
            request.getRequestDispatcher("View_Register_Item.jsp").forward(request, response);
        }
        
    } else if (botao.equals("option2")) {
        for (String selected_item : items) {
            session.setAttribute("code_maint", selected_item);
        }
        session.setAttribute("Returnn", "yes");
        session.setAttribute("option", "option2");
        request.getRequestDispatcher("View_Report.jsp").forward(request, response);
        
    }else if (botao.equals("option3")) {
        int CodMaintenance =0;
        for (String item : items) {
            CodMaintenance =Integer.parseInt(item);
        }
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
        
    } else if (botao.equals("option4")) {
        String search="";
        for (String item : items) {
            search=item;
        }
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
        
    } else if (botao.equals("option5")) {
        String search="";
        for (String item : items) {
            search=item;
        }
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
        
    } else if (botao.equals("option6")) {
        String Code_clinical = "";
        for (String item : items) {
            Code_clinical =item;
        }
        Clinical clinic = new Clinical(Code_clinical);
            ClinicalDAO clinicDao = new ClinicalDAO();
            clinic=clinicDao.search(clinic);
            if(clinic != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",Code_clinical);
            session.setAttribute("field2", clinic.getName());
            }else {
            session.setAttribute("Message", "Registro não encontrado");
            }
            request.getRequestDispatcher("View_Register_Clinical.jsp").forward(request, response);
        
    } else if (botao.equals("option7")) {
        String search="";
        for (String item : items) {
            search=item;
        }
        Employee employee = new Employee(search);
        EmployeeDAO employeeDao = new EmployeeDAO();
        employee= employeeDao.search(employee);
        if(employee != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",search );
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
        
    } else if (botao.equals("option8")) {
        int CodDepto = 0;
        for (String item : items) {
            CodDepto=Integer.parseInt(item);
        }
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
    }else if (botao.equals("option9")) {
        session.setAttribute("Returnn2", "yes");
        session.setAttribute("option", "option9");
        session.setAttribute("field1",request.getParameter("search"));
        request.getRequestDispatcher("View_Report.jsp").forward(request, response);
       
    }else if (botao.equals("option10")) {
        session.setAttribute("Returnn2", "yes");
        session.setAttribute("option", "option10");
        session.setAttribute("date1",request.getParameter("Date1"));
        session.setAttribute("date2",request.getParameter("Date2"));
        request.getRequestDispatcher("View_Report.jsp").forward(request, response);
       
    }
    
%>



