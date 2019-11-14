package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;

public interface CodeService {
	
	public List<CodeDTO> selectCodeList1() throws Exception;

	public List<CodeDTO> selectCodeList(int thisPage) throws Exception;
	
	public List<ComcodeDTO> selectComcodeList(ComcodeDTO comcodeDTO) throws Exception;
	
	public List<ComcodeDTO> selectComcodeList1(ComcodeDTO comcodeDTO) throws Exception;
	
	public int selectCodeCnt() throws Exception;

	public int selectComcodeCnt(ComcodeDTO comcodeDTO) throws Exception;

	public int codeInsert(CodeDTO codeDTO) throws Exception;
	
	public int codeUpdate(CodeDTO codeDTO) throws Exception;

	public int codeDelete(CodeDTO codeDTO) throws Exception;

	public int codeDeleteAll(CodeDTO codeDTO) throws Exception;

	public int comcodeInsert(ComcodeDTO comcodeDTO) throws Exception;

	public int comcodeUpdate(ComcodeDTO comcodeDTO) throws Exception;

	public int comcodeDelete(ComcodeDTO comcodeDTO) throws Exception;

	public ComcodeDTO selectComcodeView(String prdCtgr) throws Exception;	

}
