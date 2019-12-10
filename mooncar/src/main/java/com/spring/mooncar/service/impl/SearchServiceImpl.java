package com.spring.mooncar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mooncar.dao.SearchDAO;
import com.spring.mooncar.dto.Check_searchDTO;
import com.spring.mooncar.dto.MainSearchDTO;
import com.spring.mooncar.dto.SearchDTO;
import com.spring.mooncar.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchDAO searchDAO;
	
	@Override
	public List<SearchDTO> selectSearch(Check_searchDTO check_searchDTO) {
		// TODO Auto-generated method stub
		return searchDAO.selectSearch(check_searchDTO);
	}

	@Override
	public List<SearchDTO> Main_Search(MainSearchDTO mainsearchDTO) {
		// TODO Auto-generated method stub
		return searchDAO.Main_Search(mainsearchDTO);
	}

}
