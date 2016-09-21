package com.scau.bess.entity;

public class ProductEntity {
	
	private int productId;
	private String productName;
	private String model;
	private String standard;
	private String element;
	private String classification;
	private String style;
	private String amount;
	private String place;
	private String price;
	private String releaseDate;
	private String url;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getElement() {
		return element;
	}
	public void setElement(String element) {
		this.element = element;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", model=" + model + ", standard="
				+ standard + ", element=" + element + ", classification=" + classification + ", style=" + style
				+ ", amount=" + amount + ", place=" + place + ", price=" + price + ", releaseDate=" + releaseDate
				+ ", url=" + url + "]";
	}
	
	
}
