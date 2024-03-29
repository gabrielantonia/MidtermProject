package com.skilldistillery.carma.entities;

import java.time.LocalDateTime;
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
@Table(name="parking_fail")
public class ParkingFail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="car_id")
	private Car car;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="location_id")
	private Location location;
	
	@Column(name="fail_time")
	private LocalDateTime failTime;
	
	private String description;
	
	@OneToMany(mappedBy="parkingFail")
	private List<Picture> listOfPictures;
	

	public ParkingFail() {
		
	}
	
	public ParkingFail(String title, Car car, User user, Location location, LocalDateTime failTime,
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

	public LocalDateTime getFailTime() {
		return failTime;
	}

	public void setFailTime(LocalDateTime failTime) {
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
				+ failTime + ", text=" + description + ", getId()=" + getId() + ", getTitle()=" + getTitle() + ", getCar()="
				+ getCar() + ", getUser()=" + getUser() + ", getFailTime()=" + getFailTime() + ", getText()="
				+ getText() + ", hashCode()=" + hashCode() + ", getClass()=" + getClass() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
