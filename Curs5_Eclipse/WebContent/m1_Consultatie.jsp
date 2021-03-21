<%-- 
    Document   : m1_Consultatie
    Created on : Nov 14, 2016, 1:39:35 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Consultatie</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Consultatie:</h1>
        <br/>
        <p align="center"><a href="nou_Consultatie.jsp"><b>Adauga o noua consultatie.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String NumePacient, PrenumePacient, Adresa, NumeMedic, PrenumeMedic, Sectie, Diagnostic, Medicament, DataConsultatie;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceConsultatieId(aux);
            rs.first();
            int id1 = rs.getInt("idpacient_consult");
            int id2 = rs.getInt("idmedic_consult");

            NumePacient = rs.getString("NumePacient");
            PrenumePacient = rs.getString("PrenumePacient");
            Adresa = rs.getString("Adresa");
            NumeMedic = rs.getString("NumeMedic");
            PrenumeMedic = rs.getString("PrenumeMedic");
            Sectie = rs.getString("Sectie");
            DataConsultatie = rs.getString("DataConsultatie");
            Diagnostic = rs.getString("Diagnostic");
            Medicament = rs.getString("Medicament");

            ResultSet rs1 = jb.vedeTabela("pacienti");
            ResultSet rs2 = jb.vedeTabela("medici");
            int idpacient, idmedic;


        %>
        <form action="m2_Consultatie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdConsultatie:</td>
                    <td> <input type="text" name="idconsultatie" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idpacient:</td>
                    <td> 
                        <SELECT NAME="idpacient">
                            <%
                                while (rs1.next()) {
                                    idpacient = rs1.getInt("idpacient");
                                    NumePacient = rs1.getString("Nume");
                                    PrenumePacient = rs1.getString("Prenume");
                                    Adresa = rs1.getString("Adresa");
                                    if (idpacient != id1) {
                            %>
                            <OPTION VALUE="<%= idpacient%>"><%= idpacient%>, <%= NumePacient%>, <%= PrenumePacient%>, <%= Adresa%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idpacient%>"><%= idpacient%>, <%= NumePacient%>, <%= PrenumePacient%>, <%= Adresa%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idmedic:</td>
                    <td> 
                        <SELECT NAME="idmedic">
                            <%
                                while (rs2.next()) {
                                    idmedic = rs2.getInt("idmedic");
                                    NumeMedic = rs2.getString("Nume");
                                    PrenumeMedic = rs2.getString("Prenume");
                                    Sectie = rs2.getString("Sectie");
                            if (idmedic != id2) {
                            %>
                            <OPTION VALUE="<%= idmedic%>"><%= idmedic%>, <%= NumeMedic%>, <%= PrenumeMedic%>, <%= Sectie%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idmedic%>"><%= idmedic%>, <%= NumeMedic%>, <%= PrenumeMedic%>, <%= Sectie%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">DataConsultatie:</td>
                    <td> <input type="text" name="DataConsultatie" size="30" value="<%= DataConsultatie%>"/></td>
                </tr>
                <tr>
                    <td align="right">Diagnostic:</td>
                    <td> <input type="text" name="Diagnostic" size="30" value="<%= Diagnostic%>"/></td>
                </tr>
                <tr>
                    <td align="right">Medicament:</td>
                    <td> <input type="text" name="Medicament" size="30" value="<%= Medicament%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>