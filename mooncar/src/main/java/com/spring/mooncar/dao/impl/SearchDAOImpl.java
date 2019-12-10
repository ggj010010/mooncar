package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.SearchDAO;
import com.spring.mooncar.dto.Check_searchDTO;
import com.spring.mooncar.dto.MainSearchDTO;
import com.spring.mooncar.dto.SearchDTO;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SearchDTO> selectSearch(Check_searchDTO check_searchDTO) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("search.selectSearch", check_searchDTO);
	}

	@Override
	public List<SearchDTO> Main_Search(MainSearchDTO mainsearchDTO) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("mainsearch.main_Search", mainsearchDTO);
	}
}
