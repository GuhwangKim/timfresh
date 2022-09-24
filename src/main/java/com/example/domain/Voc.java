package com.example.domain;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@SequenceGenerator(name = "CLAIMNO_seq_generator", sequenceName = "CLAIMNO_seq", allocationSize = 1)
public class Voc {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "CLAIMNO_seq_generator")
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
