<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>BookBob | Login to your account</title>

  	<!-- Google Fonts -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
  	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  	<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500&display=swap" rel="stylesheet">

	<!-- Bootstrap Icons -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  	
  	<!-- Tailwind CSS Build -->
  	<!--<link rel="stylesheet" href="build.css">-->
  	<script src="https://cdn.tailwindcss.com"></script>
  	
  	<style>*{font-family: 'Fredoka', cursive;}</style>
</head>
<body class="lg:h-screen grid lg:grid-cols-2 grid-rows-2 lg:grid-rows-1 align-items-center content-center">

<%
	
	if (session.getAttribute("email") == null) {
		if (session.getAttribute("error") != null) {
			
%>
	<script>
		window.onload = () => {
			const error = <%=session.getAttribute("error")%>
			
			// Display email error
			if (error.hasOwnProperty("emailError"))
				document.getElementById("emailError").classList.remove("hidden")
				
			// DIsplay password error
			if (error.hasOwnProperty("pwdError"))
				document.getElementById("pwdError").classList.remove("hidden")
		}
	</script>
<%
		}
		session.setAttribute("error", null);
%>
	
	<header class="bg-sky-500 flex flex-col justify-around items-center">
	
	<!-- Logo -->
	<div class="flex justify-center items-center pointer-events-none select-none">
	  <div class="h-20 flex flex-col justify-center items-center border-black pb-1.5 rounded-full">
	  	<span class="text-6xl -my-3 bi bi-sunglasses"></span>
	    <span class="text-7xl bi bi-bookmark-dash-fill"></span>
	  </div>
	  <h1 class="text-5xl font-medium ml-3">BookBob</h1>
	</div>

	<!-- Scroll down indication for mobile devices -->
  <span class="block lg:hidden text-5xl bi bi-arrow-down-circle-fill"></span>
</header>

<main class="bg-[#10273b] flex flex-col items-center justify-center">
  
  <h2 class="text-white/75 text-center my-10">
    <span class="text-2xl">Login to your</span><br>
    <span class="text-3xl font-medium">BookBob</span> <span class="text-2xl">account</span>
  </h2>
  
  <form class="w-full text-black p-8 lg:px-28 flex flex-col" action="validateLogin" method="POST">
    <div class="flex flex-col gap-10">
      
      <!-- EMAIL FIELD -->
      <div class="relative">
        <label class="absolute bg-[#10273b] text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="email">Email</label>
        <!-- EMAIL INPUT BOX -->
      	<input class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
      	type="email" name="email" id="email" placeholder="Enter email?" required>
      	<p id="emailError" class="hidden text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Email not recognized!</p>
    	</div>

			<!-- PASSWORD FIELD -->
	    <div class="relative">
	      <label class="absolute bg-[#10273b] text-white/75 -mt-3 mx-3 px-1.5 font-medium" for="password">Password</label>
      	<!-- PASSWORD INPUT BOX -->
        <input class="w-full p-3 text-xl text-white/75 font-medium rounded-lg bg-transparent border-2 border-white/75 focus:border-sky-500 outline-none placeholder:text-white/25 placeholder:font-normal placeholder:italic"
        type="password" name="password" id="password" placeholder="Enter password?" required>
        <p id="pwdError" class="hidden text-right font-medium mr-4 p-1 bi bi-exclamation-triangle-fill">&nbsp;Invalid password!</p>
	    </div>
	    
	  </div>
    
    <div class="my-12 flex justify-between items-center">
      <a href="signup" class="p-2 text-white/75 font-medium hover:underline" type="submit">Create new account</a>
      
      <button type="submit" class="text-2xl p-3 px-6 bg-sky-500 border-2 border-sky-500 rounded-lg text-white/75 hover:bg-transparent flex justify-center items-center bi bi-arrow-right" aria-label="Login">
        <span class="ml-2 leading-none font-medium">Login</span>
      </button>
    </div>
    
  </form>
</main>
	
<!-- <section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<form action="validateLogin" method="post">
								<div class="mb-md-5 mt-md-4 pb-5">

									<h2 class="fw-bold mb-2 text-uppercase">Login</h2>
									<p class="text-white-50 mb-5">Please enter your email and
										password!</p>
									<div class="form-outline form-white mb-4">
										<input type="email" id="typeEmailX"
											class="form-control form-control-lg" name="email" /> <label
											class="form-label" for="typeEmailX">Email</label>
									</div>

									<div class="form-outline form-white mb-4">
										<input type="password" id="typePasswordX"
											class="form-control form-control-lg" name="password"/> <label
											class="form-label" for="typePasswordX">Password</label>
									</div>
							<p class="small mb-5 pb-lg-2">
								<a class="text-white-50" href="#!">Forgot password?</a>
							</p>

							<button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
							</form>

						</div>
						<div>
							<p class="mb-0">
								Don't have an account? <a href="signup"
									class="text-white-50 fw-bold">Sign Up</a>
							</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>	-->
	
<%
	} else {
		//response.sendRedirect("index");
%>
	<jsp:forward page="/index"></jsp:forward>
<%
}
%>
</body>
</html>


