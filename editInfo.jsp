<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit info</title>
</head>
<body>
<%! 
String name="";
String addr="";
%>
<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con=DriverManager.getConnection("jdbc:sqlserver://192.168.37.200:1433; database=payroll;user=sa;password=antony");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select id,account from accounts");

int accno=Integer.parseInt(request.getParameter("accno"));
Statement stCust=con.createStatement();
ResultSet rsCust=stCust.executeQuery("select * from customers where accno="+accno);
rsCust.next();
name=rsCust.getString(2);
addr=rsCust.getString(3);
rsCust.close();
session.setAttribute("anum",accno);
%>
<form name="frmAccounts" method="get" action="Update.jsp">
<center><div style="width:500px; hight:300px; border:solid thin red; margin:10px padding:10px;">
<div><center>Customer Info</Center> 
<hr/>
</div>
<table border=1 cellspacing=10px style="border:solid thin orange; border-collapse:collapse; padding:5px;">
<tr>
<td>Name :</td>
<td><input type="text" name="txtName" value='<%=name%>'/></td>
</tr>
<tr>
<td>Address :</td>
<td><input type="text" name="txtAdd" value='<%=addr%>'/></td>
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
<td> Activate Customer:</td>
<td> <input type="checkbox" name="cbStatus" check/></td>
</tr>
<tr>
<td colspan="2"> <input type="submit" value="click to save the changes"/></td>
</tr>
</table>
</div>
</center>
</from>

</body>
</html>





