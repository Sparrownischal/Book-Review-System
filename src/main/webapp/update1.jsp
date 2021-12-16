<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> <html> <head> <meta charset="ISO-8859-1">
<title>Update Book Review</title>
   <link rel="stylesheet" href="style.css"  type="text/css">
   <%@ include file="lockout.jsp" %>
   
 <script>
window.addEventListener("load", main) 
function main() { 
	btUpdate.addEventListener("click", doUpdate)
	console.log('helo')
QueryString=location.search 
IDVal=QueryString.replace("?id=","") 
// hack:remove ?KEY to get val
fetch("http://localhost:8080/Book_Review_System/api/retrieve/" ).then(function(response)
		{ return response.json()}) .then(function(data) {
// hack: since one KEY (id) 
i= IDVal;
		console.log(data);
		
console.log(i);
txBookId.value = data[i-1].book_ID;
txBookName.value = data[i-1].bookName;
txRating.value = data[i-1].bookRating;
txBookReviewerName.value = data[i-1].bookReviewerName;
})
} 
function doUpdate() {
var id, name, rating,reviewerName;
id = encodeURI(txBookId.value) ;
name = encodeURI(txBookName.value);
rating = encodeURI(txRating.value) ;
reviewerName = encodeURI(txBookReviewerName.value);

postbody = "txBookId="+ id + "&txBookName=" + name +"&txRating=" + rating + "&txBookReviewerName=" + reviewerName;
data = { method: "post",headers: 
{ "Content-Type": "application/x-www-form-urlencoded", }, body: postbody
}
fetch("http://localhost:8080/Book_Review_System/api/update", data)
.then(function(response) {location.href="index.jsp"})
}
</script>
 </head>
  <body>
  
  <div class="main">
<h1>Update the Book Review</h1>
 <input type="hidden" id="txBookId">
Name:<input type="text" id="txBookName"><br />
 Rating:<input type="text" id="txRating"><br /> 
 Reviewed By:<input type="text" id="txBookReviewerName"><br />
<br /> <input type="button" id="btUpdate" value="Update Book Review">
<div class="link">
      <a href ="./index.html">  Home </a><br>
   <a href ="./create.html">  Create a Book Review </a> <br>
   <a href ="./delete.html">  Delete a Book Review </a>
   </div>
</div>
</body> </html>