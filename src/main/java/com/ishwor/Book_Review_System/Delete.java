package com.ishwor.Book_Review_System;

import jakarta.ws.rs.*; 
import jakarta.ws.rs.core.*;
import java.sql.*;
@Path("/delete") public class Delete {
@DELETE @Path("{id}") 
public Response delete(@PathParam("id") int id) 
		throws ClassNotFoundException, SQLException {
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
Statement cmd = con.createStatement(); 
String sql=String.format("delete from book_review where book_ID=%s",id); 
//out.println(sql);
cmd.executeUpdate(sql);
cmd.close();
con.close();
return Response.ok().build();
}
}
