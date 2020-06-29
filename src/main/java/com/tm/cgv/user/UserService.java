package com.tm.cgv.user;

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
public class UserService implements UserDetailsService {
    
	@Autowired
	private UserRepository userRepository;

    public Long joinUser(UserBasicVO userVO) throws Exception{
        // 비밀번호 암호화
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));

        // db에 저장
        long result = userRepository.insert(userVO);
        System.out.println(result);

        return result;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        
    	System.out.println("loadUserByUsername");
    	System.out.println(username);
    	
    	UserBasicVO userVO = null;
		try {
			userVO = userRepository.read(username);
		} catch (Exception e) {
			e.printStackTrace();
		}       
        
//        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//
//        if (("admin").equals(username)) {
//            authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
//        } else {
//            authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
//        }
        
		UserVO user = new UserVO(userVO);
        System.out.println(user.getUserVO().toString());
        
        return user;
    }
}
