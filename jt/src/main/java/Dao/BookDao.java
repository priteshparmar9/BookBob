package Dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import Entity_classes.book;

public class BookDao {
	public boolean is_available(String title) {
		boolean flag = false;

		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml")
				.addAnnotatedClass(Entity_classes.book.class);
		SessionFactory sf = con.buildSessionFactory();

		Session session = sf.openSession();
		Object temp1 = session.get(Entity_classes.book.class, title);
		book temp2 = (book) temp1;
		if (temp2 != null) {
			flag = true;
			System.out.println("Returned True");
		}
		return flag;
	}

	public void saveBook(book b) {

		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml")
				.addAnnotatedClass(Entity_classes.book.class);
		SessionFactory sf = con.buildSessionFactory();

		Session session = sf.openSession();

		session.getTransaction().begin();
		session.save(b);
		session.getTransaction().commit();
		return;
	}

	public void deleteBook(String title) {
		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml")
				.addAnnotatedClass(Entity_classes.book.class);
		SessionFactory sf = con.buildSessionFactory();

		Session session = sf.openSession();
		session.getTransaction().begin();
		Object temp1 = session.get(Entity_classes.book.class, title);
		book temp2 = (book) temp1;
		session.delete(temp2);

		session.getTransaction().commit();
		return;
	}
	
	public void updateBook(String title, String content, int price, String authname, String type) {
		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml")
				.addAnnotatedClass(Entity_classes.book.class);
		SessionFactory sf = con.buildSessionFactory();

		Session session = sf.openSession();
		session.getTransaction().begin();
		Object temp1 = session.get(Entity_classes.book.class, title);
		book temp2 = (book) temp1;
		temp2.setContent(content);
		temp2.setAuthname(authname);
		temp2.setPrice(price);
		temp2.setType(type);
		session.update(temp2);
		session.getTransaction().commit();
		return;
		
	}
}
