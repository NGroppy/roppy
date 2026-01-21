package beans;

import java.sql.Timestamp;


public class Mydata {
	private int id;
	private String data;
	private Timestamp entryDataTime;
	
	
	public Mydata(int id, String data, Timestamp entryDataTime) {
		super();
		this.id = id;
		this.data = data;
		this.entryDataTime = entryDataTime;
	}
	
	public Mydata() {
		
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getData() {
		return data;
	}


	public void setData(String data) {
		this.data = data;
	}


	public Timestamp getEntryDataTime() {
		return entryDataTime;
	}


	public void setEntryDataTime(Timestamp entryDataTime) {
		this.entryDataTime = entryDataTime;
	}
	
}
