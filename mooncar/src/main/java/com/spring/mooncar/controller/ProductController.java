package com.spring.mooncar.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.common.CommonUtil;
import com.spring.mooncar.HomeController;
import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.ProductInfoDTO;
import com.spring.mooncar.service.CodeService;
import com.spring.mooncar.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	CodeService codeService;
	@Autowired
	ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value= "/product/productInfo", method = RequestMethod.GET)
	public String productInfo(Locale locale, Model model 
		,HttpServletRequest request	
		) throws Exception{
		
		ComcodeDTO comcodeDTO = new ComcodeDTO();
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		String prdCtgr = (String)request.getParameter("prdCtgr");
		String codeType = (String)request.getParameter("codeType");
		
		int pageNo =1;
		int totalCnt =0;
		int thisPage = 0;
		if(prdCtgr == null) {
			prdCtgr = "ALL";
		}
		if(codeType == null) {
			codeType = "sedan";
		}
		
		if(productInfoDTO.getPageNo() <=0) {
			productInfoDTO.setPageNo(pageNo);
		}
		thisPage = productInfoDTO.getPageNo();
		System.out.println("pageNo : " + productInfoDTO.getPageNo());
		
		List<CodeDTO> codeList1 = new ArrayList<CodeDTO>();
		codeList1 = codeService.selectCodeList1();
		
		comcodeDTO.setCodeType(codeType);
		
		List<ComcodeDTO> comcodeList1 = new ArrayList<ComcodeDTO>();		
		comcodeList1 = codeService.selectComcodeList1(comcodeDTO);
		productInfoDTO.setCodeType(codeType);
		
		List<ProductInfoDTO> productInfoList = new ArrayList<ProductInfoDTO>();
		List<ProductInfoDTO> productInfoList1 = new ArrayList<ProductInfoDTO>();
		
		productInfoList = productService.selectProductInfo(productInfoDTO);
		productInfoList1 = productService.selectProductInfo1(productInfoDTO);
		totalCnt = productService.selectProductCnt(productInfoDTO);
		
//		DecimalFormat decimalFormat = new DecimalFormat("#,###");
//		for (ProductInfoDTO productInfoDTO2 : productInfoList) {
//			if(null != productInfoDTO.getPrdPrc() || "".equals(productInfoDTO.getPrdPrc())) {
//				productInfoDTO2.setPrdPrc(decimalFormat.format(Integer.parseInt(productInfoDTO2.getPrdPrc())));
//			}
//		}
//		
		
		model.addAttribute("codeList1",codeList1);
		model.addAttribute("comcodeList1",comcodeList1);
		model.addAttribute("productInfoList",productInfoList);
		model.addAttribute("productInfoList1",productInfoList1);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("prdCtgr",prdCtgr);
		model.addAttribute("codeType",codeType);
		
		return "/product/productInfo";

	}
	
	@RequestMapping(value= "/product/{pageNo}/productInfo", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public String productInfoPage(Locale locale, Model model
			,HttpServletRequest request	
			,@PathVariable("pageNo") int thisNo) throws Exception{
		ComcodeDTO comcodeDTO = new ComcodeDTO();
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		String prdCtgr = (String)request.getParameter("prdCtgr");
		String codeType = (String)request.getParameter("codeType");
		
		int pageNo =thisNo;
		int totalCnt =0;
		int thisPage = 0;
		
		if(productInfoDTO.getPageNo() <=0) {
			productInfoDTO.setPageNo(pageNo);
		}
		thisPage = productInfoDTO.getPageNo();
		System.out.println("pageNo : " + productInfoDTO.getPageNo());
		
		List<CodeDTO> codeList1 = new ArrayList<CodeDTO>();
		codeList1 = codeService.selectCodeList1();
		
		comcodeDTO.setCodeType(codeList1.get(0).getCodeType().toString());
		
		List<ComcodeDTO> comcodeList1 = new ArrayList<ComcodeDTO>();		
		comcodeList1 = codeService.selectComcodeList1(comcodeDTO);
		productInfoDTO.setCodeType(comcodeList1.get(0).getCodeType().toString());
		
		List<ProductInfoDTO> productInfoList = new ArrayList<ProductInfoDTO>();
		List<ProductInfoDTO> productInfoList1 = new ArrayList<ProductInfoDTO>();
		
		productInfoList = productService.selectProductInfo(productInfoDTO);
		productInfoList1 = productService.selectProductInfo1(productInfoDTO);
		totalCnt = productService.selectProductCnt(productInfoDTO);
		
		model.addAttribute("codeList1",codeList1);
		model.addAttribute("comcodeList1",comcodeList1);
		model.addAttribute("productInfoList",productInfoList);
		model.addAttribute("productInfoList1",productInfoList1);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("prdCtgr",prdCtgr);
		model.addAttribute("codeType",codeType);
		
		return "/product/productInfo";

	}
//	
//	@RequestMapping(value= "/product/productInfoBack", method = RequestMethod.GET, produces = "application/json; charset=utf8")
//	public String productBackInfo(Locale locale, Model model,ProductInfoDTO productInfoDTO ) throws Exception{
//		ComcodeDTO comcodeDTO = new ComcodeDTO();
//		
//		List<CodeDTO> codeList1 = new ArrayList<CodeDTO>();
//		codeList1 = codeService.selectCodeList1();
//		
//		comcodeDTO.setCodeType(codeList1.get(0).getCodeType().toString());
//		
//		List<ComcodeDTO> comcodeList1 = new ArrayList<ComcodeDTO>();		
//		comcodeList1 = codeService.selectComcodeList1(comcodeDTO);
//
//		System.out.println(productInfoDTO.getPrdCtgr());
//		List<ProductInfoDTO> productInfoList = new ArrayList<ProductInfoDTO>();
//		productInfoList = productService.selectProductInfo(productInfoDTO);
//		
//		model.addAttribute("codeList1",codeList1);
//		model.addAttribute("comcodeList1",comcodeList1);
//		model.addAttribute("productInfoList",productInfoList);
//		
//		
//		return "/product/productInfo";
//	}
	
	@RequestMapping(value= "/product/comcodeAction", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String productComcodeAction(Locale locale, Model model,ComcodeDTO comcodeDTO) throws Exception{

		List<ComcodeDTO> comcodeList1 = new ArrayList<ComcodeDTO>();		
		comcodeList1 = codeService.selectComcodeList1(comcodeDTO);
		
		model.addAttribute("comcodeList1",comcodeList1);
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		result.put("success", comcodeList1);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value= "/product/productInfoAction", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String productInfoAction(Locale locale, Model model,ProductInfoDTO productInfoDTO) throws Exception{

		int pageNo = productInfoDTO.getPageNo();
		int totalCnt =0;
		int thisPage = 0;
		
		if(productInfoDTO.getPageNo() <=0) {
			productInfoDTO.setPageNo(1);
		}
		thisPage = productInfoDTO.getPageNo();
		System.out.println("pageNo : " + productInfoDTO.getPageNo());
		
		List<ProductInfoDTO> productInfoList = new ArrayList<ProductInfoDTO>();
		List<ProductInfoDTO> productInfoList1 = new ArrayList<ProductInfoDTO>();
		if(productInfoDTO.getPrdCtgr()=="ALL") {
			productInfoDTO.setPrdCtgr("*");
		}
		productInfoList = productService.selectProductInfo(productInfoDTO);
		productInfoList1 = productService.selectProductInfo1(productInfoDTO);
		totalCnt = productService.selectProductCnt(productInfoDTO);
		
		model.addAttribute("productInfoList",productInfoList);
		model.addAttribute("productInfoList1",productInfoList1);
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		result.put("success", productInfoList);
		result.put("success1", productInfoList1);
		result.put("totalCnt",totalCnt);
		result.put("pageNo",pageNo);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
//	@RequestMapping(value= "/product/productInfoActionBack", method = RequestMethod.GET, produces = "application/json; charset=utf8")
////	@ResponseBody
//	public String productInfoActionBack(Locale locale, Model model,ProductInfoDTO productInfoDTO) throws Exception{
//
//		List<ProductInfoDTO> productInfoList = new ArrayList<ProductInfoDTO>();
//		if(productInfoDTO.getPrdCtgr()=="ALL") {
//			productInfoDTO.setPrdCtgr("*");
//		}
//		productInfoList = productService.selectProductInfo(productInfoDTO);
//		
//		model.addAttribute("productInfoList",productInfoList);
//		HashMap<String, Object> result = new HashMap<String, Object>();
//		CommonUtil commonUtil = new CommonUtil();
//		
//		result.put("success", productInfoList);
//		
//		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
//		
//		System.out.println("callbackMsg::"+callbackMsg);
//		
//		return "product/productInfo";
//	}
	
	@RequestMapping(value="/product/{prdIdx}/productInfoView", method = {RequestMethod.POST,RequestMethod.GET}, produces = "application/json; charset=utf8")
	public String productInfoView(Locale locale, Model model,@PathVariable("prdIdx")int prdIdx) throws Exception{
		ProductInfoDTO productInfoView = new ProductInfoDTO();
		ComcodeDTO comcodeDTOView = new ComcodeDTO();
		
		productInfoView = productService.selectProductInfoView(prdIdx);
		comcodeDTOView = codeService.selectComcodeView(productInfoView.getPrdCtgr());
		model.addAttribute("productInfoView",productInfoView);
		model.addAttribute("comcodeDTOView",comcodeDTOView);
		
		return"/product/productInfoView";
	}
	
	@RequestMapping(value= "/product/{codeType}/{prdCtgr}/productInfoWrite", method = {RequestMethod.POST,RequestMethod.GET}, produces = "application/json; charset=utf8")
//	@ResponseBody
	public String productInfoWrite(Locale locale, Model model
			,@PathVariable("codeType")String codeType,@PathVariable("prdCtgr")String prdCtgr) throws Exception{

		
		ComcodeDTO comcodeDTO = new ComcodeDTO();
		comcodeDTO.setCodeType(codeType);
		
		
		List<ComcodeDTO> comcodeList1 = new ArrayList<ComcodeDTO>();		
		comcodeList1 = codeService.selectComcodeList1(comcodeDTO);
		
		model.addAttribute("comcodeList1",comcodeList1);
		model.addAttribute("thisCodeType", comcodeList1.get(0).getCodeType().toString());
		model.addAttribute("thisPrdCtgr", prdCtgr);
		
//		return callbackMsg;
		return "/product/productInfoWrite";
	}
	
	@RequestMapping(value = "/product/productInfoWriteAction", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String productInfoWriteAction(Locale locale,ProductInfoDTO productInfoDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		System.out.println(productInfoDTO.getPrdCtgr());
		int resultCnt = productService.productInfoInsert(productInfoDTO);
		
		System.out.println(productInfoDTO.getPrdIdx());
		result.put("success", (resultCnt > 0)?"Y":"N");
		result.put("prdIdx",Integer.toString(productInfoDTO.getPrdIdx()));
		result.put("prdCtgr",productInfoDTO.getPrdCtgr());
		result.put("codeType", productInfoDTO.getCodeType());
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/product/{prdIdx}/productInfoUpdate", method = {RequestMethod.POST,RequestMethod.GET}, produces = "application/json; charset=utf8")
	public String productInfoUpdate(Locale locale, Model model,@PathVariable("prdIdx")int prdIdx) throws Exception{
		ProductInfoDTO productInfoUpdate = new ProductInfoDTO();
		productInfoUpdate = productService.selectProductInfoView(prdIdx);
		
		model.addAttribute("productInfoUpdate",productInfoUpdate);
		
		return"/product/productInfoUpdate";
	}
	
	@RequestMapping(value = "/product/productInfoUpdateAction", method = {RequestMethod.POST,RequestMethod.GET}, produces = "application/json; charset=utf8")
	@ResponseBody
	public String productInfoUpdateAction(Locale locale,ProductInfoDTO productInfoDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = productService.productInfoUpdate(productInfoDTO);
		
		System.out.println(productInfoDTO.getPrdIdx());
		result.put("success", (resultCnt > 0)?"Y":"N");
		result.put("prdIdx",Integer.toString(productInfoDTO.getPrdIdx()));
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/product/productInfoDelete",method = {RequestMethod.GET}, produces = "application/json; charset=utf8")
	@ResponseBody
	public String productInfoDelete(Locale locale,ProductInfoDTO productInfoDTO) throws Exception{
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		ProductInfoDTO productInfoView = new ProductInfoDTO();
		productInfoView = productService.selectProductInfoView(productInfoDTO.getPrdIdx());
		int resultCnt = productService.productInfoDelete(productInfoDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		result.put("codeType",productInfoView.getCodeType());
		result.put("prdCtgr",productInfoView.getPrdCtgr());
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/product/{prdIdx}/fileUpload", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String fileUpload(MultipartHttpServletRequest multi,@PathVariable("prdIdx") int prdIdx) throws Exception {
		
		String root = multi.getSession().getServletContext().getRealPath("/");
		System.out.println("root :: "+root);
		String path = "C:/il/springBoard/WebContent/resources/productInfoFileUpload/";
		System.out.println("path :: "+path);
		
		String fileReName = "";
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		String callbackMsg = "";
		
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
			System.out.println("dir :: "+dir);
		}
		
		Iterator<String> files = multi.getFileNames();
        
		while(files.hasNext()) {
            String uploadFile = files.next();
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            fileReName = prdIdx+"_"+fileName;
            System.out.println("fileReName : " +fileReName);

            try {
                mFile.transferTo(new File(path+fileReName));
                result.put("success","Y");
                result.put("fileName", fileReName);
                result.put("prdIdx",Integer.toString(prdIdx));
                
            } catch (Exception e) {
                e.printStackTrace();
                result.put("success","N");
                
            }
		}
            
        
        callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		return callbackMsg;
	}
	
	@RequestMapping(value = "/product/fileRemove", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String fileRemove(Locale locale,ProductInfoDTO productInfoDTO) throws Exception {
		String path = "C:/il/springBoard/WebContent/resources/productInfoFileUpload/";
		System.out.println("path :: "+path);
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		String callbackMsg = "";
		
		System.out.println(productInfoDTO.getPrdImg());
		File fileRemove = new File(path+productInfoDTO.getPrdImg());
		
		if(fileRemove.delete()) {
			result.put("success","Y");
		}else {
			result.put("success","N");
		}
		
		callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		return callbackMsg;
	}
	
	@RequestMapping(value = "/product/{prdIdx}/{fileName}/fileNameUpdate", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String fileNameUpdate(Locale locale
			,@PathVariable("prdIdx") int prdIdx
			,@PathVariable("fileName") String fileName) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		ProductInfoDTO productInfoView = new ProductInfoDTO();
		productInfoView = productService.selectProductInfoView(prdIdx);
		int resultCnt = productService.fileNameUpdate(prdIdx, fileName);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		result.put("prdIdx", Integer.toString(prdIdx));
		result.put("codeType",productInfoView.getCodeType());
		result.put("prdCtgr",productInfoView.getPrdCtgr());
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
}
