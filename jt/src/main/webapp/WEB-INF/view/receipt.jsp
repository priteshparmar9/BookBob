<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entity_classes.history"%>
<%@page import="Entity_classes.cart"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout your Cart | BookBob</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500&display=swap"
	rel="stylesheet">

<!-- Bootstrap Icons -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<!-- Tailwind CSS Build -->
<script src="https://cdn.tailwindcss.com"></script>
<style>
* {
	font-family: 'Fredoka', cursive;
}
</style>
</head>
<body class="lg:screen grid place-items-center bg-gradient-to-r from-slate-900 to-gray-900 text-white/75">

<main class="flex flex-col justify-center items-center gap-2 my-8">
	<!-- Logo -->
	<a href="/jt">
		<div class="text-sky-500/75 flex justify-center items-center pointer-events-none select-none">
		  <div class="h-20 flex flex-col justify-center items-center border-black rounded-full">
		  	<span class="text-3xl -my-3 bi bi-sunglasses"></span>
		    <span class="text-4xl bi bi-bookmark-dash-fill"></span>
		  </div>
		  <h1 class="text-2xl font-medium ml-1">BookBob</h1>
		</div>
	</a>
	
	<section class="">
		<div class="w-[34rem] rounded-lg bg-gray-800 flex flex-col justify-center items-center p-6 mb-4">
			<h1 class="text-2xl mb-4">Order Receipt</h1>
			<%
		int amount = 0;
		Random rand = new Random();
		int id = rand.nextInt();
		if(id < 0){
			id *= -1;
		}
		java.util.Date date1 = new java.util.Date();
		Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session ses = sf.openSession();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
		String date = dateFormat.format(date1);  
		
		ses.getTransaction().begin();	
		Query query = ses.createQuery("from cart WHERE email = :email");
		query.setParameter("email",session.getAttribute("email"));
		List<cart> results = query.list();
	%>
	<table class="w-full">
		<tr>
			<td colspan="2">Order ID: <%= id %></td>
			<td colspan="2">Date: <%= date %></td>
		</tr>
		<tr class="border-b border-b-2 border-gray-500">
			<td colspan="4">Email: <%= session.getAttribute("email") %></td>
		</tr>
		<tr>
			<th class="p-2 pr-0">Title</th>
			<th class="p-2 pr-0">Quantity</th>
			<th class="p-2 pr-0">Price</th>
			<th class="p-2 pr-0">Total</th>
		</tr>
		<%
		for(cart b: results){
			amount += b.getAmount()*b.getQuantity();
			%>
			<tr class="text-right border-b border-b-2 border-gray-500">
				<td class="p-1 pr-0"><%= b.getTitle()%></td>
				<td class="p-1 pr-0"><%= b.getQuantity()%></td>
				<td class="p-1 pr-0">Rs. <%= b.getAmount()%></td>
				<td class="p-1 pr-0">Rs. <%= b.getAmount()*b.getQuantity()%></td>
			</tr>
			<%
			
		}
		%>
		<tr>
			<td class="p-1 pr-0" colspan=2>Grand Total</td>
			<td class="p-1 pr-0" colspan=2>Rs. <%= String.format( "%.2f", (double)amount) %></td>
		</tr>
		<tr>
			<td class="p-1 pr-0" colspan=2>Tax Rate</td>
			<td class="p-1 pr-0" colspan=2>12%</td>
		</tr>
		<tr>
			<td class="p-1 pr-0" colspan=2>Total Tax</td>
			<td class="p-1 pr-0" colspan=2>Rs. <%= String.format( "%.2f", amount*0.12) %></td>
		</tr>
		<tr>
			<td class="p-1 pr-0" colspan=2>Amount to be paid</td>
			<td class="p-1 pr-0" colspan=2>Rs. <%= String.format( "%.2f", amount*1.12) %></td>
		</tr>
		<tr>
			<td class="p-1 pr-0" colspan=2>Address</td>
			<td class="p-1 pr-0" colspan=2><%= session.getAttribute("address") %></td>
		</tr>
	</table>
		</div>
	</section>
</main>

	<a href="conf_purchase?id=<%= id%>&date=<%= date%>"
	class="text-lg p-3 px-6 bg-sky-500 border-2 border-sky-500 rounded-lg text-white/75 hover:bg-transparent flex justify-center items-center ">
		Confirm Purchase
	</a>
	<!-- <a href="#">Download Receipt</a> -->
</body>
</html>