package com.its.membershipBoard.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {

    private Long b_id;
    private String boardTitle;
    private String memberId;
    private String boardContents;
    private String boardHits;
    private String boardCreatedDate;
    private String boardFileName;
    private MultipartFile boardFile;

}
