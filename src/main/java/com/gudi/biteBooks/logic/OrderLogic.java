package com.gudi.biteBooks.logic;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.CartDao;
import com.gudi.biteBooks.dao.OrderDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderLogic {
    @Autowired
    private OrderDao orderDao = null;

    @Autowired
    private CartDao cartDao = null;


    public List<Map<String, Object>> orderList(Map<String, Object> pMap) {
        List<Map<String, Object>> oList = null;
        oList = orderDao.orderList(pMap);
        return oList;
    }

    public int orderInsert(Map<String,Object> pMap) {
        int result = 0;
        List<Map<String,Object>> cList = null;
        cList = cartDao.cartList(pMap);
        log.info(cList.toString());
        result = orderDao.orderInsert(cList);
        return result;
    }

    public int insertFromDetail(Map<String, Object> pMap) {
        int result = 0;
        result = orderDao.insertFromDetail(pMap);
        return result;
    }

    public int orderDelete(Map<String, Object> pMap) {
        int result=0;
        result = orderDao.orderDelete(pMap);
        return result;
    }
}
