package com.pension.admin.sterm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.sterm.dao.StermDao;
import com.pension.admin.sterm.vo.StermVO;

@Service
public class StermServiceImpl implements StermService {
	@Autowired
	private StermDao stermDao;

	@Override
	public StermVO getSterm() {
		StermVO svo = null;
		svo = stermDao.getSterm();
		return svo;
	}

	@Override
	public int stermInsert(StermVO svo) {
		int result=0;
		result = stermDao.stermInsert(svo);
		return result;
	}

	@Override
	public int stermDelete(StermVO svo) {
		int result=0;
		result = stermDao.stermDelete(svo);
		return result;
	}

	@Override
	public int confirm() {
		int result=0;
		result = stermDao.confirm();
		return result;
	}
}
