<%-- 
    Document   : m1_Medic
    Created on : Nov 14, 2016, 1:39:35 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Medici</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Medici:</h1>
        <br/>
        <p align="center"><a href="nou_Medic.jsp"><b>Adauga un nou medic.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("medici", "idmedic", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Prenume = rs.getString("Prenume");
            String Sectie = rs.getString("Sectie");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Medic.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdMedic:</td>
                    <td> <input type="text" name="idmedic" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Sectie:</td>
                    <td> <input type="text" name="Sectie" size="30" value="<%= Sectie%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>