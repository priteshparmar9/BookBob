package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import Dao.BookDao;
import Dao.UserDao;
import Entity_classes.Customer;
import Entity_classes.book;

@Controller
public class AdminController {
	
	@RequestMapping("/admin_page")
	public String admin_page() {
		return "admin_page";
	}
	
	@RequestMapping("/addBook")
	public String add_books() {
		return "admin_AddBook";
	}
	@RequestMapping("/history")
	public String history() {
		return "history";
	}
	
	@RequestMapping("/validateBook")
	public ModelAndView validateBook(book b, ModelAndView mv,HttpServletRequest request) {
		System.out.println(b);
		BookDao ud = new BookDao();
		if (ud.is_available(b.getTitle())) {
			mv.setViewName("addBook");
			request.getSession().setAttribute("error", "Title is already registered!!!");
//			mv.addObject("error", "Title is already registered!!!");
			
		} else {
			ud.saveBook(b);
			mv.setViewName("admin_page");
		}

		return mv;
	}
	
	@RequestMapping("temp")
	public String temp() {
		return "temp";
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(ModelAndView mv, String value) {
		BookDao bookDao = new BookDao();
		bookDao.deleteBook(value);
		mv = new ModelAndView (new RedirectView("index"));
		return mv;
	}
	
}
