package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class DelCorp {
	@Id
	int delno;
	String delname;
	String dempname;
	int dempphone;

}
