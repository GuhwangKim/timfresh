package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class Refund {
	@Id
	int refno;
	String refcont;
	int refprice;
	int driveynd;
	
	@JoinColumn(name = "claimno")
	@ManyToOne
	private Voc voc;
	
	
}
