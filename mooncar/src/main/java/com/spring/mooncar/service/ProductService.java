package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.ProductInfoDTO;

public interface ProductService {

	List<ProductInfoDTO> selectProductInfo(ProductInfoDTO productInfoDTO) throws Exception;

	int productInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;

	int fileNameUpdate(int prdIdx, String fileName) throws Exception;

	ProductInfoDTO selectProductInfoView(int prdIdx) throws Exception;

	int productInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception;

	int productInfoDelete(ProductInfoDTO productInfoDTO) throws Exception;

	List<ProductInfoDTO> selectProductInfo1(ProductInfoDTO productInfoDTO) throws Exception;

	int selectProductCnt(ProductInfoDTO productInfoDTO) throws Exception;



}
