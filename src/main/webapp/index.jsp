<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
 <html> 
 <head>
  <meta charset="ISO-8859-1">
   <title>Final Project</title> 
   <link rel="stylesheet" href="style.css"  type="text/css">
   <%@ include file="lockout.jsp" %>
   <script>
   window.addEventListener("load", main) 
   function main() { fetch("http://localhost:8080/Book_Review_System/api/retrieve").then(function (response)
		   {return response.json()}) .then(function (data) {
		  
HTML="<table>" 
HTML+= "<thead><tr> <td>Book_ID</td> <td>Book Name</td><td>Rating</td><td>Reviewed By</td><td>Date</td><td>Action</td></tr></thead> "

for (i=0;i<data.length;i++) {
HTML+="<tr>" 
HTML+="<td>"+data[i].book_ID + "</td>" 
HTML+="<td>"+data[i].bookName + "</td>" 
HTML+="<td>"+data[i].bookRating + "</td>" 
HTML+="<td>"+data[i].bookReviewerName + "</td>" 
HTML+="<td>"+data[i].bookReviewDatePosted + "</td>"
HTML+="<td>  <a href='update1.jsp?id="+data[i].book_ID+"'>Update</a> / <a href='delete1.jsp?id="+data[i].book_ID+"'>Delete</a></td>"
HTML+="</tr>"
} HTML+="</table>" 
dvData.innerHTML=HTML
})
} 
   </script> 
   </head> 
   <body> 
   
   <div class= "main">
   <div class="logout">
   <button> <a href="logout.jsp">Logout</a></button>
   </div>
   <h1>Book Review</h1> 
   <div id="dvData">
   </div>
   <button id="addreview" ><a href ="./create.jsp">  Add a Book Review </a></button>
   
   <div class="link">
   <a href ="./create.jsp">  Create a Book Review </a><br>
   <a href ="./update.jsp">  Update Book Review </a></br>
   <a href ="./delete.jsp">  Delete a Book Review </a>
   </div>
   </div>
    </body> 
 </html>