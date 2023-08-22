package com.gudi.biteBooks.controller;

import com.gudi.biteBooks.logic.BookLogic;
import com.gudi.biteBooks.logic.LikeLogic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book/*")
public class BookController {
    Logger logger = LoggerFactory.getLogger(BookController.class);
    
    @Autowired
    private BookLogic bookLogic = null;
    @Autowired
    private LikeLogic likeLogic = null;

    //insert method here
    @GetMapping("main")
    public String bookList(@RequestParam Map<String,Object> pMap, Model model) {
        List<Map<String,Object>> bList = null;
        bList = bookLogic.bookList(pMap);
        model.addAttribute("bList", bList);
        bList = bookLogic.bookListDate(pMap);
        model.addAttribute("bListDate", bList);
        return "book/main";
        //redirect: , forward: 가 붙어있지 않으면 /WEB-INF/views/ + "" + .jsp 로 이동시킴

    }

    @GetMapping("detail")
    public String bookDetail(@RequestParam Map<String,Object> pMap, Model model, HttpSession session){
        // 세션에서 user id 가져오기
        String userId = null;
        if(session.getAttribute("m_id") != null) {
            userId = (String)session.getAttribute("m_id");
            // pMap에 user id 추가
            pMap.put("m_id", userId);
        }
//--------------상세조회 로드 시 로그인 여부에 따라 좋아요 여부 가져오기------------------
        List<Map<String,Object>> bList = null;
        bList = bookLogic.bookList(pMap);
        model.addAttribute("bList",bList);
        if(userId != null) {
            List<Map<String, Object>> likeSelect = null;
            likeSelect = likeLogic.likeSelect(pMap);
            model.addAttribute("likeSelect", likeSelect);
        }

//---------------에피소드 정보 가져오기-----------------------
        List<Map<String,Object>> epList = null;
        epList = bookLogic.epList(pMap);
        model.addAttribute("epList", epList);
        return "book/detail";
    }

    @GetMapping("search")
    public String bookSearch(){
        return "book/search";
    }
}
