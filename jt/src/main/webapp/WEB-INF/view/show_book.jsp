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
if (session.getAttribute("email") == null) {
	response.sendRedirect("login.jsp");
}
//String type = (String) session.getAttribute("type");

Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.book.class);
SessionFactory sf = con.buildSessionFactory();

Session ses = sf.openSession();

ses.getTransaction().begin();
Query query = ses.createQuery("from book WHERE type = :type");
query.setParameter("type", session.getAttribute("type"));
List<book> results = query.list();
%>

<%
if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) {}
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

	<%!String navLinkStyleArticle, navLinkStyleMagazine, navLinkStyleNovel;%>
	<%
		navLinkStyleArticle = session.getAttribute("type") == "article"
		? "p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-white/75 text-white/75 bg-sky-500"
		: "p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75";
	
		navLinkStyleMagazine= session.getAttribute("type") == "magazine"
		? "p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-white/75 text-white/75 bg-sky-500"
		: "p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75";
		
		navLinkStyleNovel = session.getAttribute("type") == "novel"
		? "p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-white/75 text-white/75 bg-sky-500"
		: "p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75";
	%>

	<!-- NavBar -->
	<nav class="flex justify-between items-center gap-2">
		
		<a class="<%=navLinkStyleArticle%>" href="show_article">Articles</a>
		<a class="<%=navLinkStyleMagazine%>" href="show_magazine">Magazines</a>
		<a class="<%=navLinkStyleNovel%>" href="show_novel">Novels</a>
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="show_cart">
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
		<a class="p-1 px-4 font-medium border-2 border-transparent rounded-full hover:border-sky-500 active:bg-sky-500 active:text-white/75" href="contactus">Contact Us</a>
		
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

<main class="pt-24 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 p-3">
	<% for(book b: results) { %>
		<div class="card group overflow-hidden border border-gray-700 rounded-xl" style="background:url(<%=b.getUrl()%>) center center;background-size:cover;">
			<div class="bg-gray-800/[0.9] backdrop-blur-sm flex flex-col justify-between items-center">
				<img class="w-full h-[500px] rounded-xl transition scale-95 group-hover:scale-100" src="<%=b.getUrl()%>" width=300 height=500 alt="<%= b.getTitle() %> book cover image" />
				<div class="p-2 w-full flex flex-col justify-between">
					<div>
						<h2 class="contentTitle text-ellipsis whitespace-nowrap overflow-hidden text-3xl font-medium tracking-wide cursor-pointer hover:underline" 
						title="<%= b.getTitle() %>" data-modal="<%=b.getTitle()%>">
							<%= b.getTitle() %>
						</h2>
						<h3 class="hover:underline">
						<span><%= b.getAuthname() %></span></h3>
					</div>
					
					<div class="flex justify-between items-center mt-2">
						<span class="text-2xl font-medium text-right">&#8377;<%= b.getPrice() %></span>
						
						<form action="cartp">
						<div class="flex gap-2 h-12">
							<% if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) { %>
							<a href="editp?title=<%=b.getTitle()%>" class="text-lg p-2 px-3 rounded-lg bi bi-pencil-square hover:bg-sky-500" aria-label="Edit"></a>
								<a href="delete?value=<%=b.getTitle() %>" class="text-lg p-2 px-3 rounded-lg bi bi-trash hover:bg-sky-500" aria-label="Delete"></a>
							<% } %>
							<input type="hidden" name="title" value="<%=b.getTitle()%>" >
							<% String email = (String) session.getAttribute("email"); %>
							<input type="hidden" name="email" value="<%=email%>">
							<input type="hidden" name="amount" value="<%=b.getPrice()%>">
							<input class="w-20 rounded-lg text-white bg-white/20 px-3" type="number" value="1" min=1 name="qty">
							<button class="text-lg p-2 px-3 rounded-lg bg-sky-500 hover:bg-sky-700 bi bi-cart-plus" type="submit" title="Add to cart" aria-label="Add to cart"></button>
							<% if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) {	%>
								<!--<a href="editp?"></a>-->
							<% } %>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="<%=b.getTitle()%>" class="modal p-4 z-50 absolute top-[80px] left-0 hidden bg-gray-800/75 backdrop-blur-lg w-full min-h-full" data-modal="<%=b.getTitle()%>">
			<div class="w-full flex justify-between items-center mb-6">
				<div>
					<h1 class="text-2xl font-medium"><%= b.getTitle() %></h1>
					<h2 class="text-lg">by <%= b.getAuthname() %></h2>
				</div>
				<button class="closeModalButton text-4xl p-4 bi bi-x-lg" data-modal="<%=b.getTitle()%>"></button>
			</div>
			<div class="p-6 border border-2 border-white/75 rounded-lg text-xl">
				<%= b.getContent() %>
			</div>
		</div>

		<%
			if (session.getAttribute("email").equals("priteshparmar19273@gmail.com")) {}
		%>
	<% } %>
	
	<!--<div id="modal" class="absolute top-[80px] left-0 hidden bg-gray-800/75 backdrop-blur-lg w-full h-full">
		<div class="w-full flex justify-end items-center">
			<button class="text-4xl p-4 bi bi-x-lg" onclick="document.getElementById('modal').classList.add('hidden')"></button>
		</div>		
	</div>-->
</main>

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
	
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(() => {
		$(".contentTitle").click(function() {
			$('.modal[data-modal="'+$(this).data("modal")+'"]').removeClass("hidden");
			//console.log($(this).text().replace(" ", '').length)
			//$(this).parents().find(".card + .modal").removeClass("hidden")
		})
		
		$(".closeModalButton").click(function() {
			$('.modal[data-modal="'+$(this).data("modal")+'"]').addClass("hidden");
		})
	})
	
	// not working
	/*document.getElementById("modal").addEventListener("keyup", (event) => {
		console.log(event.key)
	})*/
</script>

</body>
</html>