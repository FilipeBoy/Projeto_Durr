package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class View_005fRegister_005fScanner_005fModel_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

String user = (String) session.getAttribute("Name");
    String returnn = (String) session.getAttribute("Returnn");
    String message = (String) session.getAttribute("Message");

      out.write("\n");
      out.write("<html><head>\n");
      out.write("\n");
      out.write("        <meta charset=\"windows-1252\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Sistema Durr Dental</title>\n");
      out.write("        <script type=\"text/javascript\" src=\"http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js\"></script>\n");
      out.write("        <link href=\"http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link href=\"/Projeto_Durr/CSS/Durr.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <style>\n");
      out.write("            .navbar\n");
      out.write("            {\n");
      out.write("                background-color: #4dc1ff !important;\n");
      out.write("                color: #fff;\n");
      out.write("                border-color: #4dc1ff !important;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .navbar-default .navbar-nav > li > a \n");
      out.write("            {\n");
      out.write("                color:  #fff !important;\n");
      out.write("                background-color: #4dc1ff !important;\n");
      out.write("                border: #4dc1ff !important;\n");
      out.write("            }\n");
      out.write("            .navbar-default .navbar-nav > li > a:hover\n");
      out.write("            {\n");
      out.write("                color: #4dc1ff!important;\n");
      out.write("                background-color: #fff  !important;\n");
      out.write("            }\n");
      out.write("            .dropdown-menu >li> a:hover{\n");
      out.write("                color:  #fff !important;\n");
      out.write("                background-color: #4dc1ff !important;\n");
      out.write("                border: #4dc1ff !important;\n");
      out.write("            }\n");
      out.write("            .text-primary-inicial{\n");
      out.write("                color:#0074d9 !important;\n");
      out.write("                background-color: rgba(245, 245, 245, 0.90);\n");
      out.write("                font-weight:bold !important;\n");
      out.write("            }\n");
      out.write("            .width-form{\n");
      out.write("                width: 60% !important;\n");
      out.write("                left: 20%; \n");
      out.write("                top: 20%;\n");
      out.write("            }\n");
      out.write("            .form-control2{\n");
      out.write("                width: 70% !important;\n");
      out.write("            }\n");
      out.write("            .control-label{\n");
      out.write("                font-weight:bold !important;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head><body>\n");
      out.write("        <div class=\"navbar navbar-default\">\n");
      out.write("            <div class=\"container-header\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <img class=\"img-responsive\" src=\"/Projeto_Durr/Images/logo.png\" width=\"140\" >\n");
      out.write("                </div>\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navbar-ex-collapse\">\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbar-ex-collapse\">\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-left\">\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a href=\"View_Home.jsp\">Home</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\" >Lista de Espera<br><i class=\"fa fa-caret-down\"></i></a>\n");
      out.write("                            <ul class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Check_Entry.jsp\" >Registrar entrada</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Wait_List.jsp\">Visualizar lista</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\" >Manutenção<br><i class=\"fa fa-caret-down\"></i></a>\n");
      out.write("                            <ul class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Consult_Maintenance.jsp\" >Consultar</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\" >Cadastros<br><i class=\"fa fa-caret-down\"></i></a>\n");
      out.write("                            <ul class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Register_Scanner_Model.jsp\" >Modelos de Scanners</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Register_Scanner.jsp\">Scanners</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Register_Item.jsp\">Peças</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Register_Clinical.jsp\">Clinicas</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Register_Employee.jsp\">Funcionários</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"View_Register_Department.jsp\">Departamentos</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a href=\"View_Report.jsp\">Relatórios</a>\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                        ");
 if (user != null) {
      out.write("\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a href=\"Logoff.jsp\">Sair</a>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a>");
out.print(user);
      out.write("</a>\n");
      out.write("                        </li>");
}
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"cover\">\n");
      out.write("            <div class=\"cover-image\" style=\"background-image : url('/Projeto_Durr/Images/imagem3.jpg')\" ></div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-12  text-primary-inicial width-form\" >\n");
      out.write("                        <h2 class=\"text-primary-inicial text-center\">");
 if (returnn != null) {
      out.write("Atualização de Modelo de Equipamento");
}else{
      out.write("Cadastro de Modelo de Equipamento");
}
      out.write("</h2>\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        <a>");
 if (message != null) {
                                out.print(message);
                            }
      out.write("</a>\n");
      out.write("                        <form role=\"form\" action=\"Controller_Model_Equipment.jsp\" method=\"post\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <div class=\"col-sm-2\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary\" name=\"Command\" value=\"search\">Buscar</button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-sm-30\" width=\"10\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control form-control2\" name=\"search\" placeholder=\"Digite a refeência do modelo\">\n");
      out.write("                                </div>\n");
      out.write("                            </div><br><br><br><br>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <div class=\"col-sm-2\">\n");
      out.write("                                    <label for=\"RefMod\" class=\"control-label\">Referência do Modelo</label>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-sm-30\">\n");
      out.write("                                    <input type=\"Text\" class=\"form-control form-control2\" name=\"RefMod\" placeholder=\"Referência\"  ");
 if (returnn != null) {
      out.write("value=\"");
out.print((String) session.getAttribute("field1"));
      out.write('"');
}
      out.write(">\n");
      out.write("                                </div>\n");
      out.write("                            </div><br>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <div class=\"col-sm-2\">\n");
      out.write("                                    <label for=\"Name\" class=\"control-label\">Nome</label>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-sm-30\">\n");
      out.write("                                    <input type=\"Text\" class=\"form-control form-control2\" name=\"Name\"  ");
 if (returnn != null) {
      out.write("value=\"");
out.print((String) session.getAttribute("field2"));
      out.write('"');
}
      out.write(">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"section\">\n");
      out.write("                                <div class=\"container\">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-md-3\">\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary\" name=\"Command\" value=\"save\">Salvar</button>\n");
      out.write("                                        </div>\n");
      out.write("                                        ");
// if (usuario != null && usuario.equals("admin")) {
      out.write("\n");
      out.write("                                        <div class=\"col-md-3\">\n");
      out.write("                                            <a href=\"Controller_Model_Equipment.jsp\" class=\"btn btn-primary\">Limpar</a>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-md-3\">\n");
      out.write("                                            <button class=\"btn btn-primary\" name=\"Command\" value=\"edit\">Atualizar</button>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-md-3\">\n");
      out.write("                                            <button class=\"btn btn-primary\" name=\"Command\" value=\"delete\">Excluir</button>\n");
      out.write("                                        </div>");
//}
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body></html>\n");
session.setAttribute("Returnn", null);
      out.write('\n');
session.setAttribute("Message", null);
      out.write('\n');
session.setAttribute("Returnn_Wait", null);
      out.write('\n');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
