<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<%String user = (String) session.getAttribute("Name");
    String returnn = (String) session.getAttribute("Returnn");
    String returnn2 = (String) session.getAttribute("Returnn2");
    String message = (String) session.getAttribute("Message");
    String option;
    if (returnn != null || returnn2 != null) {
        option = (String) session.getAttribute("option");
    } else {
        option = request.getParameter("option");
    }
    String campo1 = null, campo2 = null, campo3 = null, campo4 = null, campo5 = null, campo6 = null, campo7 = null, campo8 = null, campo9 = null;
    List<Clinical> clinicalList = null;
    List<Clinical_Unit> clinical_unitList = null;
    List<Department> departmentList = null;
    List<Employee> employeeList = null;
    List<Item> itemList = null;
    List<Item_List> item_list = null;
    List<Maintenance> maintenanceList = null;
    List<Model_Equipment> model_equipmentList = null;
    List<Model_Item> model_itemList = null;
    List<Equipment> equipmentList = null;
    List<Item_List> used_items = null;

    if (option != null) {
        if (option.equalsIgnoreCase("option1")) {
            campo1 = "Referência";
            campo2 = "Nome";
            campo3 = "Quantidade";
            ItemDAO itemDao = new ItemDAO();
            itemList = itemDao.list();

        } else if (option.equalsIgnoreCase("option2")) {
            campo1 = "Código da manutenção";
            campo2 = "Nome da peça";
            campo3 = "Referencia da peça";
            int CodMaintenance = Integer.parseInt(session.getAttribute("code_maint").toString());
            Item_ListDAO used_itemDao = new Item_ListDAO();
            used_items = used_itemDao.list_for_Maintenance(CodMaintenance);
            ItemDAO itemDao = new ItemDAO();
            itemList = itemDao.list();

        } else if (option.equalsIgnoreCase("option3")) {
            campo1 = "Código";
            campo2 = "Data";
            campo3 = "Problema";
            campo4 = "Solução";
            campo5 = "SN Equipamento";
            campo6 = "CPF_Empregado";
            MaintenanceDAO maintenanceDao = new MaintenanceDAO();
            maintenanceList = maintenanceDao.list();

        } else if (option.equalsIgnoreCase("option4")) {
            campo1 = "Referência";
            campo2 = "Nome";
            Model_EquipmentDAO model_equipmentDao = new Model_EquipmentDAO();
            model_equipmentList = model_equipmentDao.list();

        } else if (option.equalsIgnoreCase("option5")) {
            campo1 = "SN equipamento";
            campo2 = "Referencia do modelo";
            campo3 = "Código da unidade clínica";
            EquipmentDAO equipmentDao = new EquipmentDAO();
            equipmentList = equipmentDao.list();

        } else if (option.equalsIgnoreCase("option7")) {
            campo1 = "CPF";
            campo2 = "Nome";
            campo3 = "Função";
            campo4 = "Codigo Departamento";
            EmployeeDAO employeeDao = new EmployeeDAO();
            employeeList = employeeDao.list();
        } else if (option.equalsIgnoreCase("option8")) {
            campo1 = "Código";
            campo2 = "Nome";
            DepartmentDAO departmentDAO = new DepartmentDAO();
            departmentList = departmentDAO.list();
        } else if (option.equalsIgnoreCase("option6")) {
            campo1 = "CPF/CNPJ";
            campo2 = "Nome";
            ClinicalDAO clinicalDAO = new ClinicalDAO();
            clinicalList = clinicalDAO.list();
        }else if (option.equalsIgnoreCase("option9") && returnn2!=null) {
            campo1 = "Código";
            campo2 = "Data";
            campo3 = "Problema";
            campo4 = "Solução";
            campo5 = "SN Equipamento";
            campo6 = "CPF_Empregado";
            MaintenanceDAO maintenanceDao = new MaintenanceDAO();
            maintenanceList = maintenanceDao.list_maintenance_Equipment(session.getAttribute("field1").toString());
        }
        else if (option.equalsIgnoreCase("option10") && returnn2!=null) {
            campo1 = "Código";
            campo2 = "Data";
            campo3 = "Problema";
            campo4 = "Solução";
            campo5 = "SN Equipamento";
            campo6 = "CPF_Empregado";
            System.out.println("date1 ="+(String)session.getAttribute("date1"));
       System.out.println("date2="+(String)session.getAttribute("date2"));
            MaintenanceDAO maintenanceDao = new MaintenanceDAO();
            maintenanceList = maintenanceDao.list_maintenance_Date((String)session.getAttribute("date1"),(String)session.getAttribute("date2"));
        }
    }

