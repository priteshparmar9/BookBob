package Entity_classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class cart {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String email;
	private String title;
	private int quantity;
	private int amount;
	@Override
	public String toString() {
		return "cart [id=" + id + ", email=" + email + ", title=" + title + ", quantity=" + quantity + "]";
	}
	public String getEmail() {
		return email;
	}
	public cart(String email, String title, int quantity, int amount) {
		super();
		this.email = email;
		this.title = title;
		this.quantity = quantity;
		this.amount = amount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public cart(int id, String email, String title, int quantity, int amount) {
		super();
		this.id = id;
		this.email = email;
		this.title = title;
		this.quantity = quantity;
		this.amount = amount;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getQuantity() {
		return quantity;
	}
	public cart() {
		super();
	}
	public cart(int id, String email, String title, int quantity) {
		super();
		this.id = id;
		this.email = email;
		this.title = title;
		this.amount = amount;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public cart(String email, String title, int quantity) {
		super();
		this.email = email;
		this.title = title;
		this.quantity = quantity;
	}	
}
