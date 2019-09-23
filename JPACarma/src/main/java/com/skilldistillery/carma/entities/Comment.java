package com.skilldistillery.carma.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	private String text;
	
	@Column(name="date_comment_created")
	private String dateCreated;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="parking_fail_id")
	private ParkingFail parkingFail;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ParkingFail getParkingFail() {
		return parkingFail;
	}

	public void setParkingFail(ParkingFail parkingFail) {
		this.parkingFail = parkingFail;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		if (Id != other.Id)
			return false;
		return true;
	}

	public Comment(int id, String text, String dateCreated, User user, ParkingFail parkingFail) {
		super();
		Id = id;
		this.text = text;
		this.dateCreated = dateCreated;
		this.user = user;
		this.parkingFail = parkingFail;
	}

	public Comment() {
		super();
	}
	
}
