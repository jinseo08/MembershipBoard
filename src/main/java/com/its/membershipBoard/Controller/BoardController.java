package com.its.membershipBoard.Controller;

import com.its.membershipBoard.DTO.BoardDTO;
import com.its.membershipBoard.DTO.MemberDTO;
import com.its.membershipBoard.DTO.PageDTO;
import com.its.membershipBoard.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {


    @Autowired
    private BoardService boardService;


    @GetMapping("/save")
    public String saveForm(HttpSession session){
        return "/board/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boolean result = boardService.save(boardDTO);
        if(result){
            return "redirect:/board/paging";
        }else {
            return "/board/save";
        }

    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        // required-false로 요청하면 /board/paging 요청도 가능
        // 별도의 페이지 값을 요청하지 않으면 첫페이지(page=1)를 보여주자
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "board/list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam Long b_id,Model model){
        BoardDTO boardDTO = boardService.findById(b_id);
        model.addAttribute("boardDetail",boardDTO);
        return "/board/detail";
    }

    @GetMapping("/search")
    public String search(@RequestParam String searchType,@RequestParam String searchText, Model model){
        List<BoardDTO> boardDTOList = boardService.search(searchType,searchText);
        model.addAttribute("boardList",boardDTOList);
        return "/board/list";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam Long b_id, Model model){
        BoardDTO boardDTO = boardService.findById(b_id);
        model.addAttribute("boardDetail",boardDTO);
        return "/board/update";
    }

    @PostMapping("/update")
    public String updateForm(@ModelAttribute BoardDTO boardDTO){
        boolean result = boardService.update(boardDTO);
        if(result){
            return "redirect:/board/paging";
        }else {
            return "/board/update";
        }
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long b_id){
        boolean result = boardService.delete(b_id);
        if(result){
            return "redirect:/board/paging";
        }else {
            return "redirect:/board/detail";
        }

    }






}
