package com.scau.bess.entity;

public class MessageEntity {
	
	private int messageId;
	private String title;
	private String messageContent;
	private String messageType;
	private String deadline;
	private String url;
	
	
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", title=" + title + ", messageContent=" + messageContent
				+ ", messageType=" + messageType + ", deadline=" + deadline + ", url=" + url + "]";
	}
	
	
}
