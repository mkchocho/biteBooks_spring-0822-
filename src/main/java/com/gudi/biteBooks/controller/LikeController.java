package com.gudi.biteBooks.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gudi.biteBooks.logic.LikeLogic;

import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/like/*")
public class LikeController {
    @Autowired
    private LikeLogic likeLogic = null;
            
    //insert method here
    @PostMapping("heart")
    public void toggleLike(@RequestBody Map<String, Object> pMap, Model model) {
        log.info("좋아요-Controller");
        log.info(pMap.toString());
        int result = 0;
        boolean isLiked = (boolean)pMap.get("liked");
        if(isLiked){
            result = likeLogic.likeInsert(pMap);
        }else{
            result = likeLogic.likeDelete(pMap);
        }


//        boolean isLiked = payload.get("liked");
//        log.info(String.valueOf(isLiked));
        // 여기서 isLiked 값에 따라 데이터베이스 업데이트 등의 로직을 수행합니다.
    }
}
