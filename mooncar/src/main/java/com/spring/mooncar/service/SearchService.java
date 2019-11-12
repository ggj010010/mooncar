package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.SearchDTO;

public interface SearchService {
	List<SearchDTO> selectSearch(SearchDTO searchDTO);//검색에서 사용

}
