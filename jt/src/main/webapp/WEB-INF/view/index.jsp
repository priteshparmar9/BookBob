<%@ page import="javax.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BookBob | Homepage</title>

	<!-- Google Fonts -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
 	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 	<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500&display=swap" rel="stylesheet">

	<!-- Bootstrap Icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  
  <!-- Redirect to show_book -->
  <script> window.location = "show_article" </script>
 	
 	<!-- Tailwind CSS Build -->
 	<script src="https://cdn.tailwindcss.com"></script>
 	<link href="css/build.css"/>
	<style>*{font-family: 'Fredoka', cursive;}</style>
</head>
<body class="bg-gradient-to-r from-slate-900 to-gray-900 text-white/75">
	
	<%
	if (session.getAttribute("email") == null) {
		response.sendRedirect("login");
		out.print("Redirect to login page");
	} else {
		/*out.print("Continue on this page");*/
	%>
	
	<header class="flex justify-between px-4 bg-sky-500/10 text-sky-500">
		
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
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="contactus">Contact Us</a>
	  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_article">Articles</a>
	  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_magazine">Magazines</a>
	  	<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_novel">Novels</a>
	  	
	  	<span class="text-2xl bg-sky-400/20 m-2 p-[.5px] h-1/2 rounded-full"></span>
	  	
	  	<% if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) { %>
				<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full flex justify-center items-center gap-1 hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="admin_page" aria-label="Admin Panel" title="Admin Panel">
				<span class="text-lg bi bi-person-workspace"></span></a>
			<% } %>
	  	
	  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75 flex justify-center items-center gap-1" href="edit" aria-label="Edit profile" title="Go to profile">
	  	<span class="text-lg bi bi-person-fill"></span></a>
	  	<a class="h-[40px] w-[40px] p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-red-500 hover:text-red-500 active:bg-red-500 active:text-white/75 flex justify-center items-center gap-1" href="logout" aria-label="Logout" title="logout">
	  	<span class="text-lg bi bi-box-arrow-right"></span></a>
	  </nav>
		
	</header>
	
	<!--<br>
	<a href="logout">log out</a>
	<a href="edit">Edit</a>
	<br>
	<a href="show_article"><button>Articles</button></a>
	<br>
	<a href="show_magazine">
		<button>Magazine</button>
	</a>
	<br>
	<a href="show_novel">
		<button>Novels</button>
	</a>-->

	<% } %>
</body>
</html>
