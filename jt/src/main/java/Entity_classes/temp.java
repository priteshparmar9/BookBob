package Entity_classes;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class temp {
	@Id
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
