package Entity_classes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class book {
	@Id
	private String title;

	@Column(columnDefinition="LONGTEXT")
	private String content;
	private String authname;
	private String type;
	@Column(columnDefinition="LONGTEXT")
	private String url;
	private int price;
	
	public book() {
		
	}
	
	public book(String title, String content, String authname, String type, String url, int price) {
		super();
		this.title = title;
		this.content = content;
		this.authname = authname;
		this.type = type;
		this.url = url;
		this.price = price;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthname() {
		return authname;
	}
	public void setAuthname(String authname) {
		this.authname = authname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "book [title=" + title + ", content=" + content + ", authname=" + authname + ", type=" + type
				+ ", price=" + price + "]";
	}
	
	
}
