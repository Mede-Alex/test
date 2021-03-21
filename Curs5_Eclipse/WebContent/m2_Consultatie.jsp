<%-- 
    Document   : m2_Consultatie
    Created on : Nov 14, 2016, 1:42:49 PM
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
        <h1 align="center"> Tabela Consultatie:</h1>
        <br/>
        <p align="center"><a href="nou_Consultatie.jsp"><b>Adauga o noua consultatie.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idconsultatie"));
            String idpacient = request.getParameter("idpacient");
            String idmedic = request.getParameter("idmedic");
            String DataConsultatie = request.getParameter("DataConsultatie");
            String Diagnostic = request.getParameter("Diagnostic");
            String Medicament = request.getParameter("Medicament");

            String[] valori = {idpacient, idmedic, DataConsultatie, Diagnostic, Medicament};
            String[] campuri = {"idpacient", "idmedic", "DataConsultatie", "Diagnostic", "Medicament"};
            jb.modificaTabela("consultatie", "idconsultatie", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>