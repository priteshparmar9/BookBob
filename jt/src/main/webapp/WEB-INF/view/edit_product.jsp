<%@page import="Entity_classes.cart"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="Entity_classes.book"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard | BookBob</title>

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
<body class="relative bg-gradient-to-r from-slate-900 to-gray-900 text-white/75">
<%
	String title = request.getParameter("title");
	Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.book.class);
	SessionFactory sf = con.buildSessionFactory();
	
	Session ses1 = sf.openSession();
	Object b1 = ses1.get(book.class, title);
	book b2 = (book)b1;
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
  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_cart">
		Cart <span class="bg-sky-800 text-sm rounded-full font-normal p-1 px-2 text-white">
		<%
			Configuration con1 = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
			SessionFactory sf1 = con1.buildSessionFactory();

			Session ses2 = sf1.openSession();

			ses2.getTransaction().begin();
			Query query1 = ses2.createQuery("from cart WHERE email = :email");
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

<main class="pt-24">
	<h2 class="text-2xl font-medium p-3 mb-4">Edit <b class="tracking-wide"><%= b2.getTitle() %></b></h2>
	
	<form class="min-h-[35rem] m-2 grid grid-cols-2 gap-3" action="edit_product" method="POST" style="grid-template-columns: 30% auto">
		<div class="flex flex-col gap-10">
			
			<!-- Type -->
			<div class="relative p-1 pt-4 border-2 border-white/75 rounded-lg grid grid-cols-3 gap-1">
				<div class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium">Choose type</div>
				<div>
					<input class="peer hidden" type="radio" id="article" name="type"	value="article" required
						<% if(b2.getType().equals("article")) { %>	checked	<% } %> >
					<label class="peer-checked:bg-sky-500 hover:bg-sky-600/25 p-2 rounded-lg flex justify-center items-center gap-1" for="article">
						<span>Article</span>
					</label>
				</div>
				<div>
					<input class="peer hidden" type="radio" id="magazine" name="type"	value="magazine" required
					<% if(b2.getType().equals("magazine")) { %>	checked	<% } %> >
					<label class="peer-checked:bg-sky-500 hover:bg-sky-600/25 p-2 rounded-lg flex justify-center items-center gap-1" for="magazine">
						<span>Magazine</span>
					</label>
				</div>
				<div>
					<input class="peer hidden" type="radio" id="novel" name="type" value="novel" required
					<% if(b2.getType().equals("novel")) { %>	checked	<% } %> >
					<label class="peer-checked:bg-sky-500 hover:bg-sky-600/25 p-2 rounded-lg flex justify-center items-center gap-1" for="novel">
						<span>Novel</span>
					</label>
				</div>
			</div>
			
			<!-- Title --
			<div class="relative">
				<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="title">Title</label>
				<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
				type="text" name="title" id="title" placeholder="Enter title" required value="<%= b2.getTitle() %>">
			</div>-->
			
			<!-- Author  -->
			<div class="relative">
				<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="title">Author</label>
				<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
				type="text" name="edit_auth" id="authname" placeholder="Enter author's name" required value="<%= b2.getAuthname() %>">
			</div>
			
			<!-- Cover Image
			<div class="relative">
				<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="coverImageURL">Cover image</label>
				<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
				type="url" name="edit_url" id="coverImageURL" placeholder="Enter URL to cover image">
			</div>-->
				
			<!-- Price -->
			<div class="relative">
				<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="price">Price</label>
				<input class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
				type="number" min=0 name="edit_price" id="price" placeholder="Enter price" required value="<%= b2.getPrice() %>">
			</div>
				
			<button class="bg-sky-500 text-2xl font-medium uppercase rounded-lg p-3" type="submit">Save</button>
		</div>
		<input type="hidden" name="title" value="<%= b2.getTitle()%>">
		<!-- Content -->
		<div class="w-full relative h-full">
			<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="content">Content</label>
			<textarea class="w-full min-h-[100%] p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
			name="edit_content" id="content" placeholder="Create content here..." required value="<%= b2.getContent() %>"><%= b2.getContent() %></textarea>
		</div>
			
	</form>
</main>

</body>
</html>