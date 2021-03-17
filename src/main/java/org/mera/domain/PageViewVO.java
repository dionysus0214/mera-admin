package org.mera.domain;

import lombok.Data;

@Data
public class PageViewVO {
    private String stat_date;
    private String api_cd;
    private String api_nm;
    private int tot_cnt;
}
