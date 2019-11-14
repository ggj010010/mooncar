package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.ProductInfoDTO;

public interface ProductDao {

	public List<ProductInfoDTO> selectProductInfo(ProductInfoDTO productInfoDTO) throws Exception;

	public int productInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;

	public int FileNameUpdate(ProductInfoDTO productInfoDTO) throws Exception;

	public ProductInfoDTO selectProductInfoView(ProductInfoDTO productInfoDTO) throws Exception;

	public int productInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception;

	public int productInfoDelete(ProductInfoDTO productInfoDTO) throws Exception;

	public int selectProductCnt(ProductInfoDTO productInfoDTO) throws Exception;

	public List<ProductInfoDTO> selectProductInfo1(ProductInfoDTO productInfoDTO) throws Exception;

}
