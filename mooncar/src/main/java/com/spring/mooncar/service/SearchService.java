package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.Check_searchDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.MainSearchDTO;
import com.spring.mooncar.dto.SearchDTO;

public interface SearchService {
	List<SearchDTO> selectSearch(Check_searchDTO check_searchDTO);//검색에서 사용
	List<CustomerDTO> Main_Search(MainSearchDTO mainsearchDTO);
}
