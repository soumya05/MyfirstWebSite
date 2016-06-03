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
    background-color: green;
}
</style>
<body>
<% 

Connection con;
PreparedStatement stmt;
ResultSet rs;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/mydatabase";
String user_name = "root";
String psw = "root";


String user=request.getParameter("userid");
String pwd=request.getParameter("pwd");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");

//String sql="insert into tb1 values("+user+","+pwd+","+fname+","+lname+","+email+")";
String sql= "insert into tb1 (name,password,fanme,lname,email)" + " values (?,?,?,?,?)";
//String sql= "insert into `tb1`(`name`,`password`,`fanme`,`lname`,`email`') values ("+user+","+pwd+","+fname+","+lname+","+email+" )";
//"insert into tb1 values("+user+","+pwd+","+fname+","+lname+","+email+")";
try{
Class.forName(driverName);
con = DriverManager.getConnection(url,user_name,psw);
stmt=con.prepareStatement(sql);
stmt.setString(1, user);
stmt.setString(2, pwd);
stmt.setString(3, fname);
stmt.setString(4, lname);
stmt.setString(5, email);
stmt.executeUpdate();
String message= "Succesfully Registered!!!";
out.println("<h2>"+ message +"</h2>");

}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<br>
<a href="login.html"> Login</a>
<br><br><br><br>
<a href="index.html">Home</a>
</body>
</html>