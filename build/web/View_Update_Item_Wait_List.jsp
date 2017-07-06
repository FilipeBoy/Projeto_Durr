<%String usuario = (String) session.getAttribute("Nome");
    String retorno = (String) session.getAttribute("Retorno");
    String mensagem = (String) session.getAttribute("Mensagem");
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
                            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >Manuten��o<br><i class="fa fa-caret-down"></i></a>
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
                                    <a href="View_Register_Item.jsp">Pe�as</a>
                                </li>
                                <li>
                                    <a href="View_Register_Clinical.jsp">Clinicas</a>
                                </li>
                                <li>
                                    <a href="View_Register_Employee.jsp">Funcion�rios</a>
                                </li>
                                <li>
                                    <a href="View_Register_Department.jsp">Departamentos</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="View_Report.jsp">Relat�rios</a>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <% if (usuario != null) {%>
                        <li class="active">
                            <a href="Logoff.jsp">Sair</a>
                        </li>

                        <li class="active">
                            <a><%out.print(usuario);%></a>
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
                        <h2 class="text-primary-inicial text-center">Atualiza��o do Status de Equipamento na Manuten��o</h2>
                        <br>
                        <br>
                        <a><% if (mensagem != null) {
                                out.print(mensagem);
                            }%></a>
                        <form role="form" action="ControllerCurso.jsp" method="post">
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <button type="submit" class="btn btn-primary" name="BotaoComando" value="buscar">Buscar</button>
                                </div>
                                <div class="col-sm-30" width="10">
                                    <input type="text" class="form-control form-control2" name="busca" placeholder="Digite o c�digo de registro da manuten��o">
                                </div>
                            </div><br><br><br><br>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="SN" class="control-label">SN Equipamento</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="Text" class="form-control form-control2" name="SN" placeholder="Somente n�meros"  <% if (retorno != null) {%>value="<%out.print((String) session.getAttribute("campo1"));%>"<%}%>>
                                </div>
                            </div><br>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Data" class="control-label">Data</label>
                                </div>
                                <div class="col-sm-30">
                                    <input type="date" class="form-control form-control2" name="Data"  <% if (retorno != null) {%>value="<%out.print((String) session.getAttribute("campo2"));%>"<%}%>>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Status" class="control-label">Status</label>
                                </div>
                                <div class="col-sm-30">
                                    <select name="Status">
                                        <option selected value="vazio"></option>
                                        <option value="Wait_Maint">Aguardando Manuten��o</option>
                                        <option value="Wait_budget">Aguardando Aprova��o Or�amento</option>
                                        <option value="realeased">Liberado</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Problem" class="control-label">Problema</label>
                                </div>
                                <div class="col-sm-30">
                                    <textarea name="Problem" rows="4" cols="64">
 
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label for="Prognosis" class="control-label">Progn�stico</label>
                                </div>
                                <div class="col-sm-30">
                                    <textarea name="Prognosis" rows="4" cols="64">

                                    </textarea>
                                </div>
                            </div>
                            <div class="section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-primary" name="BotaoComando" value="salvar">Salvar</button>
                                        </div>
                                        <%// if (usuario != null && usuario.equals("admin")) {%>
                                        <div class="col-md-3">
                                            <a href="CadastroCursos.jsp" class="btn btn-primary">Limpar</a>
                                        </div>
                                        <div class="col-md-3">
                                            <button class="btn btn-primary" name="BotaoComando" value="editar">Atualizar</button>
                                        </div>
                                        <div class="col-md-3">
                                            <button class="btn btn-primary" name="BotaoComando" value="excluir">Excluir</button>
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

