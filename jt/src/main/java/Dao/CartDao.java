package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import Entity_classes.cart;

public class CartDao {
	public void deleteCart(int id) {
		Configuration con = new Configuration().configure("/Dao/hibernate.cfg.xml").addAnnotatedClass(Entity_classes.cart.class);
		SessionFactory sf = con.buildSessionFactory();
		
		
		Session session = sf.openSession();
		session.getTransaction().begin();	
		Object temp1 = session.get(Entity_classes.cart.class, id);
		cart temp2 = (cart)temp1;
		session.delete(temp2);
		session.getTransaction().commit();
		return;
	}
}
