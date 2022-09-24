package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class VocP {
	@Id
	int claimno;
	int orderno;
	int resp;
	String respcont;
	int refyn;
	int clientno;
	int delno;

}
