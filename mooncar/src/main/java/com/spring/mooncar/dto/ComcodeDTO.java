package com.spring.mooncar.dto;

public class ComcodeDTO {
	private String codeId;
	private String codeType;
	private String codeName;
	private String codeComment;
	private int totalCnt;
	private int pageNo;
	
	
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	
	public String getCodeComment() {
		return codeComment;
	}
	public void setCodeComment(String codeComment) {
		this.codeComment = codeComment;
	}
}
