package com.skilldistillery.carma.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "parking_fail")
public class ParkingFail  {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "car_id")
	private Car car;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "location_id")
	private Location location;
	
	@Column(name="fail_time")
	private String failTime;

	private String description;

	@OneToMany(mappedBy = "parkingFail")
	private List<Picture> listOfPictures;

	@OneToMany(mappedBy = "parkingFail")
	private List<Carma> listOfCarma;
	
	@OneToMany(mappedBy = "parkingFail")
	private List<Comment> listOfComments;
	
	public List<Comment> getListOfComments() {
		return listOfComments;
	}

	public void setListOfComments(List<Comment> listOfComments) {
		this.listOfComments = listOfComments;
	}

	public ParkingFail() {

	}

	public ParkingFail(String title, Car car, User user, Location location, String failTime,
			String description) {
		super();
		this.title = title;
		this.car = car;
		this.user = user;
		this.location = location;
		this.failTime = failTime;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public String getFailTime() {
		return failTime;
	}

	public void setFailTime(String failTime) {
		this.failTime = failTime;
	}

	public String getText() {
		return description;
	}

	public void setText(String text) {
		this.description = text;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Picture> getListOfPictures() {
		return new ArrayList<>(listOfPictures);
	}

	public void setListOfPictures(List<Picture> listOfPictures) {
		this.listOfPictures = listOfPictures;
	}

	public List<Carma> getListOfCarma() {
		return listOfCarma;
	}

	public void setListOfCarma(List<Carma> listOfCarma) {
		this.listOfCarma = listOfCarma;
	}
	
	public int getCarmaValue() {
		int carmaValue = 0;
		List<Carma> carma = this.listOfCarma;
		for (Carma carma2 : carma) {
			carmaValue= carmaValue + carma2.getVote();
		}
		return carmaValue;
		
				
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		ParkingFail other = (ParkingFail) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ParkingFail [id=" + id + ", title=" + title + ", car=" + car + ", user=" + user + ", failTime="
				+ failTime + ", text=" + description + ", getId()=" + getId() + ", getTitle()=" + getTitle()
				+ ", getCar()=" + getCar() + ", getUser()=" + getUser() + ", getFailTime()=" + getFailTime()
				+ ", getText()=" + getText() + ", hashCode()=" + hashCode() + ", getClass()=" + getClass()
				+ ", toString()=" + super.toString() + "]";
	}

	


}
