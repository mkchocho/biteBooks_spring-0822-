package com.gudi.biteBooks.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookDao {
    Logger logger = LoggerFactory.getLogger(BookDao.class);
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> bookList(Map<String, Object> pMap) {
        List<Map<String, Object>> bList = null;
        bList = sqlSessionTemplate.selectList("bookList", pMap);
        return bList;
    }
    public List<Map<String, Object>> bookListDate(Map<String, Object> pMap) {
        List<Map<String, Object>> bList = null;
        bList = sqlSessionTemplate.selectList("bookListDate", pMap);
        return bList;
    }
    public List<Map<String, Object>> epList(Map<String, Object> pMap) {
        List<Map<String, Object>> bList = null;
        bList = sqlSessionTemplate.selectList("epList", pMap);
        return bList;
    }

    //insert method here 

}
