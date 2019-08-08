<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content Type" content="text/html; charset=ISO-8859-1">
<title>Open Accounts</title>
</head>
<body style="font-family:calibri">
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con=DriverManager.getConnection("jdbc:sqlserver://192.168.37.200:1433; database=payroll;user=sa;password=antony");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select id,account from accounts");
%>
<form  name="frmAccounts" method="get" action="save.jsp">
<center> <div style= "width:400px; height:300px; border:solid thin red; margin:10px; padding:10px;">
<table border=1 cellspacing=10px style="border:solid thin orange; border-collapse:collapse; padding:5px;">

<tr>
<td>Name :</td>
<td><input type="text" name="txtName"/></td>
</tr>

<tr>
<td>Address :</td>
<td><input type="text" name="txtAdd"/></td>
</tr>

<tr>
<td>Choose Preffered Account:</td>
<td>
<select name="account">
<%
while (rs.next())
{
out.print("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
}
con.close();
%>
</select>
</td>
</tr>

<tr>
<td colspan="2"> <input type="submit" value="Click to open Accounts"/> </td>
</tr>
</table>

</div>
</center>
</form>
</body>
</html>

