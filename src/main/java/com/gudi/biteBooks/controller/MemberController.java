package com.gudi.biteBooks.controller;

import com.gudi.biteBooks.vo.MailVO;
import com.gudi.biteBooks.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.gudi.biteBooks.logic.MemberLogic;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/member/*")
public class MemberController {
    Logger logger = LoggerFactory.getLogger(MemberController.class);
    @Autowired
    private MemberLogic memberLogic = null;

    @GetMapping("memberList")
    public String memberList(@RequestParam Map<String, Object> pMap, Model model){
        List<Map<String,Object>> mList = null;
        mList = memberLogic.memberList(pMap);
        model.addAttribute("mList", mList);
        return "member/memberList";
    }

    @PostMapping("memberInsert")
    public String memberInsert(@RequestParam Map<String, Object> pMap, Model model){
        String userName = null;
        userName = memberLogic.memberInsert(pMap);
        logger.info(userName);
        model.addAttribute("m_name", userName);
        return "member/signUpSuccess";
    }

/*    @PostMapping("memberUpdate")
    public String memberUpdate(@RequestBody Map<String, Object> pMap){
        int result = -1;
        result = memberLogic.memberUpdate(pMap);
        logger.info(String.valueOf(result));

        return "redirect:memberList.jsp";
    }*/

    @GetMapping("memberDelete")
    public String memberDelete(@RequestParam Map<String, Object> pMap){
        int result = -1;
        result = memberLogic.memberDelete(pMap);
        logger.info("controller"+String.valueOf(result));
        return "redirect:memberList.jsp";
    }

    @PostMapping("checkEmail")
    @ResponseBody
    public boolean checkEmail(@RequestBody MemberVO mVO) {
        logger.info("checkEmail 호출!");
        int result = -1;
        boolean check = false;
        result = memberLogic.checkEmail(mVO);
        logger.info("Result" + result);
        if (result > 0) {
            check = true; // 1이상이란 말, 이미 아이디가 존재한다는 말이라서 사용이 안된다
        } else {
            check = false;
        }
        return check;
    }

    @PostMapping("checkNickname")
    @ResponseBody
    public Map<String, Object> checkNickname(@RequestBody Map<String, Object> pMap) {
        logger.info("checkNickname 호출!");
        int result = -1;
        Map<String, Object> response = new HashMap<>();
        result = memberLogic.checkNickname(pMap);
        logger.info("result!!!!!!!! : " + result);
        if (result > 0) {
            response.put("check", true); // 1이상이란 말, 이미 아이디가 존재한다는 말이라서 사용이 안된다
        } else {
            response.put("check", false);
        }
        return response;
    }

    @PostMapping("checkPassword")
    @ResponseBody
    public Map<String, Object> checkPassword(@RequestBody Map<String, Object> pMap, HttpSession session) {
        logger.info("checkPassword 호출!");
        String userId = (String) session.getAttribute("m_id");
        String inputPw = (String)pMap.get("password"); // 클라이언트에서 보낸 비밀번호

        int result = -1;
        Map<String, Object> cPass = new HashMap<>();
        cPass.put("m_id", userId);
        cPass.put("m_pw", inputPw);
        result = memberLogic.checkPassword(cPass);

        cPass = new HashMap<>();
        cPass.put("check", result);
        logger.info("결과!!!!!" + cPass);
        return cPass;
    }
//////////////////////////////////////여기 뭔가 어지러움 리팩토링 필요///////////////////////////////////
    @PostMapping("updateMember")
    @ResponseBody
    public Map<String, Object> updateMember (@RequestBody Map<String, Object> pMap, HttpSession session){
        logger.info("회원정보변경 컨트롤러 호출!");
        String userId = (String) session.getAttribute("m_id");
        //String userId = (String)pMap.get("m_id"); 포스트맨 테스트용
        String fieldType = (String)pMap.get("type");
        String inputValue = null;
        if (fieldType != null) {
            inputValue = (String) pMap.get(fieldType);
        }
        int result = -1;
        Map<String, Object> cInfo = new HashMap<>();
        cInfo.put("m_id", userId);
        cInfo.put(fieldType, inputValue);
        result = memberLogic.updateMember(cInfo);
        Map<String, Object> userInfo = memberLogic.getInfo(cInfo);

        cInfo = new HashMap<>();
        if (result == 1 ){
            String newInfo = userInfo.get(fieldType).toString();
            session.setAttribute(fieldType, newInfo);
            cInfo.put("status", "updated");
            cInfo.put("newInfo", newInfo);
        } else {
            cInfo.put("status", "exist");
        }
        return cInfo;
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////
    @PostMapping("loginCheck")
    public String loginCheck(@RequestParam Map<String, Object> pMap , HttpSession session, RedirectAttributes rab) {
        Map<String, Object> user =  null;
        user = memberLogic.loginCheck(pMap);
        if (user != null && !user.isEmpty()) {
            // 로그인 성공
            session.setAttribute("member", user.toString());
            session.setAttribute("m_name", user.get("m_name").toString());
            session.setAttribute("m_id", user.get("m_id").toString());
            session.setAttribute("m_email", user.get("m_email").toString());
            session.setAttribute("m_admin", user.get("m_admin").toString());
            session.setAttribute("m_nickname", user.get("m_nickname").toString());
            return "redirect:/book/main"; // 로그인 성공 페이지로 리다이렉트
        } else {
            // 로그인 실패
            rab.addFlashAttribute("errorMessageLogin", "이메일 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:login"; // 로그인 폼 페이지로 다시 돌아감
        }
    }

    @PostMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/book/main";
    }

    @PostMapping("findEmail")
    public String findEmail(@RequestParam Map<String, Object> pMap, Model model, HttpSession session) {
        logger.info("이메일찾기 호출");
        Map<String, Object> email = null;
        email = memberLogic.findEmail(pMap);
        if (email != null && !email.isEmpty()) {
            model.addAttribute("m_email", email.get("m_email").toString());
            return "member/findAccount";
        } else {
            session.setAttribute("errorMessage", "입력하신 정보와 일치하는 이메일이 없습니다.");
            return "redirect:findAccount";
        }
    }

    @PostMapping("sendEmail")
    public String sendEmail(@RequestParam Map<String, Object> pMap, HttpSession session) {
        MailVO mvo = memberLogic.createMailAndChangePassword(pMap);
        if (mvo != null) {
            memberLogic.mailSend(mvo);
            session.setAttribute("successMessage", "비밀번호가 초기화 되었습니다.\\n임시 비밀번호가 메일로 전송 되었습니다.");
            return "member/findAccount";
        } else {
            session.setAttribute("errorMessage", "올바른 정보를 입력해주세요.");
            return "member/findAccount";
        }
    }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //WEB-INF/views/ 아래 jsp들 호출하는 메소드
    @GetMapping(value = "signUp")
    public String test(@RequestParam Map<String, Object> pMap, Model model) {
        String insertEmail = (String) pMap.get("m_email");
        model.addAttribute("m_email", insertEmail);
        return "member/signUp";
    }

    @GetMapping("login")
    public String test2() {
        return "member/login";
    }

    @GetMapping("findAccount")
    public String test3() {
        return "member/findAccount";
    }


}
