package com.ishwor.Book_Review_System;

public class ReviewBook {

public int book_ID; public String bookName; public int bookRating;
public String bookReviewerName; public String bookReviewDatePosted;
public ReviewBook() { }
public ReviewBook(int ID, String name, int rating, String ReviewerName, String date) {
this.book_ID=ID;
this.bookName=name;
this.bookRating=rating;
this.bookReviewerName = ReviewerName;
this.bookReviewDatePosted= date;
}
}