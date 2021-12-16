package com.ishwor.Book_Review_System;

import java.util.ArrayList;

import java.sql.*;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import jakarta.ws.rs.core.MediaType;
@Path("/retrieve")
public class Retrieve {
	 @GET @Produces(MediaType.APPLICATION_JSON) 
	 public ArrayList<ReviewBook> retrieve() throws ClassNotFoundException, SQLException {

		 ArrayList<ReviewBook> BookList = new ArrayList<ReviewBook>();

		 Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/igdatabase", "root", "root@123");
		 Statement Cmd = Con.createStatement(); 
		 String SQL = "select * from book_review";
		 ResultSet Dat = Cmd.executeQuery(SQL);

		 while (Dat.next()) {

		 int id = Dat.getInt("book_ID");
		 String name = Dat.getString("bookName");
		 int rating  = Dat.getInt("bookRating");
		 String bookReviewerName = Dat.getString("bookReviewerName");
		 String date = Dat.getString("bookReviewDatePosted");
		 String OneRow = String.format("%s, %s, %s, %s, %s <br>", id,name, rating, bookReviewerName, date);
		 ReviewBook RB = new ReviewBook(id,name, rating, bookReviewerName, date); 
//		 System.out.println(OneRow);
		 BookList.add(RB);
		 } 
		 Dat.close();
		 Cmd.close();
		 Con.close();
		 return(BookList);

		 }
		 }

