<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("txtName");
String address=request.getParameter("txtAdd");
int account=Integer.parseInt(request.getParameter("account"));
int status=0;
if(request.getParameter("cbStatus").equals("on"));
{
	status=1;
}
int accno=Integer.parseInt(session.getAttribute("anum").toString());
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con=DriverManager.getConnection("jdbc:sqlserver://192.168.37.200:1433; database=payroll;user=sa;password=antony");

PreparedStatement stmt=con.prepareStatement("update customers set name=? ,address=?, account=?, status=? where accno=?");
stmt.setString(1,name);

stmt.setString(2,address);
stmt.setInt(3,account);
stmt.setInt(4,status);
stmt.setInt(5,accno);
if(stmt.executeUpdate()>0)
{
	out.print("account has been updated  "+name+"<br/>");
	out.print("your account number  "+accno+"<br/>");
	out.print("<a href='AddCoustomer.jsp'>Open Account</a><br/>");
	out.print("<a href=inbox.jsp'>Home</a>,<br/>");
	con.close();
}
		
%>
</body>
</html>