package com.tm.cgv.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.util.GenerateAuthNumber;
import com.tm.cgv.util.SmsSender;

@Service
@Transactional
public class MemberService implements UserDetailsService {
    
	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private SmsSender smsSender;

	@Autowired
	RedisTemplate<String, Object> redisTemplate;
	
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
 		
 		// 해당되는 유저가 있다면 유저 반환
 		MemberBasicVO findMemberBasicVO = memberRepository.phoneCheck(memberBasicVO);
 		if(findMemberBasicVO != null) {
    		return findMemberBasicVO;
    	}
 		
 		// 해당되는 유저가 없다면, sms 인증 진행
 		// 인증번호 생성, redis에 key : value 형태로 (phone:authCode) 저장 
    	GenerateAuthNumber authMaker = new GenerateAuthNumber();
        String authCode = authMaker.excuteGenerate();
 		
        // redis에 set
        redisTemplate.opsForValue().set(memberBasicVO.getPhone(), authCode);
        
        // 폰 번호가 없음 -> 인증 메시지 보내기
    	String contents = "[CGV]인증번호는 "+authCode+" 입니다";
    	System.out.println(memberBasicVO.getPhone());
    	System.out.println(contents);
    	//smsSender.smsSend(memberBasicVO.getPhone(), contents);
    	
 		return null;
 	};
}
