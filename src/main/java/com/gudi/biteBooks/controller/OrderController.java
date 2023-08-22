package com.gudi.biteBooks.controller;

import java.util.List;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.gudi.biteBooks.logic.OrderLogic;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("/order/*")
public class OrderController {
    Logger logger = LoggerFactory.getLogger(OrderController.class);
    @Autowired
    private OrderLogic orderLogic = null;

        @GetMapping("orderInsert")
    public String orderInsert(@RequestParam Map<String, Object> pMap){
        int result=0;
        result= orderLogic.orderInsert(pMap);
        if(result>0){ //주문등록 성공
            return "redirect:orderList";
        }else{ //주문등록 실패
            return "redirect:order/orderFail.jsp";
        }
    }
    @PostMapping("insertFromDetail")
    public String insertFromDetail(@RequestParam Map<String,Object> pMap){
            log.info(pMap.toString());
        int result=0;
        result= orderLogic.insertFromDetail(pMap);
        if(result>0){ //주문등록 성공
            return "redirect:orderList";
        }else{ //주문등록 실패
            return "redirect:order/orderFail.jsp";
        }
    }

    @GetMapping("orderList")
    public String orderList(@RequestParam Map<String, Object> pMap, Model model){
        List<Map<String,Object>> oList = null;
        oList = orderLogic.orderList(pMap);
        model.addAttribute("oList", oList);
        return"payment/order";
    }

    @PostMapping("orderDelete")
    public void orderDelete(@RequestBody Map<String, Object> pMap, Model model){
        String str = (String)pMap.get("m_id");
        System.out.println(str);
        int m_id = Integer.parseInt(str);
        System.out.println("m_id int형변환" + m_id);


    }
}
