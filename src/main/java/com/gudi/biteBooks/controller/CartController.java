package com.gudi.biteBooks.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gudi.biteBooks.logic.CartLogic;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cart/*")
public class CartController {
    @Autowired
    private CartLogic cartLogic = null;
        
    //insert method here 
/*     @GetMapping("/cartList")
    public String cartList(@RequestParam(value = "tab", defaultValue = "collect") String tab, Model model) {
        model.addAttribute("tab", tab);
        return "payment/cart";
    } */

        @GetMapping("cartList")
    public String cartList(@RequestParam Map<String, Object> pMap, Model model){
        log.info("장바구니 목록 조회 요청");
        List<Map<String,Object>> cList = null;
        cList = cartLogic.cartList(pMap);
        model.addAttribute("cList", cList);
        return "payment/cart";
    }
}
