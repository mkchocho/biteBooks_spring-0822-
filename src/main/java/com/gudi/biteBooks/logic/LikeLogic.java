package com.gudi.biteBooks.logic;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.LikeDao;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class LikeLogic {
    Logger logger = LoggerFactory.getLogger(LikeLogic.class);
    @Autowired
    private LikeDao likeDao = null;

    public int likeInsert(Map<String, Object> pMap) {
        log.info("좋아요-Logic-Insert");
        int result=0;
        result = likeDao.likeInsert(pMap);
        return result;
    }

    public int likeDelete(Map<String, Object> pMap) {
        log.info("좋아요-Logic-Delete");
        int result=0;
        result = likeDao.likeDelete(pMap);
        return result;
    }

    public List<Map<String, Object>> likeSelect(Map<String, Object> pMap) {
        List<Map<String,Object>> likeSelect = null;
        likeSelect = likeDao.likeSelect(pMap);
        return likeSelect;
    }

    //insert method here 

}
