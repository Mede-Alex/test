<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href ="Tabela_pacienti1.css" rel = "stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Pacienti</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Pacienti:</h1>
	<br />
	<p align="center">
		<a href="nou_Pacient.jsp"><b>Adauga un nou pacient.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<form action="sterge_Pacient.jsp" method="post">
	<div class ="container">
		<table border="1" align="center">
		<thead>
			<tr>
			
				<td><b>Mark:</b></td>
				<td><b>IdPacient:</b></td>
				<td><b>Nume:</b></td>
				<td><b>Prenume:</b></td>
				<td><b>Adresa:</b></td>

			</tr>
			</thead>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("pacienti");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idpacient");
                %>
             <tbody>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("Nume")%></td>
				<td><%= rs.getString("Prenume")%></td>
				<td><%= rs.getString("Adresa")%></td>
				<%
                        }
                    %>
			</tr>
			  </tbody>
		</table>
		</div>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>