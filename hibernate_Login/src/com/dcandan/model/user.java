package com.dcandan.model;

public class user {
	private int id;
	private String userName, password;

	public user(){
	}
	public user(String user_name, String password){
		this.userName = user_name;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
