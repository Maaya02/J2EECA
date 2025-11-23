package bookings;

public class caregiver {
	public caregiver(int caregiver_id, String caregiver_name) {
		this.caregiver_id = caregiver_id;
		this.caregiver_name = caregiver_name;
	}
	private int caregiver_id; 
	private String caregiver_name;
	
	public int getCaregiverId() {
		return this.caregiver_id;
	}
	
	public String getCaregiverName() {
		return this.caregiver_name;
	}
}
