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
	
	<section class="w-96">
		<div class="rounded-lg bg-gray-800 flex flex-col justify-center items-center p-6 mb-4">
			<h1 class="text-2xl mb-4">Make Payment</h1>
			
			<form class="w-full flex flex-col gap-8" action="receipt" method="POST">
				
				<div class="relative">
	        <label class="absolute bg-gray-800 text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="name">Name</label>
	        <input type="text" name="card_name" id="name" placeholder="Name" required
	      	class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic">
	    	</div>
	    	
	    	<div class="relative">
	        <label class="absolute bg-gray-800 text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="number">Card Number</label>
	        <input type="number" name="card_number" id="number"	placeholder="0000-0000-0000-0000" min="1000000000000000"
			max="9999999999999999" required
	      	class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic">
	    	</div>
	    	
	    	<div class="flex justify-between items-center gap-2">
	    		<div class="relative">
		        <label class="absolute bg-gray-800 text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="cvv">CVV</label>
		        <input type="number" name="card_cvv" id="cvv" min="100" placeholder="000" max="999" required
		      	class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic">
		    	</div>
		    	
		    	<div class="relative">
		        <label class="absolute bg-gray-800 text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="card-date">Valid till</label>
		        <input type="date" name="card_date" id="card-date" required
		      	class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic">
		    	</div>
	    	</div>
	    	
	    	<button type="submit" class="text-2xl p-3 px-6 bg-sky-500 border-2 border-sky-500 rounded-lg text-white/75 hover:bg-transparent flex justify-center items-center bi bi-credit-card-fill" aria-label="Login">
        <span class="ml-2 leading-none font-medium">Proceed to Pay</span>
      </button>
	    	
			</form>
		</div>
	</section>
</main>
</body>
</html>