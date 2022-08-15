<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*,org.hibernate.*,Entity_classes.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BookBob | Profile</title>

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
		else{
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
	  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="cart">Cart (0)</a>
	  	
	  	<span class="text-2xl bg-sky-400/20 m-2 p-[.5px] h-1/2 rounded-full"></span>
	  	
	  	<% if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) { %>
				<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full flex justify-center items-center gap-1 hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="admin_page" aria-label="Admin Panel" title="Admin Panel">
				<span class="text-lg bi bi-person-workspace"></span></a>
			<% } %>
	  	
	  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-white/75 text-white/75 bg-sky-500 flex justify-center items-center gap-1" href="edit" aria-label="Edit profile" title="Go to profile">
	  	<span class="text-lg bi bi-person-fill"></span></a>
	  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-red-500 hover:text-red-500 active:bg-red-500 active:text-white/75 flex justify-center items-center gap-1" href="logout" aria-label="Logout" title="logout">
	  	<span class="text-lg bi bi-box-arrow-right"></span></a>
	  </nav>
		
	</header>
	
	<main class="lg:h-screen pt-24">
		<h1 class="text-3xl text-center font-medium py-12">Update Profile Information</h1>
		<form class="p-8 text-black flex flex-col items-center" action="edit_profile" method="POST">
			<div class="lg:w-1/2 flex flex-col gap-10">
				<!-- UPDATE USERNAME FIELD -->
				<div class="relative">
					<label class="absolute bg-slate-900 text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="username">Change username</label>
					<input class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
					type="text" name="name" id="username" value="<%=(String)(session.getAttribute("name")) %>" placeholder="Enter new username" required>
					<p class="hidden text-right text-red-500 font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Username already taken!</p>
				</div>
				
				<!-- UPDATE CONTACT FIELD -->
				<div class="relative">
					<label class="absolute bg-slate-900 text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="edit_number">Change contact number</label>
					<input class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
					type="tel" pattern="[0-9]{10}" max="9999999999" min="1000000000" name="number" id="edit_number"  value=<%=session.getAttribute("number") %> placeholder="0123456789" minlength="10" required>
					<p class="hidden text-right text-red-500 font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Contact number invalid!</p>
				</div>
				
				<!-- UPDATE PASSWORD FIELD -->
				<div class="relative">
					<label class="absolute bg-slate-900 text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="edit_password">Change password</label>
					<input class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
					type="password" value=<%=session.getAttribute("password") %> name="password" id="edit_password" placeholder="Change password" required>
					<p class="hidden text-right text-red-500 font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Some password error!</p>
				</div>
					
				<button class="text-2xl p-3 px-6 border-2 border-sky-500 rounded-lg text-white/75 hover:bg-sky-500" type="submit" aria-label="Update profile">
					<span class="leading-none font-medium">Update Profile</span>
				</button>
			</div>
		</form>
	</main>
		<!--/*<h1>Edit Profile</h1>
		<form action="edit_profile" method="post">
			Name: <input type="text" name="name" value=<%= (String)(session.getAttribute("name")) %>>
			Password: <input type="password" name="edit_password" value=<%=session.getAttribute("password") %>>
			Number: <input type="number" max="9999999999" min="1000000000" name="edit_number" value=<%=session.getAttribute("number") %>>
			<input type="submit">
 		</form>*/-->
	<%
		}
	
	%>
<!-- Footer -->
<footer class="bg-sky-500/10 text-sky-500 p-2 flex justify-end items-center gap-2">
	<span>Developed by</span>
	<ul class="font-medium flex justify-center items-center gap-2">
		<li>One</li>
		<li>Two</li>
		<li>Three</li>
		<li>Four</li>
	</ul>
</footer>
</body>
</html>