package admin;

public class CategoryTag {
	public CategoryTag(int id, String name, String category_name) {
		this.id = id;
		this.name = name;
		this.category_name = category_name;
	}
	private int id;
	private String name;
	private String category_name;
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getCategoryName() {
		return category_name;
	}
}
