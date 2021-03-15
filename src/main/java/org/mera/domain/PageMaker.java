package org.mera.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {

	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int totalCount;
	private Criteria cri;

	public PageMaker(Criteria cri, int totalCount) {

    this.cri = cri;
    this.totalCount = totalCount;

    this.endPage = (int) (Math.ceil(cri.getPerPageNum() / 10.0)) * 10;

    this.startPage = this.endPage - 9;

    int realEnd = (int) (Math.ceil((totalCount * 1.0) / cri.getAmount()));

    if (realEnd <= this.endPage) {
      this.endPage = realEnd;
    }

    this.prev = this.startPage > 1;

    this.next = this.endPage < realEnd;
  }

}