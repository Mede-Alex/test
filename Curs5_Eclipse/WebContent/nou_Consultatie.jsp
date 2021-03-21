<%-- 
    Document   : nou_Consultatie
    Created on : Nov 14, 2016, 1:08:21 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga consultatie</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idpacient, idmedic;
            String id1, id2, NumePacient, PrenumePacient, Adresa, NumeMedic, PrenumeMedic, Sectie, Diagnostic, Medicament, DataConsultatie;
            id1 = request.getParameter("idpacient");
            id2 = request.getParameter("idmedic");
            DataConsultatie = request.getParameter("DataConsultatie");
            Diagnostic = request.getParameter("Diagnostic");
            Medicament = request.getParameter("Medicament");
            if (id1 != null) {
                jb.connect();
                jb.adaugaConsultatie(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), DataConsultatie, Diagnostic, Medicament);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("pacienti");
        ResultSet rs2 = jb.vedeTabela("medici");
        %>
        <h1> Suntem in tabela consultatie.</h1>
        <form action="nou_Consultatie.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdPacient:</td>
                    <td> 
                        Selectati pacientul:
			<SELECT NAME="idpacient">
                                <%
                                    while(rs1.next()){
                                        idpacient = rs1.getInt("idpacient");
                                        NumePacient = rs1.getString("Nume");
                                        PrenumePacient = rs1.getString("Prenume");
                                        Adresa = rs1.getString("Adresa");
                                %>
                                    <OPTION VALUE="<%= idpacient%>"><%= idpacient%>,<%= NumePacient%>,<%= PrenumePacient%>,<%= Adresa%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdMedic:</td>
                    <td> 
                        Selectati medicul:
			<SELECT NAME="idmedic">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idmedic = rs2.getInt("idmedic");
                                        NumeMedic = rs2.getString("Nume");
                                        PrenumeMedic = rs2.getString("Prenume");
                                        Sectie = rs2.getString("Sectie");
                                %>
                                    <OPTION VALUE="<%= idmedic%>"><%= idmedic%>,<%= NumeMedic%>,<%= PrenumeMedic%>,<%= Sectie%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Data consultatie:</td>
                    <td> <input type="text" name="DataConsultatie" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Diagnostic:</td>
                    <td> <input type="text" name="Diagnostic" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Medicament:</td>
                    <td> <input type="text" name="Medicament" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga pacientul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>