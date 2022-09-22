package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RepositoryImpl;
import com.example.dao.RepositoryInter;
import com.example.domain.Refund;
import com.example.domain.Voc;

@Service
@Transactional
public class ServiceImpl implements ServiceInter {

	@Autowired
	RepositoryInter rp;

	// Voc 게시판 목록
	@Override
	public List<Voc> findall() {
		List<Voc> list = rp.findall();
		return list;
	}
	// Voc 게시판 목록 - (기사확인여부)
	@Override
	public List<Refund> chkdynd() {
		List<Refund>chk=rp.chkdynd();
		return chk;
	}
	
	// 배상 목록 등록 상세보기 resp 가 1일때
	@Override
	public Voc view(int claimno) {
		Voc view = rp.view(claimno);
		return view;
	}
	
	// 배상 목록 저장 
	@Override
	public Refund save(Refund refund) {
		Refund refsave=rp.save(refund);
		return refsave;
	}


}
