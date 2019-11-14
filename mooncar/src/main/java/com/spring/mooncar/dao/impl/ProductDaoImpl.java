package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.ProductDao;
import com.spring.mooncar.dto.ProductInfoDTO;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductInfoDTO> selectProductInfo1(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		
		if(productInfoDTO.getPrdCtgr()==null || productInfoDTO.getPrdCtgr().equals("ALL")) {
			return sqlSession.selectList("product.productInfoListAll1",productInfoDTO);
		}else {
			return sqlSession.selectList("product.productInfoList1",productInfoDTO);
		}
	}
	
	@Override
	public List<ProductInfoDTO> selectProductInfo(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		
		if(productInfoDTO.getPrdCtgr()==null || productInfoDTO.getPrdCtgr().equals("ALL")) {
			return sqlSession.selectList("product.productInfoListAll",productInfoDTO);
		}else {
			return sqlSession.selectList("product.productInfoList",productInfoDTO);
		}
	}
	
	@Override
	public ProductInfoDTO selectProductInfoView(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.productInfoView",productInfoDTO);
	}
	
	@Override
	public int selectProductCnt(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		if(productInfoDTO.getPrdCtgr()==null || productInfoDTO.getPrdCtgr().equals("ALL")) {
			return sqlSession.selectOne("product.productTotalAll",productInfoDTO);
		}else {
			return sqlSession.selectOne("product.productTotal",productInfoDTO);
		}
		
	}
	
	@Override
	public int productInfoInsert(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.productInfoInsert",productInfoDTO);
	}
	
	@Override
	public int productInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("product.productInfoUpdate",productInfoDTO);
	}
	
	@Override
		public int productInfoDelete(ProductInfoDTO productInfoDTO) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.delete("product.productInfoDelete",productInfoDTO);
		}
	
	@Override
	public int FileNameUpdate(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("product.fileNameUpdate",productInfoDTO);
	}

}
