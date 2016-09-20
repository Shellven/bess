package com.scau.bess.entity;

public class AuthorityEntity {
	
	private int authorityId;
	private String authorityName;
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
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
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
		return "AuthorityEntity [authorityId=" + authorityId + ", authorityName=" + authorityName
				+ ", authorityContent=" + authorityContent + ", authorityLevel=" + authorityLevel + ", result=" + result
				+ "]";
	}
	
}

