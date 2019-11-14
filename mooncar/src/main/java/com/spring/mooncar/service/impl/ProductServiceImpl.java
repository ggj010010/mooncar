package com.spring.mooncar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mooncar.dao.ProductDao;
import com.spring.mooncar.dto.ProductInfoDTO;
import com.spring.mooncar.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;
	
	@Override
	public List<ProductInfoDTO> selectProductInfo(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return productDao.selectProductInfo(productInfoDTO);
	}
	
	@Override
	public List<ProductInfoDTO> selectProductInfo1(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return productDao.selectProductInfo1(productInfoDTO);
	}
	
	@Override
	public ProductInfoDTO selectProductInfoView(int prdIdx) throws Exception {
		// TODO Auto-generated method stub
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		productInfoDTO.setPrdIdx(prdIdx);
		
		return productDao.selectProductInfoView(productInfoDTO);
	}
	
	@Override
	public int selectProductCnt(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return productDao.selectProductCnt(productInfoDTO);
	}
	
	@Override
	public int productInfoInsert(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return productDao.productInfoInsert(productInfoDTO);
	}
	
	@Override
	public int productInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return productDao.productInfoUpdate(productInfoDTO);
	}
	
	@Override
	public int productInfoDelete(ProductInfoDTO productInfoDTO) throws Exception {
		// TODO Auto-generated method stub
		return productDao.productInfoDelete(productInfoDTO);
	}
	
	@Override
	public int fileNameUpdate(int prdIdx, String fileName) throws Exception {
		// TODO Auto-generated method stub
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		productInfoDTO.setPrdIdx(prdIdx);
		productInfoDTO.setPrdImg(fileName);
		
		return productDao.FileNameUpdate(productInfoDTO);
	}

}
