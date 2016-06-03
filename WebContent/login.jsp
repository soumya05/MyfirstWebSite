<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
a:link, a:visited {
    background-color: green;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}


a:hover, a:active {
    background-color: red;
}
</style>
<body>
<%
Connection con;
//Statement stmt;
PreparedStatement ps;
ResultSet rs;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/mydatabase";
String user_name = "root";
String psw = "root";
String userdbName;
String userdbPsw;


String user=request.getParameter("userid");
String pwd=request.getParameter("pwd");

//String sql= "select * from tb1 where name='userid'";
String sql = "select * from tb1 where name=? and password=?";

Class.forName(driverName);
con = DriverManager.getConnection(url,user_name,psw);
//stmt=con.createStatement();
ps = con.prepareStatement(sql);
ps.setString(1, user);
ps.setString(2, pwd);
//rs=stmt.executeQuery(sql);
rs = ps.executeQuery();
if(rs.next())
{
	userdbName = rs.getString("name");
	userdbPsw = rs.getString("password");
	if(user.equals(userdbName) && pwd.equals(userdbPsw))
	{
		out.println("<h2>"+"Welcome  "+user+"</h2>");
	}
	
	/*if(rs.getString("password").equals(pwd))
	{
		out.println("Welcome"+user);
	}*/

}
else
{
	out.println("Invalid password...!! Try Again");
}
	
	


%>
<br><br>
<a href="index1.html">Click Here to Visit My PhoneStore App</a>
<br><br><br><br>
<a href="index.html"> Back To Home </a>
</body>
</html>



