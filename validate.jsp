<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("txtEmail");
String pwd=request.getParameter("txtPass");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con=DriverManager.getConnection("jdbc:sqlserver://192.168.37.200:1433; database=payroll;user=sa;password=antony");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select name , password from users where email='"+email+"'");
if(rs.next())
{
if(rs.getString(2).equals(pwd))
{
String name=rs.getString(1);
con.close();
response.sendRedirect("inbox.jsp?name="+name);
}

else
{
con.close();
out.print("<h3>Login failed</h3><br/>");
out.print("<a href='home.jsp'>click here to login again</a>");
}
rs.close();
out.print("<h3>login failed<h3><br/>");
out.print("<a href='home.jsp'>Click here to login again</a>");


}
%>
</body>
</html>