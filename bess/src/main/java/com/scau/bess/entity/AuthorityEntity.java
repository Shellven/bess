package com.scau.bess.entity;

public class AuthorityEntity {
	
	private int authorityId;
	private String autName;
	private String authorityContent;
	private int authorityLevel;
	private String result;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(int authorityId) {
		this.authorityId = authorityId;
	}
	public String getAuthorityName() {
		return autName;
	}
	public void setAuthorityName(String authorityName) {
		this.autName = authorityName;
	}
	public String getAuthorityContent() {
		return authorityContent;
	}
	public void setAuthorityContent(String authorityContent) {
		this.authorityContent = authorityContent;
	}
	public int getAuthorityLevel() {
		return authorityLevel;
	}
	public void setAuthorityLevel(int authorityLevel) {
		this.authorityLevel = authorityLevel;
	}
	@Override
	public String toString() {
		return "AuthorityEntity [authorityId=" + authorityId + ", authorityName=" + autName
				+ ", authorityContent=" + authorityContent + ", authorityLevel=" + authorityLevel + ", result=" + result
				+ "]";
	}
	
}

