<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html> <html> <head> <meta charset="ISO-8859-1">
<title>Create Client</title>
<link rel="stylesheet" href="style.css"  type="text/css">
<%@ include file="lockout.jsp" %>

 <script> addEventListener("load", main)
function main() {
btAdd.addEventListener("click", doAdd)
} 
 function doAdd() {
	var book_name, rating,reviewer_name;
	book_name = encodeURI(txBookName.value);
	rating = encodeURI(txRating.value);
	reviewer_name = encodeURI(txReviewerName.value);
	postbody ="txBookName="+ book_name + "&txRating=" + rating + "&txReviewerName="+ reviewer_name
data={
method: "post", headers: {
"Content-Type": "application/x-www-form-urlencoded",
}, body: postbody
} 
	fetch("http://localhost:8080/Book_Review_System/api/createReview", data)
.then(function(response) {
	console.log('data added');
location.href="index.jsp"
})
} </script>
 </head>
 <body>
 <div class="main">
  
 <h3>Adding a Book Review</h3>
 <table>
 <tr><td>Book Name:</td><td><input type="text" id="txBookName"> </td></tr>
  <tr><td>Rating: </td><td><input type="text"id="txRating"></td></tr>
  <tr><td> Reviewed By: </td> <td><input type="text"id="txReviewerName"> </td></tr>
 
     </table> <br>
     <input type="button" id="btAdd" value="Add Book Rating">
        <div class="link">
   <a href ="./index.jsp">  Home </a> <br>
   <a href ="./update.jsp">  Update Book Review </a><br>
   <a href ="./delete.jsp">  Delete a Book Review </a>
   </div>
     </div>
</body> 
</html>