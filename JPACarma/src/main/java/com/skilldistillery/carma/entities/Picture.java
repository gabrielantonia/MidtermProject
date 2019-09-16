package com.skilldistillery.carma.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Picture {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String url;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "parking_fail_id")
	private ParkingFail parkingFail;

	public Picture() {

	}

	public Picture(String url, ParkingFail parkingFail) {
		super();
		this.url = url;
		this.parkingFail = parkingFail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
		Picture other = (Picture) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Picture [id=" + id + ", url=" + url + ", parkingFail=" + parkingFail + "]";
	}

}
