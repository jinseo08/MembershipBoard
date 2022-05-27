package com.its.membershipBoard.Controller;

import com.its.membershipBoard.DTO.BoardDTO;
import com.its.membershipBoard.DTO.MemberDTO;
import com.its.membershipBoard.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {


    @Autowired
    private BoardService boardService;

//    @GetMapping("/list")
//    public String list(){
//        return "redirect:/board/findAll";
//    }

    @GetMapping("/save")
    public String saveForm(HttpSession session){
        return "/board/save";
    }

    @GetMapping("/findAll")
    public String findAll(){
        List<BoardDTO> boardDTOList = boardService.findAll();
        return "/board/list";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO){
        boolean result = boardService.save(boardDTO);
        if(result){
            return "redirect:/board/findAll";
        }else {
            return "/board/save";
        }

    }


}
