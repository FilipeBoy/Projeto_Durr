<%@page import="DAO.EquipmentDAO"%>
<%@page import="MODEL.Equipment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*" %> 
<%@page import="MODEL.Item"%> 
<%@page import="DAO.ItemDAO"%> 
<%@page import="MODEL.Model_Item"%> 
<%@page import="DAO.Model_ItemDAO"%>
<%@page import="MODEL.Item_List"%> 
<%@page import="DAO.Item_ListDAO"%>
<%String user = (String) session.getAttribute("Name");
    String returnn = (String) session.getAttribute("Returnn");
    String returnn_wait = (String) session.getAttribute("Returnn_Wait");
    String message = (String) session.getAttribute("Message");
    List<Item> items = null;
    List<Item_List> used_items = null;
    if (returnn_wait != null || returnn != null) {
        String search = (String) session.getAttribute("field2");
        Equipment equip = new Equipment(search);
        EquipmentDAO equipDao = new EquipmentDAO();
        equip = equipDao.search(equip);
        if (equip != null) {
            Model_ItemDAO Model_ItemDao = new Model_ItemDAO();
            items = Model_ItemDao.list_for_Reference(equip.getModel_Reference());
        }
        if(returnn != null){
           int CodMaintenance = Integer.parseInt(session.getAttribute("field1").toString());
            Item_ListDAO used_itemDao = new Item_ListDAO();
            used_items = used_itemDao.list_for_Maintenance(CodMaintenance); 
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
            .text-primary-inicial{
                color:#0074d9 !important;
                background-color: rgba(245, 245, 245, 0.75);
                font-weight:bold !important;
            }
            .dropdown-menu >li> a:hover{
                color:  #fff !important;
                background-color: #4dc1ff !important;
                border: #4dc1ff !important;
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
            #coluna-1 { vertical-align: top !important; }
            #coluna-2 { float:right !important; }
            #coluna-3 {float:right !important; }



        </style>
        <%!
            String getDateTime() {
                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
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
                            <a href="View_Register_Employee.jsp"><%out.print(user);%></a>
                        </li><%}%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="cover">
            <div class="cover-image" style="background-image : url('/Projeto_Durr/Images/Imagem4.jpg')" ></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12  text-primary-inicial " >
                        <h2 class="text-primary-inicial text-center"><% if (returnn != null) {%>Atualização de Manutenção de Equipamento<%}else{%>Registro de Manutenção de Equipamento<%}%></h2>
                        <br>
                        <br>
                        <a><% if (message != null) {
                                out.print(message);
                            }%></a>
                        <form role="form" action="Controller_Maintenance.jsp" method="post">
                            <table>
                                <tr>
                                    <td width="1000" id="coluna-1" >
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <button type="submit" class="btn btn-primary" name="Command" value="search">Buscar</button>
                                            </div>
                                            <div class="col-sm-30" width="10">
                                                <input type="Number" class="form-control form-control2" name="search" placeholder="Digite o código de registro da manutenção" <% if (returnn != null) {%>value="<%out.print(Integer.parseInt(session.getAttribute("field1").toString()));%>"<%}%>>
                                            </div>
                                        </div><br><br><br><br>
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <label for="SN" class="control-label">SN Equipamento</label>
                                            </div>
                                            <div class="col-sm-30">
                                                <input type="Text" class="form-control form-control2" name="SN"  <% if (returnn != null || returnn_wait != null) {%>value="<%out.print((String) session.getAttribute("field2"));%>"<%}%>>
                                            </div>
                                        </div><br>
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <label for="Date" class="control-label">Data</label>
                                            </div>
                                            <div class="col-sm-30">
                                                <input type="Text" class="form-control form-control2" name="Date" value="<%=getDateTime()%>" <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field3"));%>"<%}%>>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <label for="Problem" class="control-label">Problema</label>
                                            </div>
                                            <div class="col-sm-30">
                                                <input type="Text" class="form-control form-control2" name="Problem"  <% if (returnn != null || returnn_wait != null) {%>value="<%out.print((String) session.getAttribute("field4"));%>"<%}%>>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <label for="Solution" class="control-label">Solução</label>
                                            </div>
                                            <div class="col-sm-30">
                                                <input type="Text" class="form-control form-control2" name="Solution"  <% if (returnn != null || returnn_wait != null) {%>value="<%out.print((String) session.getAttribute("field5"));%>"<%}%>>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="1000"  >
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <label for="Required_Item" class="control-label">Item obrigatório</label>
                                            </div><br>
                                            <div class="col-sm-30">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th >Referência</th>
                                                            <th >Nome</th>
                                                            <th>Selecionar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%if (returnn_wait != null || returnn != null) {
                                                                for (Item item : items) {%>
                                                        <tr>
                                                            <td><%=item.getItem_Reference()%></td>
                                                            <td><%=item.getName()%></td>
                                                            <% if (returnn != null) {
                                                                    int count = 0, count2 = 0;
                                                                    for (Item_List used_item : used_items) {
                                                                        count2++;
                                                                    }
                                                                    for (Item_List used_item : used_items) {
                                                                        if (item.getItem_Reference().equals(used_item.getItem_Reference())) {%>
                                                                            <td><input type="checkbox" value ='<%=item.getItem_Reference()%>' name="item" checked ></td>
                                                                            <%break;
                                                                        } else {
                                                                             count++;
                                                                             if (count2 <= count) { %>
                                                                                <td><input type="checkbox" value ='<%=item.getItem_Reference()%>' name="item"  ></td> 
                                                                            <%}
                                                                        }
                                                                    }
                                                                } else {%>
                                                            <td><input type="checkbox" value ='<%=item.getItem_Reference()%>' name="item"  ></td>       
                                                                <%}
                                                                        }
                                                                    }%>
                                                        </tr>
                                                    </tbody>
                                                </table> 
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-primary" name="Command" value="save">Salvar</button>
                                        </div>
                                        <%// if (usuario != null && usuario.equals("admin")) {%>
                                        <div class="col-md-3">
                                            <a href="CadastroCursos.jsp" class="btn btn-primary">Limpar</a>
                                        </div>
                                        <div class="col-md-3">
                                            <button class="btn btn-primary" name="Command" value="edit">Atualizar</button>
                                        </div>
                                        <div class="col-md-3">
                                            <button class="btn btn-primary" name="Command" value="delete">Excluir</button>
                                        </div><%//}%>
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
    <%session.setAttribute("Message", null);%>
    <%session.setAttribute("Returnn_Wait", null);%>

