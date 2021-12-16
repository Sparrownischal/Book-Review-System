package com.ishwor.Book_Review_System;

import java.sql.*; 
import java.net.*;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*; 
import jakarta.ws.rs.core.Response.Status; 
@Path("/createReview") 
public class Create { 
	@POST
@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
public Response create(
@FormParam("txBookName" ) String txBookName,
@FormParam("txRating" ) String txRating ,
@FormParam("txReviewerName") String txReviewerName
) throws URISyntaxException, ClassNotFoundException, SQLException {
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
Statement cmd = con.createStatement();
String sql = String.format("insert into igdatabase.book_review(bookName, bookReviewerName, bookRating) values('%s', '%s', '%s')",txBookName,txReviewerName,txRating);
cmd.executeUpdate(sql);
cmd.close(); con.close();
return Response.status(Status.CREATED).build();
}
}