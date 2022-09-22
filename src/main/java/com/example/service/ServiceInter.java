package com.example.service;

import java.util.List;

import com.example.domain.Refund;
import com.example.domain.Voc;

public interface ServiceInter {

	List<Voc> findall();

	List<Refund> chkdynd();

	Voc view(int claimno);

	Refund save(Refund refund);
}
