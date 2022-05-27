package com.its.membershipBoard.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageDTO {

    private int page; //현재페이지
    private int maxPage; //필요한 페이지 개수
    private int startPage; //시작페이지
    private int endPage; //끝 페이지
}
