package org.mera.domain;

import lombok.Data;

@Data
public class SearchVO {

	private String searchType;
	private String keyword;
	private String startDate;
	private String endDate;
}


