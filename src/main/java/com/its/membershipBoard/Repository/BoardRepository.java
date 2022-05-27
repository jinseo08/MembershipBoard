package com.its.membershipBoard.Repository;

import com.its.membershipBoard.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
}
