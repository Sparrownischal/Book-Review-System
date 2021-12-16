package com.ishwor.Book_Review_System;

import java.sql.*; 
import java.net.*;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*; 
import jakarta.ws.rs.core.Response.Status; 
@Path("/Register") 
public class Register { 
	@POST
@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
public Response create(
@FormParam("txEmail" ) String txEmail,
@FormParam("txUsername" ) String txUsername ,
@FormParam("txPassword") String txPassword,
@FormParam("txVerify") String txVerify ) throws URISyntaxException, ClassNotFoundException, SQLException {
Class.forName("com.mysql.cj.jdbc.Driver");
if(txPassword != txVerify) {
	
	
	}

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
Statement cmd = con.createStatement();
String sql = String.format("insert into registration (email, username, password) values('%s', '%s', '%s')", txEmail,txUsername, txPassword);
cmd.executeUpdate(sql);
cmd.close(); con.close();
return Response.status(Status.CREATED).build();
}
}