package com.gudi.biteBooks.dao;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Slf4j
@Repository
public class LikeDao {
    Logger logger = LoggerFactory.getLogger(LikeDao.class);
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;

    public int likeInsert(Map<String, Object> pMap) {
        log.info("좋아요-Dao-Insert");
        int result = 0;
        result = sqlSessionTemplate.insert("likeInsert", pMap );
        return result;
    }

    public int likeDelete(Map<String, Object> pMap) {
        log.info("좋아요-Dao-Delete");
        int result = 0;
        result = sqlSessionTemplate.insert("likeDelete", pMap );
        return result;
    }

    public List<Map<String,Object>> likeSelect(Map<String, Object> pMap) {
        List<Map<String,Object>> likeSelect = null;
        likeSelect = sqlSessionTemplate.selectList("likeSelect", pMap);
        return likeSelect;
    }

    //insert method here 

}
