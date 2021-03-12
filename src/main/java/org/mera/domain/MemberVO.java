package org.mera.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class MemberVO {

    private String userid;
    private String userpw;
    private String userName;
    private String use_yn;
//    private Date reg_dt;
//    private Date upd_dt;

    private List<AuthVO> authList;

}
