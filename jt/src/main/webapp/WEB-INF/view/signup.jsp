<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookBob | Create new account</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500&display=swap" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- Tailwind CSS Build -->
<script src="https://cdn.tailwindcss.com"></script>
<style>
* {
	font-family: 'Fredoka', cursive;
}
</style>
</head>
<body class="lg:h-screen lg:overflow-hidden bg-[#ff6138] grid lg:grid-cols-2 grid-rows-2 lg:grid-rows-1 align-items-center content-center">
<%
if (session.getAttribute("error") != null) {
%>
	<script> alert('<%=session.getAttribute("error")%>'); </script>
<%
}
session.setAttribute("error", null);
%>

<header class="bg-sky-500 flex flex-col justify-around items-center">

	<!-- Logo -->
	<div
		class="text-black flex justify-center items-center pointer-events-none select-none">
		<div
			class="h-20 flex flex-col justify-center items-center border-black pb-1.5 rounded-full">
			<span class="text-6xl -my-3 bi bi-sunglasses"></span> <span
				class="text-7xl bi bi-bookmark-dash-fill"></span>
		</div>
		<h1 class="text-5xl font-medium ml-3">BookBob</h1>
	</div>

	<!-- Scroll down indication for mobile devices -->
	<span class="block lg:hidden text-5xl bi bi-arrow-down-circle-fill"></span>
</header>

	<main class="lg:overflow-y-scroll bg-[#10273b] flex flex-col">

		<h2 class="text-white text-center my-10">
			<span class="text-2xl">Create your</span><br> <span
				class="text-3xl font-medium">BookBob</span> <span class="text-2xl">account</span>
		</h2>

		<form class="p-8 lg:px-28 w-full text-black flex flex-col"
			action="validateSignup" method="POST">
			<div class="flex flex-col gap-10">

				<!-- contact-no/country-code group -->
				<!--<div class="flex gap-3">-->

				<!-- country code area - start -->
				<!-- <div class="relative">
						<label class="absolute bg-[#ff6138] -mt-3 mx-3 px-1.5 font-medium" for="contact">Country Code</label>
						<input class="w-44 p-3 text-xl font-medium rounded-lg bg-transparent border-2 border-black focus:border-red-700 outline-none placeholder:text-black/40 placeholder:font-normal placeholder:italic" list="country-code-list" name="country-code" placeholder="+00" required>
						<datalist id="country-code-list">
							<option value="+91 (India)"></option>
						</datalist> -->

				<!-- <p class="text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Contact number invalid!</p> -->
				<!-- </div> -->
				<!-- country code area - end -->

				<!-- CONTACT FIELD -->
				<div class="relative w-full">
					<label class="absolute bg-[#10273b] text-white/75 -mt-3 mx-3 px-1.5 font-medium"
						for="number">Contact Number</label>

					<!-- contact number input box -->
					<input
						class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
						type="tel" pattern="[0-9]{10}" max="9999999999" min="1000000000"
						name="number" id="number" placeholder="0123456789" minlength="10"
						required>

					<p class="hidden text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Contact number invalid!</p>
				</div>

				<!--</div>-->

				<!-- USERNAME FIELD -->
				<div class="relative">
					<label class="absolute bg-[#10273b] text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="username">Username</label>
					<!-- USERNAME INPUT BOX -->
					<input
						class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
						type="text" name="username" id="username"
						placeholder="Enter username" required>
					
					<p class="hidden text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">
						&nbsp;Username already taken!
					</p>
				</div>

				<!-- EMAIL FIELD -->
				<div class="relative">
					<label class="absolute bg-[#10273b] text-white/75 -mt-3 mx-3 px-1.5 font-medium"
						for="email">Email</label>

					<!-- EMAIL INPUT BOX -->
					<input
						class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
						type="email" name="email" id="email"
						placeholder="Enter email address" required>

					<p class="hidden text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">
						&nbsp;Email invalid!
					</p>
				</div>

				<!-- PASSWORD FIELD -->
				<div class="relative">
					<label class="absolute bg-[#10273b] text-white/75 -mt-3 mx-3 px-1.5 font-medium"
						for="password">Password</label>

					<!-- PASSWORD INPUT BOX -->
					<input
						class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
						type="text" name="password" id="password" placeholder="Enter password"
						required>

					<p class="hidden text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">
						&nbsp;Some password error!
					</p>
				</div>

				<!-- confirm password area - start -->
				<!-- <div class="relative">
					<label class="absolute bg-[#10273b] text-white/75 -mt-3 mx-3 px-1.5 font-medium"
						for="cfm-pwd">Confirm Password</label>-->

					<!-- PASSWORD INPUT BOX -->
					<!--<input
						class="w-full p-3 text-xl font-medium rounded-lg bg-transparent border-2 border-black focus:border-red-700 outline-none placeholder:text-black/40 placeholder:font-normal placeholder:italic"
						type="text" name="cfm-pwd" id="cfm-pwd"
						placeholder="Retype password" required>

					<p
						class="hidden text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Passwords
						do not match!</p>
				</div>-->
				<!-- confirm password area - end -->

			</div>

			
			<div class="my-12 flex justify-between items-center">
	      <a href="login" class="p-2 text-white/75 font-medium hover:underline">Already have an account?</a>
	      
	      <button type="submit" class="text-2xl p-3 px-6 bg-sky-500 border-2 border-sky-500 rounded-lg text-white/75 hover:bg-transparent flex justify-center items-center bi bi-arrow-right"
	      aria-label="Proceed to signup">
	        <span class="ml-2 leading-none font-medium">Sign up</span>
	      </button>
    	</div>

		</form>
	</main>

	<!--
	<form action="validateSignup" method = "post">
		<lable>Contact Number</lable>
		<input type="number" max="9999999999" min="1000000000" name="number"/><br>
		<lable>Username</lable>
		<input type="text" name="username" required/>
		<br>
		<label>Password</label>
		<input type="password" name="password"/>
		<br>
		<label>Email</label>
		<input type="email" name="email" />
		<br>
		<input type="submit"/>
	</form>-->
</body>
</html>