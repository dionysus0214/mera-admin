package org.mera.service;

import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.mera.controller.StatisticController;
import org.mera.domain.*;
import org.mera.dto.LoginDTO;
import org.mera.mapper.TestViewMapper;
import org.mera.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class TestViewServiceImpl implements TestViewService {

    private static final Logger logger = LoggerFactory.getLogger(TestViewServiceImpl.class);

    private TestViewMapper mapper;

    // @Override 
    // public void register(TestViewVO board) {

    //     log.info("register......" + board);

    //     mapper.insertSelectKey(board);
    // }

    // @Override 
    // public TestViewVO get(Long bno) {

    //     log.info("get......" + bno);

    //     return mapper.read(bno);

    // }

    // @Override 
    // public boolean modify(TestViewVO board) {

    //     log.info("modify......" + board);

    //     return mapper.update(board) == 1;
    // }

    // @Override 
    // public boolean remove(Long bno) {

    //     log.info("remove...." + bno);

    //     return mapper.delete(bno) == 1;
    // }

    @Override 
    public List<TestViewVO> getList() {
        return mapper.getList();
    }

    // @Override 
    // public List<TestViewVO> getList(Criteria cri) {

    //     log.info("get List with criteria: " + cri);

    //     return mapper.getListWithPaging(cri);
    // }

    // @Override 
    // public int getTotal(Criteria cri) {

    //     log.info("get total count");
    //     return mapper.getTotalCount(cri);
    // }

}