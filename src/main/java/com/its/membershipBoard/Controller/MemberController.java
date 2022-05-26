package com.its.membershipBoard.Controller;

import com.its.membershipBoard.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 회원가입 jsp로 이동
    @GetMapping("/save")
    public String saveForm(){
        return "/member/save";
    }

    //로그인 jsp로 이동
    @GetMapping("/login")
    public String loginForm(){
        return "/member/login";
    }

    


}
