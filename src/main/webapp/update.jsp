
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> <html> <head> <meta charset="ISO-8859-1">
<title> Update Book Review</title>
   <link rel="stylesheet" href="style.css"  type="text/css"> 
    <%@ include file="lockout.jsp" %>
<script>
window.addEventListener("load",main) 
function main() {
fetch("http://localhost:8080/Book_Review_System/api/retrieve")
.then(function (response) {return response.json()}) .then(
		function (data)
		{HTML="<table>"
			HTML+= "<thead><tr> <td>Book_ID</td> <td>Book Name</td><td>Rating</td><td>Reviewed By</td></tr></thead> "
			for (i=0;i<data.length;i++) 
			{HTML+="<tr>" 
				
				HTML+="<td>"+"<a href='update1.jsp?id="+data[i].book_ID+"'>"+data[i].book_ID+"</a></td>"
				HTML+="<td>"+data[i].bookName + "</td>" 
				HTML+="<td>"+data[i].bookRating + "</td>"
				HTML+="<td>"+data[i].bookReviewerName + "</td>" 

				HTML+="</tr>"} HTML+="</table>" 
				dvData.innerHTML=HTML
})
}
</script> </head> <body>
<div class="main"> 
<h1>Select a id to update the Book Review</h1>
 <div id="dvData"></div>
   <div class="link">
      <a href ="./index.jsp">  Home </a><br>
   <a href ="./create.jsp">  Create a Book Review </a> <br>
   <a href ="./delete.jsp">  Delete a Book Review </a>
   </div>
</div>
</body>
 </html>
