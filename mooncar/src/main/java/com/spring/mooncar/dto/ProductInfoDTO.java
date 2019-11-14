package com.spring.mooncar.dto;

public class ProductInfoDTO {

	private int prdIdx;
	private String prdCtgr;
	private String prdName;
	private String prdPrc;
	private String prdView;
	private String prdImg;
	private String codeType;
	private int pageNo;
	
	public int getPrdIdx() {
		return prdIdx;
	}
	public void setPrdIdx(int prdIdx) {
		this.prdIdx = prdIdx;
	}
	
	public String getPrdCtgr() {
		return prdCtgr;
	}
	public void setPrdCtgr(String prdCtgr) {
			this.prdCtgr = prdCtgr;
	}
	
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	
	public String getPrdPrc() {
		return prdPrc;
	}
	public void setPrdPrc(String prdPrc) {
		this.prdPrc = prdPrc;
	}
	
	public String getPrdView() {
		return prdView;
	}
	public void setPrdView(String prdView) {
		this.prdView = prdView;
	}
	
	public String getPrdImg() {
		return prdImg;
	}
	public void setPrdImg(String prdImg) {
		this.prdImg = prdImg;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

}
