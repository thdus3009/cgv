package com.tm.cgv.rememberMe;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Component
public class RememberMeTokenRepository implements PersistentTokenRepository{

	@Autowired
	RememberMeRepository rememberMeRepository;
	
	@Override
	public void createNewToken(PersistentRememberMeToken token) {
		System.out.println("토큰 생성");
		RememberMeVO rememberMeVO = new RememberMeVO();
		rememberMeVO.setUsername(token.getUsername());
		rememberMeVO.setSeries(token.getSeries());
		rememberMeVO.setToken(token.getTokenValue());
		
		try {
			rememberMeRepository.createNewToken(rememberMeVO);
		} catch (Exception e) {
			System.out.println("DB PROCESS ERROR");
			e.printStackTrace();
		}
		
		System.out.println("Create tokenVal : "+token.getTokenValue());
	}

	@Override
	public void updateToken(String series, String tokenValue, Date lastUsed) {
		System.out.println("토큰 수정");
		RememberMeVO rememberMeVO = new RememberMeVO();
		rememberMeVO.setSeries(series);
		rememberMeVO.setToken(tokenValue);
		
		try {
			rememberMeRepository.updateToken(rememberMeVO);
		} catch (Exception e) {
			System.out.println("DB PROCESS ERROR");
			e.printStackTrace();
		}
		
		System.out.println("Update tokenVal : "+tokenValue);
	}

	@Override
	public PersistentRememberMeToken getTokenForSeries(String seriesId) {
		System.out.println("토큰 참조");
		PersistentRememberMeToken token = null;
		RememberMeVO rememberMeVO = new RememberMeVO();
		rememberMeVO.setSeries(seriesId);	
	
		try {
			rememberMeVO = rememberMeRepository.findOne(rememberMeVO);
			if(rememberMeVO != null) {
				token = new PersistentRememberMeToken( 
							rememberMeVO.getUsername(), 
							rememberMeVO.getSeries(), 
							rememberMeVO.getToken(), 
							rememberMeVO.getLast_used());
			}
		} catch (Exception e) {
			System.out.println("DB PROCESS ERROR");
			e.printStackTrace();
		}
		
		return token;
	}

	@Override
	public void removeUserTokens(String username) {
		System.out.println("토큰 삭제");
		
		RememberMeVO rememberMeVO = new RememberMeVO();
		rememberMeVO.setUsername(username);
		try {
			rememberMeRepository.deleteByUsername(rememberMeVO);
		} catch (Exception e) {
			System.out.println("DB PROCESS ERROR");
			e.printStackTrace();
		}
	}
}
