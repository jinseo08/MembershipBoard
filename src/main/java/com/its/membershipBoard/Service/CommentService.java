package com.its.membershipBoard.Service;

import com.its.membershipBoard.DTO.CommentDTO;
import com.its.membershipBoard.Repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;


    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long b_id) {
        return commentRepository.findAll(b_id);
    }
}
