
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MODEL.Clinical"%> 
<%@page import="DAO.ClinicalDAO"%> 
<%@page import="MODEL.Clinical_Unit"%> 
<%@page import="DAO.Clinical_UnitDAO"%> 

<%
    String Code_clinical = request.getParameter("CPF");
    String Name_clinical = request.getParameter("Name");
    String Street = request.getParameter("Street");
    String Number = request.getParameter("Numberr");
    String Complement = request.getParameter("Complement");
    String Neighborhood = request.getParameter("Neighborhood");
    String City = request.getParameter("City");
    String State = request.getParameter("State");
    String Zip_code = request.getParameter("Zip_code");
    String Phone = request.getParameter("Phone");
    String command = request.getParameter("Command");
    session.setAttribute("Returnn", null);
    session.setAttribute("Message", null);
    String message;

    if (command.equals("save")) {
        
        Clinical clinic = new Clinical(Code_clinical);
        ClinicalDAO clinicDao = new ClinicalDAO();
        clinic=clinicDao.search(clinic);
        if (clinic != null){
            Clinical_Unit clinic_Unit = new Clinical_Unit(Street,Number,Complement,
            Phone,Neighborhood,City,State,Zip_code,Code_clinical);
            Clinical_UnitDAO clinic_UnitDao = new Clinical_UnitDAO();
            message=clinic_UnitDao.save(clinic_Unit);
            session.setAttribute("Message", message); 
        }else{
            clinic = new Clinical(Code_clinical,Name_clinical);
            clinicDao = new ClinicalDAO();
            clinicDao.save(clinic);
            Clinical_Unit clinic_Unit = new Clinical_Unit(Street,Number,Complement,
            Phone,Neighborhood,City,State,Zip_code,Code_clinical);
            Clinical_UnitDAO clinic_UnitDao = new Clinical_UnitDAO();
            message=clinic_UnitDao.save(clinic_Unit);
            session.setAttribute("Message", message); 
        }
         
        request.getRequestDispatcher("View_Register_Clinical.jsp").forward(request, response);
        
    } else if (command.equals("delete")) {
        if (request.getParameter("Code_unid")!=null){
            int Code_unid = Integer.parseInt(request.getParameter("Code_unid"));
            Clinical_Unit clinic_Unit = new Clinical_Unit(Code_unid);
            Clinical_UnitDAO clinic_UnitDao = new Clinical_UnitDAO();
            message=clinic_UnitDao.delete(clinic_Unit);
        }else{
            Clinical_Unit clinic_Unit = new Clinical_Unit(Code_clinical);
            Clinical_UnitDAO clinic_UnitDao = new Clinical_UnitDAO();
            String flag=clinic_UnitDao.search_for_CPF_Clinical(clinic_Unit);
            if(flag.equals("yes")){
                Clinical clinic = new Clinical(Code_clinical);
                ClinicalDAO clinicDao = new ClinicalDAO();
                message=clinicDao.delete(clinic);
                session.setAttribute("Message", message);
            }else{
                session.setAttribute("Message", "Esta clínica possui unidades cadastradas!\nVocê deve excluir as unidades primeiro!");
            }
        }
        request.getRequestDispatcher("View_Register_Clinical.jsp").forward(request, response);

    } else if (command.equals("edit")) {
        Clinical clinic = new Clinical(Code_clinical,Name_clinical);
        ClinicalDAO clinicDao = new ClinicalDAO();
        message=clinicDao.edit(clinic);
        if (request.getParameter("Code_unid")!=null){
            
            Clinical_Unit clinic_Unit = new Clinical_Unit(Street,Number,Complement,
            Phone,Neighborhood,City,State,Zip_code,Code_clinical);
            Clinical_UnitDAO clinic_UnitDao = new Clinical_UnitDAO();
            message=clinic_UnitDao.edit(clinic_Unit);
            session.setAttribute("Message", message);
        }else{
           session.setAttribute("Message", message); 
        }
        request.getRequestDispatcher("View_Register_Clinical.jsp").forward(request, response);

    } else if (command.equals("searchClinical")) {
            Code_clinical = request.getParameter("searchClinical");
            Clinical clinic = new Clinical(Code_clinical);
            ClinicalDAO clinicDao = new ClinicalDAO();
            clinic=clinicDao.search(clinic);
            if(clinic != null){
            session.setAttribute("Returnn", "yes");
            session.setAttribute("field1",Code_clinical);
            session.setAttribute("field2", clinic.getName());
            }else {
            session.setAttribute("Message", "Registro não encontrado");
            }
            request.getRequestDispatcher("View_Register_Clinical.jsp").forward(request, response);
            
    }else if (command.equals("searchUnid")) {
            int Code_unid = Integer.parseInt(request.getParameter("Code_unid"));
            Clinical_Unit clinic_Unit = new Clinical_Unit(Code_unid);
            Clinical_UnitDAO clinic_UnitDao = new Clinical_UnitDAO();
            clinic_Unit=clinic_UnitDao.search_for_Code_Unit(clinic_Unit);
            if(clinic_Unit != null){
                session.setAttribute("Returnn2", "yes");
                session.setAttribute("field3",clinic_Unit.getStreet());
                session.setAttribute("field4", clinic_Unit.getNumber());
                session.setAttribute("field5",clinic_Unit.getComplement());
                session.setAttribute("field6",clinic_Unit.getNeighborhood() );
                session.setAttribute("field7",clinic_Unit.getCity());
                session.setAttribute("field8",clinic_Unit.getState() );
                session.setAttribute("field9",clinic_Unit.getZip_Code());
                session.setAttribute("field10",clinic_Unit.getPhone() );
                session.setAttribute("field11",Code_unid);
                Clinical clinic = new Clinical(clinic_Unit.getCPF_CNPJ_Clinical());
                ClinicalDAO clinicDao = new ClinicalDAO();
                clinic=clinicDao.search(clinic);
                if(clinic_Unit != null){
                     session.setAttribute("field1",clinic_Unit.getCPF_CNPJ_Clinical());
                     session.setAttribute("field2",clinic.getName());
                }
        } else {
            session.setAttribute("Message", "Registro não encontrado");
        }
        request.getRequestDispatcher("View_Register_Clinical.jsp").forward(request, response);
    }
    
%>