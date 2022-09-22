package com.example.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RepositoryImpl;
import com.example.domain.Voc;


@Service
@Transactional
public class ServiceImpl implements ServiceInter {

	@Autowired
	RepositoryImpl rp;

	// Voc 게시판 목록
	@Override
	public List<Voc> find() {
		List<Voc> list = rp.find();
		return list;
	}

	// 배상 목록 등록 상세보기 resp 가 1일때
	@Override
	public Voc view(int claimno) {
		System.out.println("2");
		Voc view = rp.view(claimno);
		System.out.println("3");
		return view;
	}

}
