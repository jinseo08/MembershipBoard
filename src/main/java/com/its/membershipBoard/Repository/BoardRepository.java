package com.its.membershipBoard.Repository;

import com.its.membershipBoard.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public int save(BoardDTO boardDTO) {
        return sql.insert("Board.save",boardDTO);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }


    public BoardDTO findById(Long b_id) {
        sql.update("Board.boardHits",b_id);
        return sql.selectOne("Board.findById",b_id);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sql.selectList("Board.search",searchParam);
    }

    public int update(BoardDTO boardDTO) {
        return sql.update("Board.update",boardDTO);
    }

    public int delete(Long b_id) {
        return sql.delete("Board.delete",b_id);
    }
}
