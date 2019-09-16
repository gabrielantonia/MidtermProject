package com.skilldistillery.carma.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Location {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToMany(mappedBy="location")
	private List<ParkingFail> listOfParkingFails;
	
	private String name;
	
	private String street;
	
	private String city;
	
	private String state;
	
	private String zip;
	
	public Location() {
		
	}
	
	

	public Location(String name, String street, String city, String state,
			String zip) {
		super();
		this.name = name;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}



	public List<ParkingFail> getListOfParkingFails() {
		return listOfParkingFails;
	}



	public void setListOfParkingFails(List<ParkingFail> listOfParkingFails) {
		this.listOfParkingFails = listOfParkingFails;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getStreet() {
		return street;
	}



	public void setStreet(String street) {
		this.street = street;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public String getZip() {
		return zip;
	}



	public void setZip(String zip) {
		this.zip = zip;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Location other = (Location) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Location [id=" + id + ", listOfParkingFails=" + listOfParkingFails + ", name=" + name + ", street="
				+ street + ", city=" + city + ", state=" + state + ", zip=" + zip + "]";
	}
	
	
}
