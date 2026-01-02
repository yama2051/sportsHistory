package com.example.sportsHistry.model;

public class TimeLineEventDto {
	private int id;
    private String country;
    private int year;
    private String event;
    private String detail;
    private String sports;
    private boolean important;

    //id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	//国
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	//年
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	//出来事
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	//その他特記事項
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getSports() {
		return sports;
	}
	public void setSports(String sports) {
		this.sports = sports;
	}
	public boolean isImportant() {
		return important;
	}
	public void setImportant(boolean important) {
		this.important = important;
	}

}
