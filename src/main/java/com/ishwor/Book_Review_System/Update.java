package com.ishwor.Book_Review_System;

import java.sql.*;
import java.net.*;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*; import
jakarta.ws.rs.core.Response.Status;
@Path("/update") public class Update {
@POST @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
public Response update(
		@FormParam("txBookId" ) String txbook_ID,
		@FormParam("txBookName" ) String txBookName,
		@FormParam("txRating" ) String txRating ,
		@FormParam("txBookReviewerName") String txBookReviewerName
) throws ClassNotFoundException, SQLException {
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
Statement cmd = con.createStatement(); 
String sql = String.format("update book_review set bookName='%s', bookRating='%s', bookReviewerName='%s' where book_ID='%s'", 
		txBookName, txRating, txBookReviewerName, txbook_ID);
cmd.executeUpdate(sql);
cmd.close();
con.close();
return Response.ok().build();
}
}
