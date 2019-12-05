package com.spring.mooncar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mooncar.dao.CodeDao;
import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.ProductInfoDTO;
import com.spring.mooncar.service.CodeService;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	CodeDao codeDao;
	
	@Override
	public ComcodeDTO selectComcodeView(String prdCtgr) throws Exception {
		// TODO Auto-generated method stub
		ComcodeDTO comcodeDTO = new ComcodeDTO();
		comcodeDTO.setCodeId(prdCtgr);
		return codeDao.selectComcodeView(comcodeDTO);
	}
	
	@Override
	public List<CodeDTO> selectCodeList1() throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectCodeList1();
	}
	
	@Override
	public List<CodeDTO> selectCodeList(int thisPage) throws Exception {
		// TODO Auto-generated method stub
		CodeDTO codeDTO = new CodeDTO();
		codeDTO.setPageNo(thisPage);
		
		return codeDao.selectCodeList(codeDTO);
	}
	
	@Override
	public List<ComcodeDTO> selectComcodeList1(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectComcodeList1(comcodeDTO);
	}

	@Override
	public List<ComcodeDTO> selectComcodeList(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectComcodeList(comcodeDTO);
	}
	
	@Override
	public int selectCodeCnt() throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectCodeCnt();
	}
	
	@Override
	public int selectComcodeCnt(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.selectComcodeCnt(comcodeDTO);
	}
	
	@Override
	public int codeInsert(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.codeInsert(codeDTO);
	}
	
	@Override
	public int codeUpdate(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.codeUpdate(codeDTO);
	}
	
	@Override
	public int codeDelete(CodeDTO codeDTO) throws Exception {
		
		//���޵� ���ΰ��� ����
		
		//1.������ �����
		
		// codeDao.codeDeleteAll(codeDTO) ȣ��
		
		//1.1 �������� ������
		
		////codeDao.codeDelete(codeDTO) ȣ��
		
		//2.������ �������
		
		//codeDao.codeDelete(codeDTO) ȣ��
		
		
		// TODO Auto-generated method stub
		return codeDao.codeDelete(codeDTO);
	}
	
	@Override
	public int codeDeleteAll(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.codeDeleteAll(codeDTO);
	}
	
	@Override
	public int comcodeInsert(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.comcodeInsert(comcodeDTO);
	}
	
	@Override
	public int comcodeUpdate(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.comcodeUpdate(comcodeDTO);
	}
	
	@Override
	public int comcodeDelete(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return codeDao.comcodeDelete(comcodeDTO);
	}
	
	//���� ��з�(userpop.jsp �����̸�)
	@Override
	public List<ComcodeDTO> selectAllCar(ComcodeDTO comcodeDTO) {
		// TODO Auto-generated method stub
		return codeDao.selectAllCar(comcodeDTO);
	}

	//���� ��з�(userpop.jsp ���� �ʱ� ȣ���̸� Ÿ��)
	@Override
	public List<CodeDTO> selectAlltype() {
		// TODO Auto-generated method stub
		return codeDao.selectAlltype();
	}

	//���� �⸧���� �ҷ�����(userpop.jsp)
	@Override
	public List<ComcodeDTO> selectAllfuel() {
		// TODO Auto-generated method stub
		return codeDao.selectAllfuel();
	}

	//���� �Һз� �ҷ�����(userpop.jsp)
	@Override
	public List<ProductInfoDTO> selectCarDD(ProductInfoDTO prductinfoDTO) {
		// TODO Auto-generated method stub
		return codeDao.selectCarDD(prductinfoDTO);
	}



	
}
