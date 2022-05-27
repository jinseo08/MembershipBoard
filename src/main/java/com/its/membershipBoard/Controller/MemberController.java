package com.its.membershipBoard.Controller;

import com.its.membershipBoard.DTO.MemberDTO;
import com.its.membershipBoard.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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

    // 회원가입 기능 구현
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println(memberDTO);
        memberService.save(memberDTO);
        return "/member/login";
        }

    //아이디 중복체크
    @PostMapping("/idCheck")
    public @ResponseBody String idCheck(@RequestParam String memberId){
        String checkResult = memberService.idCheck(memberId);
        return checkResult;
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        MemberDTO loginResult = memberService.login(memberDTO);
        if(loginResult != null) {
            model.addAttribute("memberLogin",loginResult);
            session.setAttribute("memberId",loginResult.getMemberId());
            session.setAttribute("m_id",loginResult.getM_id());
            return "/layout/header";
        }else {
            return "/member/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList",memberDTOList);
        return "/member/admin";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long m_id){
        boolean deleteResult = memberService.delete(m_id);
        if(deleteResult){
            return "redirect:/member/findAll";
        }else {
            return "index";
        }
    }

    @GetMapping("/detail")
    public String findById(@RequestParam Long m_id,Model model){
        MemberDTO memberDTO = memberService.findById(m_id);
        model.addAttribute("memberDetail",memberDTO);
        return "/member/mypage";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model){
        Long updateId = (Long) session.getAttribute("m_id");
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("memberDetail",memberDTO);
        return "/member/update";
    }


    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("MemberController.update");
        System.out.println("memberDTO = " + memberDTO);
        boolean result = memberService.update(memberDTO);
        if(result){
            return "index";
                    //"redirect:/member/detail?m_id="+memberDTO.getM_id();
        }else {
            return "index";
        }
    }






}

