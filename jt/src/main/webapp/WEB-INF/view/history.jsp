<%@page import="Entity_classes.history"%>
<%@page import="Entity_classes.cart"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		if(!session.getAttribute("email").equals("priteshparmar19273@gmail.com")){
			response.sendRedirect("index");
		}
	%>
	<table border="1">
		<tr>
			<th>Email</th>
			<th>Bill Id</th>
			<th>Title</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Date</th>
		</tr>
		<%
		
		Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.history.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session ses = sf.openSession();
		
		ses.getTransaction().begin();	
		Query query = ses.createQuery("from history");
		List<history> results = query.list();
		for(history h:results){
			%>
			<tr>
			<td><%= h.getEmail() %></td>
			<td><%= h.getBill_id() %></td>
			<td><%= h.getTitle() %></td>
			<td><%= h.getQuantity() %></td>
			<td><%= String.format( "%.2f", (double)h.getAmount()) %></td>
			<td><%= h.getDate() %></td>
			</tr>
			<%		
		}
		
		%>
	</table>

</body>
</html>