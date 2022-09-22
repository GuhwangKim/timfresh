package com.example.service;

import java.util.List;

import com.example.domain.Voc;


public interface ServiceInter {

	List<Voc> find();

	Voc view(int claimno);

}
