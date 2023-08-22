package com.gudi.biteBooks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

    @GetMapping("{contentType}")
    public String getContent(@PathVariable String contentType, Model model) {

        return "mypage/"+contentType; // 해당하는 JSP 파일의 경로를 반환
    }
}