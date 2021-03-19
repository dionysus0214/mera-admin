package org.mera.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; 
	private int amount;

	private String category;
	private String keyword;
	private String startDate;
	private String endDate;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.startDate = "20210312";
		this.endDate = "20210319";
	}

	public int getStartPage() {
		return (this.pageNum - 1) * amount;
	}

	public String[] getTypeArr() {
		return category == null ? new String[] {} : category.split("");
	}

}