%>
<html><head>

        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sistema Durr Dental</title>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="/Projeto_Durr/CSS/Durr.css" rel="stylesheet" type="text/css">
        <script language="JavaSript">
            function retornar() {
             history.go(-1);
            }
        </script>
        <style>
            .navbar
            {
                background-color: #4dc1ff !important;
                color: #fff;
                border-color: #4dc1ff !important;

            }

            .navbar-default .navbar-nav > li > a 
            {
                color:  #fff !important;
                background-color: #4dc1ff !important;
                border: #4dc1ff !important;
            }
            .navbar-default .navbar-nav > li > a:hover
            {
                color: #4dc1ff!important;
                background-color: #fff  !important;
            }
            .dropdown-menu >li> a:hover{
                color:  #fff !important;
                background-color: #4dc1ff !important;
                border: #4dc1ff !important;
            }
            .text-primary-inicial{
                color:#0074d9 !important;
                background-color: rgba(245, 245, 245, 0.90);
                font-weight:bold !important;
            }
            .width-form{
                width: 60% !important;
                left: 20%; 
                top: 20%;
            }
            .form-control2{
                width: 70% !important;
            }
            .control-label{
                font-weight:bold !important;
            }


        </style>
        <%!
            String getDateTime() {
                DateFormat dateFormat = new SimpleDateFormat("DD-MM-YYYY");
                Date date = new Date();
                return dateFormat.format(date);
            }%>
    </head><body>
        <div class="navbar navbar-default">
            <div class="container-header">
                <div class="navbar-header">
                    <img class="img-responsive" src="/Projeto_Durr/Images/logo.png" width="140" >
                </div>
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navbar-ex-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="active">
                            <a href="View_Home.jsp">Home</a>
                        </li>
                        <li class="active">
                            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >Lista de Espera<br><i class="fa fa-caret-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="View_Check_Entry.jsp" >Registrar entrada</a>
                                </li>
                                <li>
                                    <a href="View_Wait_List.jsp">Visualizar lista</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >Manutenção<br><i class="fa fa-caret-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="View_Consult_Maintenance.jsp" >Consultar</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >Cadastros<br><i class="fa fa-caret-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="View_Register_Scanner_Model.jsp" >Modelos de Scanners</a>
                                </li>
                                <li>
                                    <a href="View_Register_Scanner.jsp">Scanners</a>
                                </li>
                                <li>
                                    <a href="View_Register_Item.jsp">Peças</a>
                                </li>
                                <li>
                                    <a href="View_Register_Clinical.jsp">Clinicas</a>
                                </li>
                                <li>
                                    <a href="View_Register_Employee.jsp">Funcionários</a>
                                </li>
                                <li>
                                    <a href="View_Register_Department.jsp">Departamentos</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="View_Report.jsp">Relatórios</a>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <% if (user != null) {%>
                        <li class="active">
                            <a href="Logoff.jsp">Sair</a>
                        </li>

                        <li class="active">
                            <a><%out.print(user);%></a>
                        </li><%}%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="cover">
            <div class="cover-image" style="background-image : url('/Projeto_Durr/Images/Imagem4.jpg')" ></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12  text-primary-inicial" >
                        <h2 class="text-primary-inicial text-center">Visualização de Relatórios</h2>
                        <br>
                        <br>
                        <a><% if (message != null) {
                                out.print(message);
                            }%></a>
                        <div class="btn-group btn-group-lg">
                            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown">O que deseja ver?<br><i class="fa fa-caret-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="View_Report.jsp?option=option9">Relatório de Manutenções por Equipamento</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option10">Relatório de Manutenções por Período</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option1">Relatório de Peças</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option3" >Relatório de todas Manutenções</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option4">Relatório de Modelos de Equipamentos</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option5">Relatório de Scanners</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option6">Relatório de Clinicas</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option7">Relatório de Funcionários</a>
                                </li>
                                <li>
                                    <a href="View_Report.jsp?option=option8">Relatório de Departamentos</a>
                                </li>
                            </ul>
                        </div>
                        <%if (option != null) {
                                if (option.equals("option1")) {
                        %><div><h2 class="col-md-12">Relatório de peças</h2></div><%
                        } else if (option.equals("option2")) {
                        %><div><h2 class="col-md-12">Relatório de peças por manutenção</h2></div><%
                        } else if (option.equals("option3")) {
                        %><div><h2 class="col-md-12">Relatório de todas Manutenções</h2></div><%
                        } else if (option.equals("option4")) {
                        %><div><h2 class="col-md-12">Relatório de Modelos de Equipamentos</h2></div><%
                        } else if (option.equals("option5")) {
                        %><div><h2 class="col-md-12">Relatório de Scanners</h2></div><%
                        } else if (option.equals("option6")) {
                        %><div><h2 class="col-md-12">Relatório de Clínicas</h2></div><%
                        } else if (option.equals("option7")) {
                        %><div><h2 class="col-md-12">Relatório de Funcionários</h2></div><%
                        } else if (option.equals("option8")) {
                        %><div><h2 class="col-md-12">Relatório de Departamentos</h2></div><%
                        }else if (option.equals("option9")) {
                        %><div><h2 class="col-md-12">Relatório de Manutenções por Equipamento</h2></div><%
                        }

                            }%>
                        <form role="form" action="Controller_Report.jsp" method="post">
                            <div class="col-sm-30">
                                <%if (option.equalsIgnoreCase("option1")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th><%out.print(campo3);%></th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Item item : itemList) {%>
                                        <tr>
                                            <td><%=item.getItem_Reference()%></td>
                                            <td><%=item.getName()%></td>
                                            <td><%=item.getAmount()%></td>
                                            <td><input type="checkbox" value ='<%=item.getItem_Reference()%>' name="item"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option2")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th><%out.print(campo3);%></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Item_List used_item : used_items) {
                                             String reference = used_item.getItem_Reference();
                                             for (Item item : itemList) {
                                                 if (item.getItem_Reference().equals(reference)) {%> 
                                        <tr>
                                            <td><%out.print(session.getAttribute("code_maint"));%></td>
                                            <td><%=item.getName()%></td>
                                            <td><%=item.getItem_Reference()%></td>
                                            <%}
                                                    }
                                                }%>
                                        </tr>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option3")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th><%out.print(campo3);%></th>
                                            <th><%out.print(campo4);%></th>
                                            <th><%out.print(campo5);%></th>
                                            <th><%out.print(campo6);%></th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Maintenance maintenance : maintenanceList) {%>
                                        <tr>
                                            <td><%=maintenance.getCode_Maintenance()%></td>
                                            <td><%=maintenance.getDate()%></td>
                                            <td><%=maintenance.getProblem()%></td>
                                            <td><%=maintenance.getSolution()%></td>
                                            <td><%=maintenance.getSN_Equipment()%></td>
                                            <td><%=maintenance.getCPF_Employee()%></td>
                                            <td><input type="checkbox" value ='<%=maintenance.getCode_Maintenance()%>' name="item"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option4")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Model_Equipment Modequip : model_equipmentList) {%>
                                        <tr>
                                            <td><%=Modequip.getModel_Reference()%></td>
                                            <td><%=Modequip.getName()%></td>
                                            <td><input type="checkbox" value ='<%=Modequip.getModel_Reference()%>' name="item"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option5")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th><%out.print(campo3);%></th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Equipment equip : equipmentList) {%>
                                        <tr>
                                            <td><%=equip.getSN_Equipment()%></td>
                                            <td><%=equip.getModel_Reference()%></td>
                                            <td><%=equip.getCode_Unit()%></td>
                                            <td><input type="checkbox" value ='<%=equip.getSN_Equipment()%>' name="item"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option7")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th><%out.print(campo3);%></th>
                                            <th><%out.print(campo4);%></th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Employee employee : employeeList) {%>
                                        <tr>
                                            <td><%=employee.getCPF_Employee()%></td>
                                            <td><%=employee.getName()%></td>
                                            <td><%=employee.getFunction()%></td>
                                            <td><%=employee.getCode_Department()%></td>
                                            <td><input type="checkbox" value ='<%=employee.getCPF_Employee()%>' name="item"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option8")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Department depto : departmentList) {%>
                                        <tr>
                                            <td><%=depto.getCode_Department()%></td>
                                            <td><%=depto.getName()%></td>
                                            <td><input type="checkbox" value ='<%=depto.getCode_Department()%>' name="item"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option6")) {%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Clinical clinic : clinicalList) {%>
                                        <tr>
                                            <td><%=clinic.getCPF_CNPJ_Clinical()%></td>
                                            <td><%=clinic.getName()%></td>
                                            <td><input type="checkbox" value ='<%=clinic.getCPF_CNPJ_Clinical()%>' name="item"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option9")) {%>
                                    <div class="form-group">
                                            <div class="col-sm-2">
                                                <button type="submit" class="btn btn-primary" name="Command" value="option9">Buscar</button>
                                            </div>
                                            <div class="col-sm-30" width="10">
                                                <input type="Number" class="form-control form-control2" name="search" placeholder="Digite o SN do Equipamento" >
                                            </div>
                                        </div><br><br><br><br>
                                        <%if(returnn2!=null){%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th><%out.print(campo3);%></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Maintenance maintenance : maintenanceList) {%>
                                        <tr>
                                            <td><%=maintenance.getCode_Maintenance()%></td>
                                            <td><%=maintenance.getDate()%></td>
                                            <td><%=maintenance.getProblem()%></td>
                                            <td><%=maintenance.getSolution()%></td>
                                            <td><%=maintenance.getSN_Equipment()%></td>
                                            <td><%=maintenance.getCPF_Employee()%></td>
                                            <td><input type="checkbox" value ='<%=maintenance.getCode_Maintenance()%>' name="item"></td>
                                        </tr>
                                        <%}}%>
                                    </tbody>
                                </table>
                                <%}%> 
                                <%if (option.equalsIgnoreCase("option10")) {%>
                                <div class="form-group"><br><br>
                                            <div class="col-sm-30" width="10">
                                                <a>Data Inical</a>
                                                <input type="Text" class="form-control form-control2" name="Date1" placeholder="dd-mm-yyyy" >
                                            </div><br>
                                            <div class="col-sm-30" width="10">
                                                <a>Data Final</a>
                                                <input type="Text" class="form-control form-control2" name="Date2" placeholder="dd-mm-yyyy">
                                            </div><br>
                                            <div class="col-sm-2">
                                                <button type="submit" class="btn btn-primary" name="Command" value="option10">Buscar</button>
                                            </div>
                                        </div><br><br><br><br>
                                        <%if(returnn2!=null){%>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><%out.print(campo1);%></th>
                                            <th><%out.print(campo2);%></th>
                                            <th><%out.print(campo3);%></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Maintenance maintenance : maintenanceList) {%>
                                        <tr>
                                            <td><%=maintenance.getCode_Maintenance()%></td>
                                            <td><%=maintenance.getDate()%></td>
                                            <td><%=maintenance.getProblem()%></td>
                                            <td><%=maintenance.getSolution()%></td>
                                            <td><%=maintenance.getSN_Equipment()%></td>
                                            <td><%=maintenance.getCPF_Employee()%></td>
                                            <td><input type="checkbox" value ='<%=maintenance.getCode_Maintenance()%>' name="item"></td>
                                        </tr>
                                        <%}}%>
                                    </tbody>
                                </table>
                                <%}%> 
                            </div>
                            <div class="section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <a class="btn btn-primary" onclick="window.print();">Imprimir</a>
                                            <input class="btn btn-primary" type="button" value="Voltar" onClick="history.go(-1)"> 
                                        </div>
                                        <div class="col-md-3">
                                            <%if (option != null) {
                                                    if (option.equals("option1")) {
                                            %><div><button class="btn btn-primary" name="Command" value="option1">Atualizar Item</button></div><%
                                            } else if (option.equals("option3")) {
                                            %><div class="col-md-3">
                                                <button class="btn btn-primary" name="Command" value="option3">Atualizar Item</button>
                                            </div><div class="col-md-3"></div>
                                            <div class="col-md-3">
                                                <button class="btn btn-primary" name="Command" value="option2">Ver peças utilizadas</button>
                                            </div><%
                                            } else if (option.equals("option4")) {
                                            %><div><button class="btn btn-primary" name="Command" value="option4">Atualizar Item</button></div><%
                                                } else if (option.equals("option5")) {
                                            %><div><button class="btn btn-primary" name="Command" value="option5">Atualizar Item</button></div><%
                                                } else if (option.equals("option6")) {
                                            %><div><button class="btn btn-primary" name="Command" value="option6">Atualizar Item</button></div><%
                                                } else if (option.equals("option7")) {
                                            %><div><button class="btn btn-primary" name="Command" value="option7">Atualizar Item</button></div><%
                                                } else if (option.equals("option8")) {
                                            %><div><button class="btn btn-primary" name="Command" value="option8">Atualizar Item</button></div><%
                                                    }else if (option.equals("option9")) {
                                            %><div class="col-md-3">
                                                <button class="btn btn-primary" name="Command" value="option3">Atualizar Item</button>
                                            </div><div class="col-md-3"></div>
                                            <div class="col-md-3">
                                                <button class="btn btn-primary" name="Command" value="option2">Ver peças utilizadas</button>
                                            </div><%}
                                                }%>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body></html>
    <%session.setAttribute("Returnn", null);%>
    <%session.setAttribute("Returnn2", null);%>
    <%session.setAttribute("field1", null);%>
    <%session.setAttribute("Message", null);%>
    <%session.setAttribute("Returnn_Wait", null);%>
   
