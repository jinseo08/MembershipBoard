package com.its.membershipBoard.Service;

import com.its.membershipBoard.Controller.BoardController;
import com.its.membershipBoard.DTO.BoardDTO;
import com.its.membershipBoard.DTO.PageDTO;
import com.its.membershipBoard.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    public List<BoardDTO> findAll() {
        List<BoardDTO> boardDTOList = boardRepository.findAll();
        return boardDTOList;
    }

    public boolean save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath = "C:\\spring_img\\" + boardFileName;
        if(!boardFile.isEmpty()){
            boardFile.transferTo(new File(savePath));
        }
        int result = boardRepository.save(boardDTO);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }

    private static final int PAGE_LIMIT = 3;  // 한 페이지에 보여줄 글 개수
    private static final int BLOCK_LIMIT = 3; // 페이징 개수 ( [이전][1][2][3][다음])


    // 요청한 페이지에 해당하는 글 목록을 DB에서 가져오는 역할
    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount(); //글 갯수 조회
        // 필요한 전체 페이지 개수 : 소수점은 올림으로 계산(10,3이라 10/3 = 3.333인데 올려서 4 )
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        // 시작페이지 (1,4,7...)
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 (3,6,9...)
        int endPage = startPage + BLOCK_LIMIT - 1;
        // 끝페이지가 (3,6,9..등이 아니면 마지막페이지 8을 하겠다는 것)
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }


    public BoardDTO findById(Long b_id) {
        BoardDTO boardDTO = boardRepository.findById(b_id);
        return boardDTO;
    }

    public List<BoardDTO> search(String searchType, String searchText) {
        Map<String,String> searchParam = new HashMap<>();
        searchParam.put("type",searchType);
        searchParam.put("text",searchText);
        List<BoardDTO> boardDTOList = boardRepository.search(searchParam);
        return boardDTOList;
    }
}
