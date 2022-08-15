<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,javax.servlet.*,org.hibernate.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("email") == null) {
		response.sendRedirect("login.jsp");
	}

	else if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) {
		if (session.getAttribute("error") != null) {
	%>
	<script>
					alert('<%=session.getAttribute("error")%>
		');
	</script>
	<%
	}
	session.setAttribute("error", null);
	%>
	<!-- <button> Novel </button>
<button> Magazine </button>
<button> Article </button> -->

	<form action="validateBook" method="post">
		<label>Add title</label> <input type="text" name="title" required />
		<br> <br> <label>Content</label>
		<textarea rows="4" cols="50" name="content">
Enter your text here...</textarea>
		<br> <br> <label>Author name</label> <input type="text"
			name="authname" required /> <br><input type="radio" id="magazine" name="type"
			value="magazine"> magazine<br> <input
			type="radio" id="novel" name="type" value="novel">
			novel<br> <input type="radio" id="article"
			name="type" value="article"> <label>article</label>
		<br>
		Price: 
		<input type="number" min=1 name="price" required /> <br> <input
			type="submit" />
	</form>
	<%
	} else {
	out.print("You are not allowed to visit this site!! stay away!!");
	}
	%>

</body>
</html>