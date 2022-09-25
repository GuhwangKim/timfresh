package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@SequenceGenerator(name = "REFNO_seq_generator", sequenceName = "REFNO_seq", allocationSize = 1)
public class Refund {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "REFNO_seq_generator")
	int refno;
	String refcont;
	int refprice;
	int driverynd;
	
	@JoinColumn(name = "claimno")
	@ManyToOne
	private Voc voc;
	
	
	@Builder
	public Refund() {
		
	}
	public Refund(int refno, int claimno, String refcont, int refprice, int driverynd, int refyn ) {
		this.refno=refno;
		this.voc.claimno=claimno; // voc 에서 가져옴
		this.refcont=refcont;
		this.refprice=refprice;
		this.driverynd=driverynd;
		this.voc.refyn=refyn; // voc 값 변경 
	}
}
