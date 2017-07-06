<%String user = (String) session.getAttribute("Name");
    String returnn = (String) session.getAttribute("Returnn");
    String returnn2 = (String) session.getAttribute("Returnn2");
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
                width: 70% !important;
                left: 20%; 
                top: 20%;
            }
            .form-control2{
                width: 80% !important;
            }
            .control-label{
                font-weight:bold !important;
            }
            #coluna-1 { vertical-align: top !important; }
            #coluna-2 { width:80%; float:right !important; }
            .clearfix { clear:both; }


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
                        <h2 class="text-primary-inicial text-center"><% if (returnn != null) {%>Atualização de Clínica<%}else{%>Cadastro de Clínica<%}%></h2>
                        <a><% if (message != null) {
                                out.print(message);
                            }%></a>
                        <form role="form" action="Controller_Clinical.jsp" method="post">
                            <table>
                                <tr><% if (returnn != null) {%>
                                    <td width="800" id="coluna-1"  >
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <button type="submit" class="btn btn-primary" name="Command" value="searchClinical">Buscar</button>
                                            </div>
                                            <div class="col-sm-10" width="10">
                                                <input type="text" class="form-control form-control2" name="searchClinical" placeholder="CPF ou CNPJ">
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <label for="CPF" class="control-label">CPF/CNPJ</label>
                                            </div>
                                            <div class="col-sm-10" >
                                                <input type="Text" class="form-control " name="CPF" placeholder="Somente números"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field1"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <label for="Name" class="control-label">Nome</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control" name="Name"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field2"));%>"<%}%>>
                                            </div>
                                        </div>
                                    </td><% if (returnn2 != null) {%>
                                    <td width="800" id="coluna-1">
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <button type="submit" class="btn btn-primary" name="Command" value="searchUnid">Buscar</button>
                                            </div>
                                            <div class="col-sm-10" width="10">
                                                <input type="number" class="form-control form-control2" name="Code_unid" placeholder="Código da unidade" <% if (returnn != null) {%>value="<%out.print(Integer.parseInt( session.getAttribute("field11").toString()));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <label for="Street" class="control-label">Logradouro</label>
                                            </div>
                                            <div class="col-sm-10" >
                                                <input type="Text" class="form-control form-control2" name="Street"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field3"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>     
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Numberr" class="control-label">Número</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Numberr"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field4"));%>"<%}%>>
                                            </div>
                                        </div> <br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Complement" class="control-label">Complemento</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Complement"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field5"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Neighborhood" class="control-label">Bairro</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Neighborhood"  <% if (returnn!= null) {%>value="<%out.print((String) session.getAttribute("field6"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="City" class="control-label">Cidade</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="City"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field7"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="State" class="control-label">Estado</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="State"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field8"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Zip_code" class="control-label">CEP</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Zip_code"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field9"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Phone" class="control-label">Telefone</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Phone"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field10"));%>"<%}%>>
                                            </div>
                                        </div>
                                    </td><%}}else {%>
                                    <td width="800" id="coluna-1"  >
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <button type="submit" class="btn btn-primary" name="Command" value="searchClinical">Buscar</button>
                                            </div>
                                            <div class="col-sm-10" width="10">
                                                <input type="text" class="form-control form-control2" name="searchClinical" placeholder="CPF ou CNPJ">
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <label for="CPF" class="control-label">CPF/CNPJ</label>
                                            </div>
                                            <div class="col-sm-10" >
                                                <input type="Text" class="form-control " name="CPF" placeholder="Somente números"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field1"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <label for="Name" class="control-label">Nome</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control" name="Name"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field2"));%>"<%}%>>
                                            </div>
                                        </div>
                                    </td>
                                    <td width="800" id="coluna-1">
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <button type="submit" class="btn btn-primary" name="Command" value="searchUnid">Buscar</button>
                                            </div>
                                            <div class="col-sm-10" width="10">
                                                <input type="number" class="form-control form-control2" name="Code_unid" placeholder="Código da unidade" <% if (returnn != null) {%>value="<%out.print(Integer.parseInt( session.getAttribute("field11").toString()));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <label for="Street" class="control-label">Logradouro</label>
                                            </div>
                                            <div class="col-sm-10" >
                                                <input type="Text" class="form-control form-control2" name="Street"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field3"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>     
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Numberr" class="control-label">Número</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Numberr"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field4"));%>"<%}%>>
                                            </div>
                                        </div> <br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Complement" class="control-label">Complemento</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Complement"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field5"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Neighborhood" class="control-label">Bairro</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Neighborhood"  <% if (returnn!= null) {%>value="<%out.print((String) session.getAttribute("field6"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="City" class="control-label">Cidade</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="City"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field7"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="State" class="control-label">Estado</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="State"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field8"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Zip_code" class="control-label">CEP</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Zip_code"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field9"));%>"<%}%>>
                                            </div>
                                        </div><br><br><br>
                                        <div class="form-group" >
                                            <div class="col-sm-2">
                                                <label for="Phone" class="control-label">Telefone</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="Text" class="form-control form-control2" name="Phone"  <% if (returnn != null) {%>value="<%out.print((String) session.getAttribute("field10"));%>"<%}%>>
                                            </div>
                                        </div>
                                    </td><%}%>
                                </tr>
                            </table>
                            <br><br><br>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary" name="Command" value="save">Salvar</button>
                            </div>
                            <%// if (usuario != null && usuario.equals("admin")) {%>
                            <div class="col-md-3">
                                <a href="View_Register_Clinical.jsp" class="btn btn-primary">Limpar</a>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-primary" name="Command" value="edit">Atualizar</button>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-primary" name="Command" value="delete">Excluir</button>
                            </div><%//}%>
                        </form><br><br><br>
                    </div>
                </div>
            </div>
    </body></html>
<%session.setAttribute("Returnn", null);%>
<%session.setAttribute("Message", null);%>
<%session.setAttribute("Returnn_Wait", null);%>


