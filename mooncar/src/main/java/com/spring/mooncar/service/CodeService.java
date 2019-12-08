package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ProductInfoDTO;

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

	public List<ComcodeDTO> selectAllCar(ComcodeDTO comcodeDTO);	//차량 중분류 불러오기(이름)

	public List<CodeDTO> selectAlltype();  //차량 대분류 불러오기(종류)

	public List<ComcodeDTO> selectAllfuel(); //차량 기름종류 불러오기

	public List<ProductInfoDTO> selectCarDD(ProductInfoDTO prductinfoDTO); //차량 소분류 불러오기(상세)

	public List<ComcodeDTO> selectCarSize(ComcodeDTO comcodeDTO); //차량 크기 불러오기


}
