<!DOCTYPE html>
<%@page import="Entity_classes.cart"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<html land="en" dir="ltr">
<head>
    <meta charset="UTF-8">
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
    
    <title>WELCOME TO OUR SHOP</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Berkshire+Swash&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
    <link rel="stylesheet" href="style-contact-us.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Ubuntu:wght@400;500;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;
}
body {
    font-family: "Lato", sans-serif;
}
  
  .sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: black;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 20px;
  }
  
  .sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
  }
  
  .sidenav a:hover {
    color: #f1f1f1;
  }
  
  .sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
  }
  
  @media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
  }
  
  .font
  {
    font-family: 'Berkshire Swash', cursive;
    text-align: center;
    font-size: 60px;
  text-shadow: 5px 5px 10px rgb(231, 111, 111);
  }
  
  .background
  {
    background : url(images/background-contact-us-7.jpeg) no-repeat center;
    background-color: darkblue;
    background-attachment: fixed;
    background-size: cover;
  }
.max-width{
    max-width: 1300px;
    padding: 0 80px;
    margin: auto;
}

/main-content/
.contact{
    padding:50px 100px;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    align-items: center;
    
    /*background-color:rgb(136, 46, 114);
    background: url("images/background-contact-me-3.jpg") no-repeat center;
    background-attachment: fixed;*/
    height : 100vh;
    color: rgb(0, 0, 0);
    min-height: 100%;
    font-family: 'Ubuntu',sans-serif;
    flex-direction: column;
    
}
.contact .content{
    max-width: 1600px;
    text-align: center;
    font-size: 30px;
}
.contact .content h2{
    font-size: 50px;
    font-weight:600;
    color:rgb(0, 0, 0);
}
.contact .content p{
    font-weight: 500;
    font-size:28px;
    color:#020d2c;
}
.contact .box p{
    color:#051c2c;
}
.container{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 30px;
}
.container .contactInfo{
    width: 40%;
    display: flex;
    flex-direction: column;
}
.container .contactInfo .box{
    position: relative;
    padding: 20px 0;
    display: flex;
}
.container .contactInfo .box .icon{
    min-width: 60px;
    height: 60px;
    background: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    font-size: 22px;
}
.container .contactInfo .box .text{
    display: flex;
    margin-left: 20px;
    font-size: 16px;
    color: #fff;
    flex-direction: column;
    font-weight: 600;
}
.container .contactInfo .box .text h3{
    font-weight: 1000;
    font-size: 30px;
    color: #000000;
}
.contactForm{
    width: 40%;
    padding: 40px;
    background-color: rgb(255, 255, 255);
    
}
.contactForm form h2{
    font-size: 30px;
    color: rgb(0, 0, 0);
    font-weight: 600;
}
.contactForm .inputBox{
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: none;
    color:#000;
}
.contactForm .inputBox input,
.contactForm .inputBox textarea{
    width:100%;
    padding: 5px 0;
    font-size: 16px;
    margin: 10px 0;
    /border: none;/
    color:#000;
    border-bottom: 1.5px solid rgb(0, 0, 0);
    border-radius: 5px;
    resize: none;
}
.contactForm .inputBox textarea{
    border: 1.5px solid black;
}
.contactForm .inputBox span{
    position: absolute;
    left: 0;
    padding: 5px 4px;
    font-size: 16px;
    margin: 10px 0;
    pointer-events: none;
    transition: 0.5s;
    color: #666;
}
.contactForm .inputBox input:focus ~ span,
.contactForm .inputBox input:valid ~ span,
.contactForm .inputBox textarea:focus ~ span,
.contactForm .inputBox textarea:valid ~ span{
    color: #e91e63;
    font-size: 14px;
    transform: translateY(-25px);
}
.contactForm .inputBox input[type="submit"]{
    width: 100px;
    background: #1a1e20;
    color: #fff;
    border: 1px solid black;
    cursor: pointer;
    padding: 10px;
    font-size: 18px;
}
.contactForm .inputBox input[type="submit"]:hover{
    transition: 0.5s;
    color: black;
    background: transparent;
}

.cart{
    margin-left: 1000px;
    font-size: 20px;
    margin-right: 140px;
    padding: 10px;
    color: linen;
    background: rgb(2, 2, 2);
    border-radius: 5px;
    float: right;
    margin-top: 20px;
    border:2px solid black;
  }
  .cart:hover{
    padding: 10px;
    color: black;
    background: white;
    border:2px solid black;
    border-radius: 5px;
    font-weight: bold;
  }

@media(max-width: 991px){
    .contact{
        padding: 50px;
    }
    .container{
        flex-direction: column;
    }
    .container .contactInfo{
        margin-bottom: 40px;
    }
    .container .contactInfo{
        width: 100%;
    }
}
</style>
</head>

<body>
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
<br><br>
<br><br>
<br><br>

	<div class="background">
		

    <section class="contact">
        <div class="content">
            <h2>Contact Us</h2>
        </div>
        <div class ="container">
            <div class="contactInfo">
                <div class="box">
                    <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                      </svg></div>
                    <div class="text">
                        <h3><b>Address</b></h3>
                        <p><b>A-704<br/>Swastik Highlands, Rajkot<br/>360007</b></p>
                    </div>
                </div>

                <div class="box">
                    <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                      </svg></div>
                    <div class="text">
                        <h3><b>Phone</b></h3>
                        <p><b>+91 94283 49690</b><br/><b>+91 92275 90139</b><br/><b>+91  97265 62484</b></p>
                    </div>
                </div>
                
                <div class="box">
                    <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                      </svg></div>
                    <div class="text">
                        <h3><b>Email</b></h3>
                        <p><b>booksbob@gmail.com</b></p>
                    </div>
                </div>

            </div>
            <div class="contactForm">
                <form action="#" method="POST">
                    <h2>Send Message</h2>
                    <div class="inputBox">
                        <input type="text" name="name" required="required">
                        <span>Full Name</span>
                    </div>
                    <div class="inputBox">
                        <br/><input type="text" name="email" required="required">
                        <span>Email</span>
                    </div>
                    <div class="inputBox">
                        <br/><textarea name="message" required="required"></textarea>
                        <span>Type your message....</span>
                    </div>
                    <div class="inputBox">
                        <br/><input type="submit" name="submit" value="Send">
                    </div>
                </form>
            </div>
        
        </div>
    
    </section>
   
    </body>
    </html>