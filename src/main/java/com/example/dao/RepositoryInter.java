package com.example.dao;

import java.util.List;

import com.example.domain.Refund;
import com.example.domain.Voc;

public interface RepositoryInter {

	List<Voc> findall();

	List<Refund> chkdynd();

	Voc view(int claimno);

	Refund save(Refund refund, int claimno, int refyn);


}
