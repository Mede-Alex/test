<%-- 
    Document   : tabela_Medici
    Created on : Nov 14, 2016, 1:03:20 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Medici</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Medici:</h1>
        <br/>
        <p align="center"><a href="nou_Medic.jsp"><b>Adauga un nou medic.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="sterge_Medic.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdMedic:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Prenume:</b></td>
                    <td><b>Sectie:</b></td>

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("medici");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idmedic");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("Nume")%></td>
                    <td><%= rs.getString("Prenume")%></td>
                    <td><%= rs.getString("Sectie")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>