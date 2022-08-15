<%@page import="Entity_classes.cart"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,javax.servlet.*,org.hibernate.*,Entity_classes.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BookBob | Admin Panel</title>

	<!-- Google Fonts -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
 	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 	<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500&display=swap" rel="stylesheet">

	<!-- Bootstrap Icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  	
 	<!-- Tailwind CSS Build -->
 	<script src="https://cdn.tailwindcss.com"></script>
	<style>
		*{font-family: 'Fredoka', cursive;}
	</style>
</head>
<body class="bg-gradient-to-r from-slate-900 to-gray-900 text-white/75">

<%
	if(session.getAttribute("email") == null){
		response.sendRedirect("login.jsp");
	}
	else if(session.getAttribute("email").equals("priteshparmar19273@gmail.com")){
		if(session.getAttribute("error") != null){
%>
	<script>
		alert('<%=session.getAttribute("error")%>');
	</script>
<% } session.setAttribute("error", null); %>
	
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
  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_cart">
		Cart <span class="bg-sky-800 text-sm rounded-full font-normal p-1 px-2 text-white">
		<%
			Configuration con1 = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
			SessionFactory sf1 = con1.buildSessionFactory();

			Session ses1 = sf1.openSession();

			ses1.getTransaction().begin();
			Query query1 = ses1.createQuery("from cart WHERE email = :email");
			query1.setParameter("email", session.getAttribute("email"));
			List<cart> results1 = query1.list();
			out.print(results1.size());
			%>
			</span>
		</a>
  	
  	<span class="text-2xl bg-sky-400/20 m-2 p-[.5px] h-1/2 rounded-full"></span>
  	
  	<% if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) { %>
			<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-white/75 text-white/75 bg-sky-500 flex justify-center items-center gap-1" href="admin_page" aria-label="Admin Panel" title="Admin Panel">
			<span class="text-lg bi bi-person-workspace"></span></a>
		<% } %>
  	
  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75 flex justify-center items-center gap-1" href="edit" aria-label="Edit profile" title="Go to profile">
  	<span class="text-lg bi bi-person-fill"></span></a>
  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-red-500 hover:text-red-500 active:bg-red-500 active:text-white/75 flex justify-center items-center gap-1" href="logout" aria-label="Logout" title="logout">
  	<span class="text-lg bi bi-box-arrow-right"></span></a>
  </nav>
	
</header>
	
		<!--<a href="add_content">Add default books</a>-->
		<!--<a href="addBook">Add books</a>-->
				
	<main class="pt-24">
		<h2 class="text-2xl font-medium p-3 mb-4">Create new content</h2>
		<form class="min-h-[35rem] m-2 grid grid-cols-2 gap-3" style="grid-template-columns: 30% auto" action="validateBook" method="POST">
			<div class="flex flex-col gap-10">

				<!-- Type -->
				<div class="relative p-1 pt-4 border-2 border-white/75 rounded-lg grid grid-cols-3 gap-1">
					<div class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium">Choose type</div>
					<div>
						<input class="peer hidden" type="radio" id="article" name="type"	value="article" required>
						<label class="peer-checked:bg-sky-500 hover:bg-sky-600/25 p-2 rounded-lg flex justify-center items-center gap-1" for="article">
							<span>Article</span>
						</label>
					</div>
					<div>
						<input class="peer hidden" type="radio" id="magazine" name="type"	value="magazine" required>
						<label class="peer-checked:bg-sky-500 hover:bg-sky-600/25 p-2 rounded-lg flex justify-center items-center gap-1" for="magazine">
							<span>Magazine</span>
						</label>
					</div>
					<div>
						<input class="peer hidden" type="radio" id="novel" name="type" value="novel" required>
						<label class="peer-checked:bg-sky-500 hover:bg-sky-600/25 p-2 rounded-lg flex justify-center items-center gap-1" for="novel">
							<span>Novel</span>
						</label>
					</div>
				</div>
			
				<!-- Title -->
				<div class="relative">
					<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="title">Title</label>
					<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
					type="text" name="title" id="title" placeholder="Enter title" required>
				</div>
				
				<!-- Author  -->
				<div class="relative">
					<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="title">Author</label>
					<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
					type="text" name="authname" id="authname" placeholder="Enter author's name" required>
				</div>
				
				<!-- Cover Image -->
				<div class="relative">
					<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="coverImageURL">Cover image</label>
					<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
					type="url" name="url" id="coverImageURL" placeholder="Enter URL to cover image">
				</div>
				
				<!-- Price -->
				<div class="relative">
					<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="price">Price</label>
					<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
					type="number" min=0 name="price" id="price" placeholder="Enter price" required>
				</div>
				
				<button class="bg-sky-500 text-2xl font-medium uppercase rounded-lg p-3" type="submit">Publish</button>
				
			</div>
			
			<!-- Content -->
			<div class="w-full relative h-full">
				<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="content">Content</label>
				<textarea class="w-full min-h-[100%] p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
				name="content" id="content" placeholder="Create content here..." required></textarea>
			</div>
		
			<!--<label>Add title</label> <input type="text" name="title" required />
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
				type="submit" />-->
		</form>
	</main>
				
	<%
		}
		else{
			out.print("You are not allowed to visit this page!! stay away!!");
		}
	
	%>
	
	<%! String[] names = {"Pritesh Parmar", "Parshwa Mehta", "Deepak Parmar", "Nillkanth Patel"}, images = {"1", "2", "https://avatars.githubusercontent.com/u/25756259?v=4", "4"}; %>
	
	<!-- FOOTER -->
	<footer class="bg-sky-500/10 text-sky-500 p-2 flex justify-end items-center gap-2">
		<span>Developed by students at Dharmsinh Desai University:</span>
		<ul class="font-medium flex justify-center items-center gap-2">
		<% for(int i = 0; i < names.length; i++) { %>
			<li class="px-2 flex justify-center items-center gap-1">
				<!-- use img instead of span below -->
				<img src="<%= images[i] %>" class="block h-[30px] w-[30px] text-xl rounded-full outline outline-1 outline-sky-500">
				<span><%= names[i] %></span>
			</li>
		<% } %>
		</ul>
	</footer>
</body>
</html>