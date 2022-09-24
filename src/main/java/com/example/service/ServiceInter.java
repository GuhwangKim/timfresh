package com.example.service;

import java.util.List;

import com.example.domain.Clientcorp;
import com.example.domain.Delcorp;
import com.example.domain.Refund;
import com.example.domain.Voc;

public interface ServiceInter {

	List<Voc> vFindall();

	List<Refund> rFindall();

	Voc vView(int claimno);

	Refund rSave(Refund refund);

	Voc vSave(Voc voc);

	Clientcorp cFind(int clientno);

	Delcorp dFind(int delno);

}
