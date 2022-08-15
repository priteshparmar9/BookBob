<%@page import="Entity_classes.cart"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
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
	
	<section>
		<div class="rounded-lg bg-gray-800 flex flex-col justify-center items-center p-6 mb-4">
			<h1 class="text-2xl">Place Order</h1>
			<table class="table-auto m-6">
		  <thead class="text-lg">
		    <tr class="border-b border-gray-500">
		      <th class="p-3 pr-0">Item</th>
		      <th class="p-3 pr-0">Quantity</th>
		      <th class="p-3 pr-0">Price</th>
		      <th class="p-3 pr-0">Total Amount</th>
		    </tr>
		  </thead>
		 	<tbody>
			<%
			Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
			SessionFactory sf = con.buildSessionFactory();
			
			Session ses = sf.openSession();
			
			ses.getTransaction().begin();	
			Query query = ses.createQuery("from cart WHERE email = :email");
			query.setParameter("email",session.getAttribute("email"));
			List<cart> results = query.list();
			int quantity = 0, amount = 0;
			for(cart c: results){
				quantity += c.getQuantity();
				amount += c.getAmount()*c.getQuantity();
				%>
					<tr class="text-right">
						<td class="p-1 pr-0"><%= c.getTitle() %></td>
						<td class="p-1 pr-0"><%= c.getQuantity() %></td>
						<td class="p-1 pr-0">&#8377;<%= c.getAmount() %></td>
						<td class="p-1 pr-0">&#8377;<%= c.getAmount()*c.getQuantity() %></td>
					</tr>
				<%
			}
			%>
		</tbody>
		</table>
		<div class="text-2xl text-sky-500 font-medium flex justify-evenly items-center gap-6">
			<p>Total Quantity: <b class="tracking-wide"><%= quantity %></b></p>
			<p>Grand Total: <b class="tracking-wide">&#8377;<%= amount %></b></p>
		</div>
	</div>
	
	<form action="conf_order" method="POST">
		<div class="w-full relative h-full">
			<label class="absolute bg-slate-900 -mt-3 mx-3 px-1.5 font-medium" for="addr">Delivery Address</label>
			<textarea class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 text-sky-500 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
			name="address" id="addr" placeholder="Type your address..." required></textarea>
		</div>
		
		<div class="flex justify-between items-center m-3">
			<a class="p-2 border border-4 border-sky-500 hover:bg-sky-500 text-white/75 rounded-lg bi bi-cart-fill" href="show_cart">&nbsp;Modify Cart</a>
			<button class="p-2 border-4 border-sky-500 hover:border-white bg-sky-500 text-white/75 rounded-lg bi bi-bag-fill" type="submit">&nbsp;Confirm Order</button>
		</div>
	</form>
	</section>
</main>
	
</body>
</html>