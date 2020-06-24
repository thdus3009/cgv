package com.tm.cgv.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService implements UserDetailsService {
    
	@Autowired
	private MemberRepository memberRepository;

    public Long joinMember(MemberBasicVO memberBasicVO) throws Exception{
        // 비밀번호 암호화
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        memberBasicVO.setPassword(passwordEncoder.encode(memberBasicVO.getPassword()));

        // db에 저장
        long result = memberRepository.insert(memberBasicVO);
        System.out.println(result);

        return result;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        
    	System.out.println("loadUserByUsername");
    	System.out.println(username);
    	
    	MemberBasicVO memberBasicVO = null;
		try {
			memberBasicVO = memberRepository.read(username);
		} catch (Exception e) {
			e.printStackTrace();
		}       
        
		// Role Class 를 이용해 auth 테이블 없이 간단하게 구현하는 방법
//        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//
//        if (("admin").equals(username)) {
//            authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
//        } else {
//            authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
//        }
        
		MemberVO user = new MemberVO(memberBasicVO);
        System.out.println(user.getMemberBasicVO().toString());
        
        return user;
    }
    
    // 이미 등록된 phone 번호인지 Check
 	public MemberBasicVO phoneCheck(MemberBasicVO memberBasicVO) throws Exception {
 		
 		return memberRepository.phoneCheck(memberBasicVO);
 	};
}
