package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RepositoryImpl;
import com.example.dao.RepositoryInter;
import com.example.domain.Clientcorp;
import com.example.domain.Delcorp;
import com.example.domain.Refund;
import com.example.domain.Voc;

@Service
@Transactional
public class ServiceImpl implements ServiceInter {

	@Autowired
	RepositoryInter rp;

	// Voc 게시판 목록
	@Override
	public List<Voc> vFindall() {
		List<Voc> list = rp.vFindall();
		return list;
	}
	
	// Refund 목록 (Voc 게시판 목록 - (기사확인여부))
	@Override
	public List<Refund> rFindall() {
		List<Refund>chk=rp.rFindall();
		return chk;
	}
	
	// voc 목록 (배상등록-운송사) 상세보기
	@Override
	public Voc vView(int claimno) {
		Voc view = rp.vView(claimno);
		return view;
	}
	
	// 배상 정보 등록 (운송사) 
	@Override
	public Refund rSave(Refund refund) {
		Refund refsave=rp.rSave(refund);
		return refsave;
	}
	// 배상 정보 등록 (고객사) 
	
	// Voc 게시물 등록
	@Override
	public Voc vSave(Voc voc) {
		Voc vwrite = rp.vSave(voc);
		return vwrite;
	}
	// 고객사 정보 
	@Override
	public Clientcorp cFind(int clientno) {
		Clientcorp clientcorp = rp.cFind(clientno);
		return clientcorp;
	}
	// 운송사 정보 
	@Override
	public Delcorp dFind(int delno) {
		Delcorp delcorp = rp.dFind(delno);
		return delcorp;
	}
	// 기사 승인 확인 목록
	@Override
	public Refund rFind(int refno) {
		Refund ref = rp.rFind(refno);
		return ref;
	}
	


}
