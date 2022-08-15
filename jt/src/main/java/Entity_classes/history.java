package Entity_classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class history {

	@Id
	private int id;
	private String bill_id;
	private String email;
	private String title;
	private int quantity;
	private double amount;
	private String Date;
	
	
	public history(int id, String bill_id, String email, String title, int quantity, double amount, String String) {
		super();
		this.id = id;
		this.bill_id = bill_id;
		this.email = email;
		this.title = title;
		this.quantity = quantity;
		this.amount = amount;
		this.Date = Date;
	}
	public history(String bill_id, String email, String title, int quantity, double amount, String Date) {
		super();
		this.bill_id = bill_id;
		this.email = email;
		this.title = title;
		this.quantity = quantity;
		this.amount = amount;
		this.Date = Date;
	}
	public String getBill_id() {
		return bill_id;
	}
	public void setBill_id(String bill_id) {
		this.bill_id = bill_id;
	}
	public int getId() {
		return id;
	}
	public history() {
		super();
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
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
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String String) {
		this.Date = String;
	}

	
	
	
}
