package com.tm.cgv.cinema;

public class CinemaVO {

	private int num;
	private String name;
	private String local;
	private String address;
	private String tel;
	private int totalTheater;
	private int totalSeat;
	private String trafficInfo;
	private String parkingInfo;
	private String intro;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocal() {
		if(this.local == null || this.local.equals("")) {
			this.local = "서울";
		}
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getTotalTheater() {
		return totalTheater;
	}
	public void setTotalTheater(int totalTheater) {
		this.totalTheater = totalTheater;
	}
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}
	public String getTrafficInfo() {
		return trafficInfo;
	}
	public void setTrafficInfo(String trafficInfo) {
		this.trafficInfo = trafficInfo;
	}
	public String getParkingInfo() {
		return parkingInfo;
	}
	public void setParkingInfo(String parkingInfo) {
		this.parkingInfo = parkingInfo;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	
	
}
