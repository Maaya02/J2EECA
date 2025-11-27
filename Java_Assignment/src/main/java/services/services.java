package services;

public class services {
	public services(String service_description,int service_id, String service_name, String category_description, String category_tag) {
		this.service_id = service_id;
		this.service_name = service_name;
		this.category_description = category_description;
		this.category_tag = category_tag;
		this.service_description = service_description;
	}
	private String service_name;
	private String category_description;
	private String category_tag;
	private int service_id;
	private String service_description;

	
	public String getServiceDescription() {
		return service_description;
	}
	public String getServiceName() {
		return service_name;
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
