package com.example.domain;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class Voc {
	@Id
	int claimno;
	int orderno;
	int resp;
	String respcont;
	int refyn;
	
	@Transient
	int driverynd;
	

	@ManyToOne
	@JoinColumn(name = "delno")
	private Delcorp delcorp;
	
	@ManyToOne
	@JoinColumn(name = "clientno")
	private Clientcorp clientcorp;
	

	
//	@JoinColumn(name = "delno")
//	@ManyToOne
//	private DelCorp delCorp;
//	l
//	
//	@JoinColumn(name = "clientno")
//	@ManyToOne
//	private ClientCorp clientCorp;
}
