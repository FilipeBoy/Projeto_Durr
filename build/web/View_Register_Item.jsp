<%@page import="java.util.List"%>
<%@page import="DAO.Model_EquipmentDAO"%>
<%@page import="MODEL.Model_Equipment"%>
<%@page import="DAO.Model_ItemDAO"%>
<%@page import="MODEL.Model_Item"%>

<%String user = (String) session.getAttribute("Name");
    String returnn = (String) session.getAttribute("Returnn");
    String message = (String) session.getAttribute("Message");
    
    List<Model_Equipment> modelEquipList=null;
     List<Model_Item> Model_ItemUsedList=null;
    Model_EquipmentDAO model_equipDao= new Model_EquipmentDAO();
    modelEquipList=model_equipDao.list();
    if (returnn != null) {
        Model_ItemDAO Model_ItemDao= new Model_ItemDAO();
        Model_ItemUsedList=Model_ItemDao.list_for_Model(session.getAttribute("field1").toString());
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
                    <div class="col-md-12  text-primary-inicial width-form" >
                        <h2 class="text-primary-inicial text-center"><% if (returnn != null) {%>Atualização de Peça<%}else{%>Cadastro de Peças<%}%></h2>
                        <br>
                        <br>
                        <a><% if (message != null) {
                                out.print(message);
                            }%></a>
                        <form role="form" action="Controller_Item.jsp" method="post">
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <button type="submit" class="btn btn-primary" name="Command" value="search">Buscar</button>
                                </div>
                                <div class="col-sm-30" width="10">
                                    <input type="text" class="form-control form-control2" name="search" placeholder="Digite a referência da peça">
                                </div>
                            </div><br><br><br><br>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="RefItem" class="control-label">Referência da peça</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="Text" class="form-control form-control2" name="RefItem" placeholder="Somente números"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field1"));%>"<%}%>>
                                </div>
                            </div><br>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Name" class="control-label">Nome</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="Text" class="form-control form-control2" name="Name"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field2"));%>"<%}%>>
                                </div>
                            </div>
                                <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Amount" class="control-label">Quantidade</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="number" class="form-control form-control2" name="Amount"  <% if (returnn != null) {%>value="<%out.print(Integer.parseInt(session.getAttribute("field3").toString()));%>"<%}%>>
                                </div>
                            </div>
                                <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="RefMod" class="control-label">Referência<br>do Modelo</label>
                                </div>
                                <div class="col-sm-30">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Referência</th>
                                            <th>Modelo</th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Model_Equipment model : modelEquipList) {%>
                                        <tr>
                                            <td><%=model.getModel_Reference()%></td>
                                            <td><%=model.getName()%></td>
                                             <% if (returnn != null) {
                                                                    int count = 0, count2 = 0;
                                                                    for (Model_Item used_item : Model_ItemUsedList) {
                                                                        count2++;
                                                                    }
                                                                    for (Model_Item model_Item : Model_ItemUsedList) {
                                                                        if (model.getModel_Reference().equals(model_Item.getModel_Reference())) {%>
                                                                            <td><input type="checkbox" value ='<%=model.getModel_Reference()%>' name="item" checked ></td>
                                                                            <%break;
                                                                        } else {
                                                                             count++;
                                                                             if (count2 <= count) { %>
                                                                                <td><input type="checkbox" value ='<%=model.getModel_Reference()%>' name="item"  ></td> 
                                                                            <%}
                                                                        }
                                                                    }
                                                                } else {%><td><input type="checkbox" value ='<%=model.getModel_Reference()%>' name="item"  ></td> <%}%>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table> 
                            </div>
                            </div>
                            <div class="section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-primary" name="Command" value="save">Salvar</button>
                                        </div>
                                        <%// if (usuario != null && usuario.equals("admin")) {%>
                                        <div class="col-md-3">
                                            <a href="View_Register_Item.jsp" class="btn btn-primary">Limpar</a>
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

