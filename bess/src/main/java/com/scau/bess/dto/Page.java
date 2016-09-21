package com.scau.bess.dto;

import java.util.List;

public class Page<T> {

	private int current = 1;
	private int start = 0;
	private int size = 6;
	private int code;
	private String condition;
	private List<T> target;
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public List<T> getTarget() {
		return target;
	}
	public void setTarget(List<T> target) {
		this.target = target;
	}
	@Override
	public String toString() {
		return "Page [current=" + current + ", start=" + start + ", size="
				+ size + ", code=" + code + ", condition=" + condition
				+ ", target=" + target + "]";
	}

	
}
