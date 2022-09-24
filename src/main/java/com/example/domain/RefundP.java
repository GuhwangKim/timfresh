package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class RefundP {
	@Id
	int refno;
	int claimno;
	String refcont;
	int refprice;
	int driverynd;
	int refyn;

}
