package org.mera.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {

	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int total;
	private Criteria cri;

	public PageMaker(Criteria cri, int total) {  // PageMaker는 생성자를 정의하고 Criteria와 전체 데이터 수(total)를 파라미터로 지정

		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5;

		this.startPage = this.endPage - 4;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;
	}

}