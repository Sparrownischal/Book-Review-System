
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> <html> <head> <meta charset="ISO-8859-1">
<title> Delete 1 </title>
   <link rel="stylesheet" href="style.css"  type="text/css">
    <%@ include file="lockout.jsp" %>
    <script>
window.addEventListener("load", main)
function main() {
// hack: since one KEY (id)
QueryString=location.search 
IDVal=QueryString.replace("?id=","")
// hack:remove ?KEY to get val 
		data={method: "delete"
} 
fetch("http://localhost:8080/Book_Review_System/api/delete/"+IDVal, data)
.then(function(response) {
location.href="index.jsp"
})
} </script> </head> <body>
<h1> Delete 1 Client</h1> </body> </html>