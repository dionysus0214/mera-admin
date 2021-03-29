package org.mera.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EnvVO {
    private int rownum;
    private int seq;
    private String env_nm;
    private String env_title;
    private String env_val;
    private String use_yn;
    private Date reg_dt;
    private Date upd_dt;
}
