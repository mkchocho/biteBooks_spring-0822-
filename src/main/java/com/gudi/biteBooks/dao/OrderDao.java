package com.gudi.biteBooks.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class OrderDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> orderList(Map<String, Object> pMap) {
        List<Map<String, Object>> oList = null;
        oList = sqlSessionTemplate.selectList("orderList", pMap);
        return oList;
    }

    public int orderInsert(List<Map<String, Object>> pList) {
        int result =0;
        result=sqlSessionTemplate.insert("orderInsert", pList);
        return result;

    }

    public int insertFromDetail(Map<String, Object> pMap) {
        int result =0;
        result=sqlSessionTemplate.insert("insertFromDetail", pMap);
        return result;
    }
}
