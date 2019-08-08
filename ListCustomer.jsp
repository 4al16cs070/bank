<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="editInfo.jsp" method ="post" name="frmCustInfo">
<center><h1>Customer Details</h1></center>
<hr/>
<div style="border:solid thin orange; front-size:.lem;">
<%

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con=DriverManager.getConnection("jdbc:sqlserver://192.168.37.200:1433; database=payroll;user=sa;password=antony");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select accno, name, address, a.account,case(status)when 1 then 'Active' else 'Deactivated' end from customers c inner join accounts a on a.id=c.account");
out.print("<table border=1 cellspacing=5px; cellpadding:5px style='border-collapse:collapse'>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td><a href='editInfo.jsp?accno="+rs.getString(1)+"'>Click to Edit</a></td>");
	out.print("<td>"+rs.getString(1)+"</td>");
	out.print("<td>"+rs.getString(2)+"</td>");
	out.print("<td>"+rs.getString(3)+"</td>");
	out.print("<td>"+rs.getString(4)+"</td>");
	out.print("<td>"+rs.getString(5)+"</td>");
	out.print("</tr>");
}
rs.close();
int accno=Integer.parseInt(request.getParameter("accno"));
Statement stCust=con.createStatement();
ResultSet rsCust=stCust.executeQuery("select * from customers where accno="+accno);
rsCust.next();
out.print("</table");
	
	%>
	
	


</form>
</body>
</html>