package controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import Dao.BookDao;
import Dao.CartDao;
import Entity_classes.Customer;
import Entity_classes.book;
import Entity_classes.cart;
import Entity_classes.history;

@Controller
public class HomeController {
	@RequestMapping("")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;

	}
	@RequestMapping("/")
	public ModelAndView home1() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;

	}

	@RequestMapping("contactus")
	public String contact() {
		return "contactus";
	}
	
	@RequestMapping("/checkout")
	public ModelAndView checkout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("checkout");
		return mv;

	}

	@RequestMapping("/editp")
	public ModelAndView edit_page(ModelAndView mv, HttpServletRequest request, String title) {

		request.getSession().setAttribute("title", title);

		mv.setViewName("edit_product");
		return mv;
	}

	@RequestMapping("/edit_product")
	public String editproduct(HttpServletRequest request, String edit_content, int edit_price, String edit_auth,
			String title, String type) {
		HttpSession session = request.getSession();
		System.out.println(title);
		BookDao bd = new BookDao();
		bd.updateBook(title, edit_content, edit_price, edit_auth, type);
		return "index";
	}

//
	@RequestMapping(path = "/deletep", method = RequestMethod.GET)
	public ModelAndView deletep(HttpServletRequest request, int id) {

		CartDao cd = new CartDao();
		cd.deleteCart(id);
		ModelAndView mv = new ModelAndView();
		mv= new ModelAndView(new RedirectView("show_cart"));
//		return "show_cart";
		return mv;
	}

	@RequestMapping(path = "/cartp", method = RequestMethod.GET)
	public ModelAndView cartp(ModelAndView mv, HttpServletRequest request, String title, String email, int amount,
			int qty) {
//		System.out.println(title + email + quantity);
		Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml")
				.addAnnotatedClass(Entity_classes.cart.class);
		SessionFactory sf = con.buildSessionFactory();

		Session ses = sf.openSession();
		HttpSession session = request.getSession();
		ses.getTransaction().begin();
		cart c = new cart(email, title, qty, amount);
		System.out.println(c);
		Query query = ses.createQuery("from cart WHERE email = :email and title = :title");
		query.setParameter("email", session.getAttribute("email"));
		query.setParameter("title", title);
		List<cart> results = query.list();
		boolean flag = false;
		for (cart c1 : results) {

			c1.setQuantity(c1.getQuantity() + qty);

			ses.update(c1);
			flag = true;
			ses.getTransaction().commit();
			break;
		}
		if (!flag) {
			ses.save(c);
			ses.getTransaction().commit();
		}
		System.out.println("Changes done");
		mv = new ModelAndView(new RedirectView("index"));
		return mv;
	}

	@RequestMapping("/mycart")
	public String mycart() {
		return "mycart";
	}

	@RequestMapping(path = "/checkp", method = RequestMethod.GET)
	public String checkp(HttpServletRequest req, Model model) {
		int a = Integer.parseInt(req.getParameter("price"));
		HttpSession session = req.getSession();
		session.setAttribute("price", a);
		model.addAttribute("price", a);

		return "checkout";
	}

//	@RequestMapping(path = "/deletefromcart", method = RequestMethod.GET)
//	public String remove(HttpServletRequest req) {
//		int pid = Integer.parseInt(req.getParameter("id"));
//		productdb bkd = new productdb(myConnection.getConnection());
//		bkd.removefromcart(pid);
//		return "mycart";
//	}
//	
	@RequestMapping("/show_cart")
	public String show_cart() {
		return "show_cart";
	}

	@RequestMapping("/conf_order")
	public ModelAndView confirm_order(HttpServletRequest request, String address) {
		System.out.println("Hellllllo");
		request.getSession().setAttribute("address", address);
		ModelAndView mv = new ModelAndView();
//		return "payment";
		mv.setViewName("payment");
		return mv;
	}

	@RequestMapping("/receipt")
	public ModelAndView receipt(ModelAndView mv) {

		mv.setViewName("receipt");
		return mv;
	}

	@RequestMapping("/conf_purchase")
	public ModelAndView conf_purchase(ModelAndView mv, HttpServletRequest request, String id, String date) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		Configuration con1 = new Configuration().configure("Dao/hibernate.cfg.xml")
				.addAnnotatedClass(Entity_classes.history.class);
		SessionFactory sf1 = con1.buildSessionFactory();
		Session ses1 = sf1.openSession();
		Configuration con = new Configuration().configure("Dao/hibernate.cfg.xml")
				.addAnnotatedClass(Entity_classes.cart.class);
		SessionFactory sf = con.buildSessionFactory();
		Session ses = sf.openSession();
		
		Query query = ses.createQuery("from cart WHERE email = :email");
		query.setParameter("email",email);
		Random rand = new Random();
		int i = rand.nextInt();
		if(i < 0) {
			i *= -1;
		}
		List<cart> results = query.list();
		for(cart c:results) {
			ses.getTransaction().begin();	
			history h = new history();
			h.setDate(date);
			i = rand.nextInt();
			if(i < 0) {
				i *= -1;
			}
			h.setId(i);
			h.setBill_id(id);
			h.setEmail(email);
			h.setQuantity(c.getQuantity());
			h.setAmount(c.getAmount()*c.getQuantity()*(1.12));
			h.setTitle(c.getTitle());
			ses1.getTransaction().begin();
			ses1.save(h);
			ses1.getTransaction().commit();
			ses.delete(c);
			ses.getTransaction().commit();
		}
		
		mv.setViewName("index");

		return mv;
	}

}
