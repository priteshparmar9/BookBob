
package Entity_classes;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Customer {
	private long number;
	private String name;
	@Id
	private String email;
	private String password;

	public Customer() {
	}

	public Customer(long number, String name, String email, String password) {
		this.number = number;
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public Customer(String name, String email, String password) {
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public long getnumber() {
		return number;
	}

	public void setnumber(long id) {
		this.number = id;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Customer{" + "id=" + number + ", name=" + name + ", email=" + email + ", password=" + password + '}';
	}

}
