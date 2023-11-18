package rail;

public class RailCross {
	private String name;
	private String address;
	private String landmark;
	private String trainSchedule;
	private String personInCharge;
	private String status;
	public RailCross(String name, String address, String landmark, String
	trainSchedule, String personInCharge, String status) {
	this.name = name;
	this.address = address;
	this.landmark = landmark;
	this.trainSchedule = trainSchedule;
	this.personInCharge = personInCharge;
	this.status = status;
	
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getTrainSchedule() {
		return trainSchedule;
	}
	public void setTrainSchedule(String trainSchedule) {
		this.trainSchedule = trainSchedule;
	}
	public String getPersonInCharge() {
		return personInCharge;
	}
	public void setPersonInCharge(String personInCharge) {
		this.personInCharge = personInCharge;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
