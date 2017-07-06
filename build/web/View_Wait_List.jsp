<%@page import="java.util.List"%>
<%@page import="MODEL.Wait_List"%> 
<%@page import="DAO.Wait_ListDAO"%>
<%String user = (String) session.getAttribute("Name");
    String returnn = (String) session.getAttribute("Returnn");
    String message = (String) session.getAttribute("Message");
    
List<Wait_List> waitList=null;
Wait_ListDAO waitListDao = new Wait_ListDAO();
waitList=waitListDao.list();
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
                    <div class="col-md-12  text-primary-inicial" >
                        <h2 class="text-primary-inicial text-center">Lista de Espera de Manutenção</h2>
                        <br>
                        <br>
                        <a><% if (message != null) {
                                out.print(message);
                            }%></a>
                        <form role="form" action="Controller_Wait_List.jsp" method="get">
                            <div class="col-sm-30">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Código</th>
                                            <th>Data de Chegada</th>
                                            <th>SN Equipamento</th>
                                            <th>Problema</th>
                                            <th>Prognóstico</th>
                                            <th>Status</th>
                                            <th>Selecionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Wait_List items : waitList) {%>
                                        <tr>
                                            <td><%=items.getCode_List()%></td>
                                            <td><%=items.getArrival_Date()%></td>
                                            <td><%=items.getSN_Equipment()%></td>
                                            <td><%=items.getProblem()%></td>
                                            <td><%=items.getPrognosis()%></td>
                                            <td><%=items.getStatus()%></td>
                                            <td><input type="checkbox" value ='<%=items.getCode_List()%>' name="search"></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table> 
                            </div>
                            <div class="section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                           <button  type="submit" class="btn btn-primary" name="Command"  value="start" >Iniciar Manutenção</button>
                                        </div>
                                        <div class="col-md-3">
                                           <button  type="submit" class="btn btn-primary" name="Command"  value="search2" >Atualizar Item</button>
                                        </div>
                                        <div class="col-md-3">
                                            <button class="btn btn-primary" name="Command" value="delete2">Excluir</button>
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
<%session.setAttribute("Message", null);%>
<%session.setAttribute("Returnn_Wait", null);%>
