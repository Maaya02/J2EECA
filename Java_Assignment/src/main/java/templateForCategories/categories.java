package templateForCategories;

public class categories {
	public categories(String category, String category_description) {
		this.category = category;
		this.category_description = category_description;
	}
	private String category;
	private String category_description;
	public String getCategory() {
		return category;
	}
	public String getCategoryDescription() {
		return category_description;
	}
}
