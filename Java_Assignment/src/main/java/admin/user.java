package admin;

public class user {
	public user(int id, String username, String email, String role, int number) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.role = role;
		this.number = number;
	}
	private int id;
	private String username;
	private String email;
	private String role;
	private int number;
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	
	public String getEmail() {
		return email;
	}
	public String getRole() {
		return role;
	}
	public int getNumber() {
		return number;
	}
}
