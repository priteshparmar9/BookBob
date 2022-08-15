<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="java.io.*,javax.servlet.*,org.hibernate.*, Entity_classes.*, Dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BookBob | show</title>

	<!-- Google Fonts -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
 	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 	<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500&display=swap" rel="stylesheet">

	<!-- Bootstrap Icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  	
 	<!-- Tailwind CSS Build -->
 	<script src="https://cdn.tailwindcss.com"></script>
	<style>*{font-family: 'Fredoka', cursive;}</style>
</head>
<body class="bg-gradient-to-r from-slate-900 to-gray-900 text-white/75">
	
	<%
		if(session.getAttribute("email") == null){
			response.sendRedirect("login.jsp");
		}
		//String type = (String) session.getAttribute("type");
		
		Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session ses = sf.openSession();
		
		ses.getTransaction().begin();	
		Query query = ses.createQuery("from cart WHERE email = :email");
		query.setParameter("email",session.getAttribute("email"));
		List<cart> results = query.list();
	
	%>
	
	<%
		if(session.getAttribute("email").equals("priteshparmar19273@gmail.com")){}
	%>
	
<header class="fixed w-full bg-[#0e263d] z-50 drop-shdaow-lg flex justify-between px-4 text-sky-500">
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
	
	<!-- NavBar -->
	<nav class="flex justify-between items-center gap-2">
  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_article">Articles</a>
  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_magazine">Magazines</a>
  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_novel">Novels</a>
  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-white/75 text-white/75 bg-sky-500" href="cart">
			Cart <span class="bg-sky-800 text-sm rounded-full font-normal p-1 px-2 text-white"><%
			Configuration con1 = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
			SessionFactory sf1 = con1.buildSessionFactory();

			Session ses1 = sf1.openSession();

			ses1.getTransaction().begin();
			Query query1 = ses1.createQuery("from cart WHERE email = :email");
			query1.setParameter("email", session.getAttribute("email"));
			List<cart> results1 = query1.list();
			out.print(results1.size());
			%></span>
		</a>
  	
  	<span class="text-2xl bg-sky-400/20 m-2 p-[.5px] h-1/2 rounded-full"></span>
  	
  	<% if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) { %>
			<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75 flex justify-center items-center gap-1" href="admin_page" aria-label="Admin Panel" title="Admin Panel">
			<span class="text-lg bi bi-person-workspace"></span></a>
		<% } %>
  	
  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75 flex justify-center items-center gap-1" href="edit" aria-label="Edit profile" title="Go to profile">
  	<span class="text-lg bi bi-person-fill"></span></a>
  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-red-500 hover:text-red-500 active:bg-red-500 active:text-white/75 flex justify-center items-center gap-1" href="logout" aria-label="Logout" title="logout">
  	<span class="text-lg bi bi-box-arrow-right"></span></a>
  </nav>
	
</header>

<main class="pt-24 p-4">
	<h1 class="text-sky-500 text-2xl font-medium my-4">My Cart</h1>
	
	<div class="flex flex-col gap-3 justify-between">
		
		<%
		int grand_total = 0;
		for(cart b: results){
			con = new Configuration().configure("/Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.book.class);
			sf = con.buildSessionFactory();
			
			ses = sf.openSession();
			Object temp1 = ses.get(Entity_classes.book.class, b.getTitle());
			book temp2 = (book)temp1;
			if( temp2 != null){
			grand_total += b.getQuantity() * b.getAmount();		
		%>
		
		<div class="flex items-center gap-3 border border-gray-700 rounded-xl bg-gray-800/[0.9] hover:bg-gray-700 p-3">
			<img class="w-[150px] h-[200px] rounded-xl" src="<%=temp2.getUrl() %>" alt="<%= b.getTitle() %>" width=200 height=300 />
			<div class="grow">
				<h2 class="text-3xl"><%= b.getTitle() %></h2>
				<div>Quantity: <b><%= b.getQuantity() %></b></div>
				<div>Total Price: <b>&#8377;<%= b.getQuantity() * b.getAmount() %></b></div>
			</div>
			<div class="px-4">
				<a class="p-3 border border-4 text-red-500 border-red-500 bg-transparent hover:bg-red-500 hover:text-white text-lg rounded-lg bi bi-trash-fill" 
				href="deletep?id=<%= b.getId()%>">&nbsp;Delete</a>
			</div>
		</div>
		
		<%
			}}
		%>
		
	</div>
	
	<div class="my-20 flex gap-3 justify-end items-center">
		<h3 class="text-xl mx-6">Grand Total: <b>&#8377;<%=grand_total%></b></h3>
		<a class="text-2xl p-3 px-6 bg-sky-500 border-2 border-sky-500 rounded-lg text-white/75 hover:bg-transparent flex justify-center items-center bi bi-bag-fill" 
		href="checkout">&nbsp;Checkout</a>
	</div>
	
</main>
</body>
</html>