package com.skilldistillery.carma.entities;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Carma {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="parking_fail_id")
	private ParkingFail parkingFail;
	
	private int vote;
	
	
	@Column(name="date_voted")
	LocalDateTime dateVoted;
	
	public Carma() {
		
	}
	
	
	public Carma(User user, ParkingFail parkingFail, int vote, LocalDateTime dateVoted) {
		super();
		this.user = user;
		this.parkingFail = parkingFail;
		this.vote = vote;
		this.dateVoted = dateVoted;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	public LocalDateTime getDateVoted() {
		return dateVoted;
	}
	public void setDateVoted(LocalDateTime dateVoted) {
		this.dateVoted = dateVoted;
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
		Carma other = (Carma) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override 
	public String toString() {
		return "Carma [id=" + id + ", user=" + user + ", vote=" + vote + ",  dateVoted=" + dateVoted
				+ "]";
	}
	
	
	
}
