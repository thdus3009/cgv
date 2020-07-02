package com.tm.cgv.memberCupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberCuponService {

	@Autowired
	private MemberCuponRepository memberCuponeRepository;
	
	public List<MemberCuponVO> memberCuponSelect(MemberCuponVO memberCuponVO)throws Exception{
		return memberCuponeRepository.memberCuponSelect(memberCuponVO);
	}
	
	public int memberCuponUpdate(MemberCuponVO memberCuponVO) throws Exception{
		return memberCuponeRepository.memberCuponUpdate(memberCuponVO);
	}
}
