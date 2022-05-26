package com.its.membershipBoard.Service;

import com.its.membershipBoard.DTO.MemberDTO;
import com.its.membershipBoard.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

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

    public String idCheck(String memberId) {
        String checkResult = memberRepository.idCheck(memberId);
        if(checkResult == null){
            return "ok";
        }else {
            return "no";
        }

    }

    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO loginResult = memberRepository.login(memberDTO);
        return loginResult;
    }

    public List<MemberDTO> findAll() {
        List<MemberDTO> memberDTOList = memberRepository.findAll();
        return memberDTOList;
    }

    public boolean delete(Long m_id) {
        int deleteResult = memberRepository.delete(m_id);
        if(deleteResult > 0){
            return true;
        }else {
            return false;
        }
    }
}
