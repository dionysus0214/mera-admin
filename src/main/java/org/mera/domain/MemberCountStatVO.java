package org.mera.domain;

import lombok.Data;

@Data
public class MemberCountStatVO {

    private String day;
    private int tot_cnt;
    private int google_cnt;
    private int facebook_cnt;
}
