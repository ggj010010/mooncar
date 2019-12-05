package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.CodeDao;
import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.ProductInfoDTO;

@Repository
public class CodeDaoImpl implements CodeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ComcodeDTO selectComcodeView(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.comcodeView",comcodeDTO);
	}
	
	@Override
	public List<CodeDTO> selectCodeList1() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.codeList1");
	}
	
	@Override
	public List<CodeDTO> selectCodeList(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.codeList",codeDTO);
	}
	
	@Override
	public List<ComcodeDTO> selectComcodeList1(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.comcodeList1",comcodeDTO);
	}

	@Override
	public List<ComcodeDTO> selectComcodeList(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.comcodeList",comcodeDTO);
	}
	
	@Override
	public int selectCodeCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.codeTotal");
	}

	@Override
	public int selectComcodeCnt(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.comcodeTotal",comcodeDTO);
	}
	
	@Override
	public int codeInsert(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.codeInsert",codeDTO);
	}
	
	@Override
	public int codeUpdate(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("code.codeUpdate",codeDTO);
	}
	
	@Override
	public int codeDelete(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("code.codeDelete",codeDTO);
	}
	
	@Override
	public int codeDeleteAll(CodeDTO codeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("code.codeDeleteAll",codeDTO);
	}
	
	@Override
	public int comcodeInsert(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.comcodeInsert",comcodeDTO);
	}
	
	@Override
	public int comcodeUpdate(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("code.comcodeUpdate",comcodeDTO);
	}
	
	@Override
	public int comcodeDelete(ComcodeDTO comcodeDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("code.comcodeDelete",comcodeDTO);
	}

	//차량 대분류
	@Override
	public List<CodeDTO> selectAlltype() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.selectAlltype");
	}
	
	//차량 대분류에 따른 중분류(차량이름)
	@Override
	public List<ComcodeDTO> selectAllCar(ComcodeDTO comcodeDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.selectAllCar",comcodeDTO);
	}



	@Override
	public List<ComcodeDTO> selectAllfuel() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.selectAllfuel");
	}

	@Override
	public List<ProductInfoDTO> selectCarDD(ProductInfoDTO prductinfoDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.selectCarDD",prductinfoDTO);
	}
}
