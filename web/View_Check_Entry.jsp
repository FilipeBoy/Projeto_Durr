<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*" %> 
<%String user = (String) session.getAttribute("Name");
    String returnn = (String) session.getAttribute("Returnn");
    String message = (String) session.getAttribute("Message");
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
                        <h2 class="text-primary-inicial text-center">Registro de Entrada de Equipamento</h2>
                        <br>
                        <br>
                        <a><% if (message != null) {
                                out.print(message);
                            }%></a>
                        <form role="form" action="Controller_Wait_List.jsp" method="post">
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <button type="submit" class="btn btn-primary" name="Command" value="search">Buscar</button>
                                </div>
                                <div class="col-sm-30" width="10">
                                    <input type="int" class="form-control form-control2" name="search" placeholder="Digite o código de registro da manutenção"<% if (returnn != null) {%>value="<%out.print(Integer.parseInt( session.getAttribute("field1").toString()));%>"<%}%>>
                                </div>
                            </div><br><br><br><br>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="SN" class="control-label">SN Equipamento</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="Text" class="form-control form-control2" name="SN" placeholder="Somente números"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field2"));%>"<%}%>>
                                </div>
                            </div><br>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Date" class="control-label">Data</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="text" class="form-control form-control2" name="Date" value="<%=getDateTime()%>" <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field3"));%>"<%}%>>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Status" class="control-label">Status</label>
                                </div>
                                <div class="col-sm-30">
                                    <select name="Status">
                                        <% if (returnn != null) {%>
                                        <option selected value="<%out.print(session.getAttribute("fiel4"));%>" ><%out.print(session.getAttribute("field4"));%></option>
                                        <option value="Aguardando Manutenção"><% if (returnn != null && session.getAttribute("field4")!="Aguardando Manutenção") {%>Aguardando Manutenção<%}%></option>
                                        <option value="Aguardando Aprovação Orçamento"><% if (returnn != null && session.getAttribute("field4")!="Aguardando Aprovação Orçamento") {%>Aguardando Aprovação Orçamento<%}%></option>
                                        <option value="Liberado"><% if (returnn != null && session.getAttribute("fiel4")!="Liberado") {%>Liberado<%}%></option>
                                        <%}else{%>
                                        <option value="Aguardando Manutenção">Aguardando Manutenção</option>
                                        <option value="Aguardando Aprovação Orçamento">>Aguardando Aprovação Orçamento</option>
                                        <option value="Liberado">Liberado</option><%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Problem" class="control-label">Problema</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="text" class="form-control form-control2" name="Problem"  <% if (returnn != null) {%>value="<%out.print( session.getAttribute("field5").toString());%>"<%}%>>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Prognosis" class="control-label">Prognóstico</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="text" class="form-control form-control2" name="Prognosis"<% if (returnn != null) {%>value="<%out.print(session.getAttribute("field6").toString());%>"<%}%>>
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
                                            <a href="View_Check_Entry.jsp" class="btn btn-primary">Limpar</a>
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
