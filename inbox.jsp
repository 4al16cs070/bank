<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta  http-eqiv="Content Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="font-family:calibri">
<h2 style="color":blue">Welcome:<span><%=request.getParameter("name") %>
</span></h2>
<hr/>

<div style="width:200px; height:auto; padding:20px; margin:10px">
<div style="padding:5px; margin:5px">
<a href="ListCustomer.jsp">List Customer Info</a>
</div>
<div style="padding:5px;margin:5px">
<a href="AddCoustomer.jsp">Open New Account</a>
</div>
<div style="padding:5px; margin:5px">
<a href="home.jsp">Logout</a>
</div>
</div>
</body>
</html>

