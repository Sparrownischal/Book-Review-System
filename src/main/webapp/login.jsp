<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> <!DOCTYPE html>
<html> 
<head> 
<meta charset="ISO-8859-1">
 <title>Login</title> 
 <link rel="stylesheet" href="style.css"  type="text/css">
 <%@ page import="java.sql.*" %>
  <% Class.forName("com.mysql.cj.jdbc.Driver");
  String method=request.getMethod();

String ErrMsg="";
if (method.compareToIgnoreCase("post")==0) {

String Username = request.getParameter("txUsername");
String Password = request.getParameter("txPassword");
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
Statement Cmd = Con.createStatement();
String SQL = String.format("select * from registration where username='%s' and password='%s'", Username, Password);
ResultSet Dat = Cmd.executeQuery(SQL);

Boolean UserExists=Dat.next();
if (!UserExists) ErrMsg="Invalid username or password";
else {
Username = Dat.getString("username");
String Email = Dat.getString("email");
HttpSession Session=request.getSession();
Session.setAttribute("username", Username); 
Session.setAttribute("email", Email);
if (Session.getAttribute("RetPage")==null || Session.getAttribute("RetPage").toString().isEmpty())

request.getRequestDispatcher("index.jsp").forward(request, response);

else {

}

String RetPage=Session.getAttribute("RetPage").toString();
request.getRequestDispatcher(RetPage).forward(request, response);
} 
Dat.close();
Cmd.close(); 
Con.close();

} %> </head>
 <body>
 <div class="main">
  <div style="color:red;font-weight:bold"> 
  <%=ErrMsg %> </div> <h1>Login</h1> 
  <form method=post action="login.jsp"> 
  UserName: <input type="text" name="txUsername"><br />
   Password: <input type="password" name="txPassword"><br /> 
   <input type="submit" value="Login"> 
   </form> 
   <p> Not Registered!! Register Now </p>
   <a href="./register.jsp" >Register</a>
   </div>
   </body> 
   </html>