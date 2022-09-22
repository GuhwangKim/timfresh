package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity

public class Clientcorp {
	@Id
	int clientno;
	String clientname;
	String cempname;
	int cempphone;

}
