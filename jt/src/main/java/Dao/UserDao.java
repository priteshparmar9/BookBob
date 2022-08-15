package Dao;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import Entity_classes.*;
public class UserDao {
	public boolean is_available(String email) {
		boolean flag = false;
		

		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.Customer.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session session = sf.openSession();
		Object temp1 = session.get(Entity_classes.Customer.class, email);
		Customer temp2 = (Customer)temp1;
		if(temp2 != null) {
			flag = true;
			System.out.println("Returned True");
		}
		return flag;
	}
	public void saveCustomer(Customer c) {

		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.Customer.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session session = sf.openSession();
		
		session.getTransaction().begin();	
		session.save(c);
		session.getTransaction().commit();
		return;
	}	
	public boolean chackPassword(String email, String password){
		boolean flag = false;
		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.Customer.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session session = sf.openSession();
		Object temp1 = session.get(Entity_classes.Customer.class,email);
		Customer temp2 = (Customer)temp1;
		System.out.println("Till now succeed");
		if(temp2.getpassword().equals(password)) {
			flag = true;
		}
		return flag;
	}
	public void set_sessions(HttpSession s, String email) {
		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.Customer.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session session = sf.openSession();
		Object temp1 = session.get(Entity_classes.Customer.class, email);
		Customer temp2 = (Customer)temp1;
		s.setAttribute("email", temp2.getemail());
		s.setAttribute("name", temp2.getname());
		s.setAttribute("number", temp2.getnumber());
		s.setAttribute("password", temp2.getpassword());
		return;
	}
	public void update(HttpSession s, String email, cust_edit c) {
		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.Customer.class);
		SessionFactory sf = con.buildSessionFactory();
		
		Session session = sf.openSession();
		Object temp1 = session.get(Entity_classes.Customer.class, email);
		Customer temp2 = (Customer)temp1;
		temp2.setname(c.getName());
		temp2.setnumber(c.getNumber());
		temp2.setpassword(c.getPassword());
		session.getTransaction().begin();
		session.update(temp2);
		session.getTransaction().commit();
		return;
	}
}
