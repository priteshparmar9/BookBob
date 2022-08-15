package controller;

import Dao.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import Entity_classes.Customer;
import Entity_classes.cust_edit;
import Entity_classes.cust_login;

@Controller
public class UserController {
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
//		return "login";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/signup")
	public ModelAndView signup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup");
		return mv;
	}

	@RequestMapping("/validateSignup")
	public ModelAndView validateSignup(Customer c, ModelAndView mv,HttpServletRequest request) {
		UserDao ud = new UserDao();
		if (ud.is_available(c.getemail())) {
			mv.setViewName("signup");
			request.getSession().setAttribute("error", "Email is already registered!!!");
//			mv.addObject("error", "Email is already registered!!!");
			
		} else {
			ud.saveCustomer(c);
			mv.setViewName("login");
		}

		return mv;
	}

	@RequestMapping("validateLogin")
	public ModelAndView validateLogin(Customer cust, ModelAndView mv, HttpServletRequest request) {
		UserDao ud = new UserDao();
		if (!ud.is_available(cust.getemail())) {
			mv = new ModelAndView (new RedirectView("Login"));
			request.getSession().setAttribute("error", "E-Mail is not registered!!!");
		} else {
			HttpSession session = request.getSession();
			
			if (ud.chackPassword(cust.getemail(),cust.getpassword())) {
				ud.set_sessions(session, cust.getemail());
				mv = new ModelAndView (new RedirectView("index"));
			} else {
				mv = new ModelAndView (new RedirectView("login"));
				session.setAttribute("error", "Password is incorrect!!!");
				System.out.println(request.getSession().getAttribute("error"));
			}
		}
		return mv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession s, ModelAndView mv) {
		s.invalidate();
		mv = new ModelAndView (new RedirectView("login"));
		return mv;
	}
	
	@RequestMapping("/edit")
	public ModelAndView edit(HttpSession s, ModelAndView mv) {
		mv.setViewName("edit");
		return mv;
	}
	
	@RequestMapping("show_book_article")
	public ModelAndView show_articles(String type, ModelAndView mv,HttpServletRequest request) {
		request.getSession().setAttribute("type", "article");
		mv.setViewName("show_book");
		
		return mv;		
	}
	
	@RequestMapping("edit_profile")
	public ModelAndView edit(cust_edit c,ModelAndView mv,HttpServletRequest request) {
		
		UserDao ud = new UserDao();
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		ud.update(request.getSession(), email, c);
		ud.set_sessions(session, email);
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("show_novel")
	public ModelAndView novel(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("show_book");
		HttpSession session = request.getSession();
		session.setAttribute("type", "novel");
		return mv;
	}
	
	@RequestMapping("show_article")
	public ModelAndView atrticle(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("show_book");
		HttpSession session = request.getSession();
		session.setAttribute("type", "article");
		return mv;
	}
	
	@RequestMapping("show_magazine")
	public ModelAndView magazine(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("show_book");
		HttpSession session = request.getSession();
		session.setAttribute("type", "magazine");
		return mv;
	}
}
