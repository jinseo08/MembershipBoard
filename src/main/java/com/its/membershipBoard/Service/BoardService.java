package com.its.membershipBoard.Service;

import com.its.membershipBoard.Controller.BoardController;
import com.its.membershipBoard.DTO.BoardDTO;
import com.its.membershipBoard.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    public List<BoardDTO> findAll() {
        List<BoardDTO> boardDTOList = boardRepository.findAll();
        return boardDTOList;
    }

    public boolean save(BoardDTO boardDTO) {
        int result = boardRepository.save(boardDTO);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }
}
