<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="font-family:calibri">
<center> <h2> App Sample </h2> </center>
<hr/>
</div>
<form name="frmLogin" method="post" action="validate.jsp">
<div style="border:solid thin orange; width:300px; height:200px;
margin:10px; padding:10px">

<table>
<tr>
<td>Email id:</td>
<td><input type="text" name="txtEmail"/></td>
</tr>

<tr>
<td>Password:</td>
<td><input type="password" name="txtPass"/></td>
</tr>

<tr>

<td><input type="submit" value="Login"  name="btnLogin"/></td>
</tr>
</table>
</div>
</form>
</body>
</html>
