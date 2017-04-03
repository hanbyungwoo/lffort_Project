package model.domain;

public class NewEvent {
	String url;
	String name;
	
	public NewEvent() {
		super();
	}
	
	public NewEvent(String url, String name) {
		super();
		this.url = url;
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
