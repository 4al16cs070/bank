<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con=DriverManager.getConnection("jdbc:sqlserver://192.168.37.200:1433; database=payroll;user=sa;password=antony");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(accno)+1 from customers");
rs.next();
int accno=rs.getInt(1);
String name=request.getParameter("txtName");
String add=request.getParameter("txtAdd");
int account=Integer.parseInt(request.getParameter("account"));
int status=1;
rs.close();
PreparedStatement stmt=con.prepareStatement("insert into customers values(?,?,?,?,?)");
stmt.setInt(1,accno);

stmt.setString(2,name);
stmt.setString(3,add);
stmt.setInt(4,account);
stmt.setInt(5,status);
if(stmt.executeUpdate()>0)
{
	out.print("account has been updated  "+name+"<br/>");
	out.print("account number  "+accno);
	out.print("<a href='AddCoustomer.jsp'>Open Account</a><br/>");
	out.print("<a href=inbox.jsp'>Home</a>,<br/>");
	con.close();
}
%>




</body>
</html>