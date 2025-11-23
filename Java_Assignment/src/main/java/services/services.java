package services;

public class services {
	public services(int service_id, String service_name, String service_url, String category_description, String category_tag) {
		this.service_id = service_id;
		this.service_name = service_name;
		this.service_url = service_url;
		this.category_description = category_description;
		this.category_tag = category_tag;
	}
	private String service_name;
	private String service_url;
	private String category_description;
	private String category_tag;
	private int service_id;
	
	public String getServiceName() {
		return service_name;
	}
	public String getServiceUrl() {
		return service_url;
	}
	public String getCategoryDescription() {
		return category_description;
	}
	public String getCategoryTag() {
		return category_tag;
	}
	public int getServiceId() {
		return service_id;
	}
}
