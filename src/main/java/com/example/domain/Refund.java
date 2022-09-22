package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Builder;
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
	int driverynd;
	
	@JoinColumn(name = "claimno")
	@ManyToOne
	private Voc voc;
	
	@Builder
	public Refund(int refno, int claimno, String refcont, int refprice, int driverynd, int refyn ) {
		this.refno=refno;
		this.voc.claimno=claimno; // voc 에서 가져옴
		this.refcont=refcont;
		this.refprice=refprice;
		this.driverynd=driverynd;
		this.voc.refyn=refyn; // voc 값 변경 
	}
}
