package beans;

import java.sql.Timestamp;

public class MyData {
	private int id;
	private String data;
	private String data2;
	private Timestamp entryDatetime;

	public MyData() {
		
	}
	
	public MyData(int id, String data, String data2, Timestamp entryDatetime) {
		super();
		this.id = id;
		this.data = data;
		this.data2 = data2;
		this.entryDatetime = entryDatetime;
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

	public String getData2() {
		return data2;
	}

	public void setData2(String data2) {
		this.data2 = data2;
	}

	public Timestamp getEntryDatetime() {
		return entryDatetime;
	}

	public void setEntryDatetime(Timestamp entryDatetime) {
		this.entryDatetime = entryDatetime;
	}
	
	
	
}
