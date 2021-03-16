package org.mera.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	private int pageNum; // 현재 페이지 번호
	private int amount; // 페이지에서 보여주는 데이터 수

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getStartPage() {
		return (this.pageNum - 1) * amount;
	}
}