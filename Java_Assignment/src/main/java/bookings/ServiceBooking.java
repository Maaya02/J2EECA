package bookings;
import java.sql.Timestamp;

public class ServiceBooking {
	public ServiceBooking(int id, Timestamp date, String service_name, String staff) {
		super();
		this.id = id;
		this.date = date;
		this.service_name = service_name;
		this.staff = staff;
	}
	private int id;
	private Timestamp date;
	private String service_name;
	private String staff;
	
	public int getId() {
		return id;
	}
	public Timestamp getDate() {
		return date;
	}
	public String getServiceName() {
		return service_name;
	}
	public String getStaff() {
		return staff;
	}
}
