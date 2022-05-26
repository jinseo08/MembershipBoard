package com.its.membershipBoard.Service;

import com.its.membershipBoard.DTO.MemberDTO;
import com.its.membershipBoard.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberFile = memberDTO.getMemberFile();
        String memberProfileName = memberFile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        memberDTO.setMemberProfileName(memberProfileName);
        String savePath = "C:\\spring_img\\" + memberProfileName;
        if(!memberFile.isEmpty()){
            memberFile.transferTo(new File(savePath));
        }
        memberRepository.save(memberDTO);
    }
}
