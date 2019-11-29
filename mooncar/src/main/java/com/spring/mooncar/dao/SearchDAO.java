package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.Check_searchDTO;
import com.spring.mooncar.dto.SearchDTO;

public interface SearchDAO {
	List<SearchDTO> selectSearch(Check_searchDTO check_searchDTO);

}
