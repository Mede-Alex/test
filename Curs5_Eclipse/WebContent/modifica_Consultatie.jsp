<%-- 
    Document   : modifica_Consultatie
    Created on : Nov 14, 2016, 1:36:40 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Consultatie</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Consultatie:</h1>
        <br/>
        <p align="center"><a href="nou_Consultatie.jsp"><b>Adauga o noua consultatie.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Consultatie.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdConsultatie:</b></td>
                    <td><b>IdPacient:</b></td>
                    <td><b>NumePacient:</b></td>
                    <td><b>PrenumePacient:</b></td>
                    <td><b>Adresa:</b></td>
                    <td><b>IdMedic:</b></td>
                    <td><b>NumeMedic:</b></td>
                    <td><b>PrenumeMedic:</b></td>
                    <td><b>Sectie:</b></td>
                    <td><b>DataConsultatie:</b></td>
                    <td><b>Diagnostic:</b></td>
                    <td><b>Medicament:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeConsultatie();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idconsultatie");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idpacient_consult")%></td>
                    <td><%= rs.getString("NumePacient")%></td>
                    <td><%= rs.getString("PrenumePacient")%></td>
                    <td><%= rs.getString("Adresa")%></td>
                    <td><%= rs.getInt("idmedic_consult")%></td>
                    <td><%= rs.getString("NumeMedic")%></td>
                    <td><%= rs.getString("PrenumeMedic")%></td>
                    <td><%= rs.getString("Sectie")%></td>
                    <td><%= rs.getDate("dataconsultatie")%></td>
                    <td><%= rs.getString("diagnostic")%></td>
                    <td><%= rs.getString("medicament")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>