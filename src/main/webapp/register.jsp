<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> 
<html> 
<head>
 <meta charset="ISO-8859-1"> 
 <title>Register</title>
<link rel="stylesheet" href="style.css"  type="text/css">
<%@ page import="java.sql.*" %>
 <% Class.forName("com.mysql.cj.jdbc.Driver");
String method=request.getMethod();
String ErrMsg="";
if (method.compareToIgnoreCase("post")==0) {

String Email = request.getParameter("txEmail");
String Username = request.getParameter("txUsername"); 
String Password = request.getParameter("txPassword");
String Verify = request.getParameter("txVerify");

if (Password.compareTo(Verify)!=0) ErrMsg="Passwords do not match!";
else {
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
Statement Cmd = Con.createStatement();
String SQL = String.format("select * from registration where username='%s'", Username);
ResultSet Dat = Cmd.executeQuery(SQL);

Boolean UserExists=Dat.next();

Dat.close();
Cmd.close();
Con.close();

if (UserExists) ErrMsg="Username "+Username+" taken"; else {

Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
Cmd = Con.createStatement();
SQL = String.format("insert into registration(email, username, password) values('%s', '%s', '%s')", Email,Username, Password);

Cmd.executeUpdate(SQL); Cmd.close(); Con.close();

request.getRequestDispatcher("login.jsp").forward(request, response);

}

}

} %>

</head> <body>
<div class="main">
<div style="color:red;font-weight:bold">
 <%=ErrMsg %> 
 </div>
  <h1>Register</h1> 
  <form method=post action="register.jsp"> 
  Email: <input type="text" name="txEmail"><br />
   Username: <input type="text" name="txUsername"><br />
    Password: <input type="password" name="txPassword"><br /> 
    Verify Password: <input type="password" name="txVerify"><br />
     <input type="submit" value="Register"> </form>
</div>
</body> 
</html>