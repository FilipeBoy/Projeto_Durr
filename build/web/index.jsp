<%String message = (String) session.getAttribute("Message");%>
<html><head>

        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sistema Durr Dental</title>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="/Projeto_Durr/CSS/Durr.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
// Using jQuery.

            $(function () {
                $('form').each(function () {
                    $(this).find('input').keypress(function (e) {
                        // Enter pressed?
                        if (e.which == 10 || e.which == 13) {
                            this.form.submit();
                        }
                    });

                    $(this).find('input[type=submit]').hide();
                });
            });
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
            .text-primary-inicial{
                color:#0074d9 !important;
                background-color: rgba(181, 181, 181, 0.46);
            }
            .container{
                width: 60% !important
            }

        </style>
    </head><body>
        <div class="cover">
            <div class="cover-image" style="background-image : url('/Projeto_Durr/Images/mapa.png')" ></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <CENTER><img class="img-responsive" src="/Projeto_Durr/Images/logo.png"  ></CENTER>
                        <div class="section text-center">
                            <div class="container">
                                <div class="row text-center">
                                    <div class="col-md-12 text-left"  >
                                        <%if (message != null) {%>
                                                    <a class="section text-center"><%out.print(message);}%></a>
                                        <form class="form-horizontal" role="form" action="Authenticate_User.jsp" method="post">
                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="CPF" class="control-label">CPF</label>
                                                </div>
                                                <div class="col-sm-10">
                                                    <input type="Number" class="form-control" name="CPF" placeholder="Somente números">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="password" class="control-label">Password</label>
                                                </div>
                                                <div class="col-sm-10">
                                                    <input type="password" class="form-control" name="password" placeholder="Password">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10 col-md-1">
                                                    <button type="submit" class="btn btn-primary">Entrar</button>
                                                </div>
                                                <div class="col-sm-offset-2 col-sm-10 col-md-1"></div>
                                                <div class=" col-sm-15 col-md-1">
                                                    <button type="reset" class="btn btn-primary">Limpar</button>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10 ">
                                                    <a href="TelaRecuperaSenha.jsp">Esqueceu sua senha? Clique aqui para recuperar!</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </body></html>
<%session.setAttribute("Returnn", null);%>
<%session.setAttribute("Message", null);%>
<%session.setAttribute("returnn_wait", null);%>