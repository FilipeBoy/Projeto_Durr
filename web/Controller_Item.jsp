<%@page import="MODEL.DataBaseConection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Item"%> 
<%@page import="DAO.ItemDAO"%> 
<%@page import="MODEL.Model_Item"%> 
<%@page import="DAO.Model_ItemDAO"%>
<%@page import="MODEL.Item_List"%> 
<%@page import="DAO.Item_ListDAO"%>

<%
    String RefItem = request.getParameter("RefItem");
    String Name = request.getParameter("Name");

    String[] items = request.getParameterValues("item");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;
if(RefItem!="" && Name!="" || request.getParameter("search")!=""){
    if (command.equals("save")) {
        Item item = new Item(RefItem);
        ItemDAO itemDao = new ItemDAO();
        item = itemDao.search(item);
        if (item == null) {
            int Amount = Integer.parseInt(request.getParameter("Amount"));
            item = new Item(RefItem, Name, Amount);
            itemDao = new ItemDAO();
            message = itemDao.save(item);
            for (String model : items) {
                Model_Item model_item = new Model_Item(model, RefItem);
                Model_ItemDAO Model_ItemDao = new Model_ItemDAO();
                Model_ItemDao.save(model_item);
            }
            session.setAttribute("Message", message);
        }else{
             session.setAttribute("Message", "Referência já cadastrada!");
        }
        request.getRequestDispatcher("View_Register_Item.jsp").forward(request, response);

    } else if (command.equals("delete")) {
        Model_Item model_item = new Model_Item(RefItem);
        Model_ItemDAO Model_ItemDao = new Model_ItemDAO();
        Model_ItemDao.delete(model_item);
        Item item = new Item(RefItem);
        ItemDAO itemDao = new ItemDAO();
        message = itemDao.delete(item);
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Item.jsp").forward(request, response);

    } else if (command.equals("edit")) {
        int Amount = Integer.parseInt(request.getParameter("Amount"));
        Item item = new Item(RefItem, Name, Amount);
        ItemDAO itemDao = new ItemDAO();
        message = itemDao.edit(item);
        Model_Item model_item = new Model_Item(RefItem);
        Model_ItemDAO Model_ItemDao = new Model_ItemDAO();
        Model_ItemDao.delete(model_item);
        for (String model : items) {
            model_item = new Model_Item(model, RefItem);
            Model_ItemDao = new Model_ItemDAO();
            Model_ItemDao.save(model_item);
        }
        session.setAttribute("Message", message);
        request.getRequestDispatcher("View_Register_Item.jsp").forward(request, response);

    } else if (command.equals("search")) {
        RefItem = request.getParameter("search");
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

    }
    }else{
session.setAttribute("Message", "Favor preencher todos os campos!");
request.getRequestDispatcher("View_Register_Item.jsp").forward(request, response);
}
%>
