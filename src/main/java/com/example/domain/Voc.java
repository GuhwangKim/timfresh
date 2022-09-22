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
public class Voc {
	@Id
	int claimno;
	int orderno;
	int resp;
	String respcont;
	int refyn;
	int delno;
	int clientno;

	
//	@JoinColumn(name = "delno")
//	@ManyToOne
//	private DelCorp delCorp;
//	l
//	
//	@JoinColumn(name = "clientno")
//	@ManyToOne
//	private ClientCorp clientCorp;
}
