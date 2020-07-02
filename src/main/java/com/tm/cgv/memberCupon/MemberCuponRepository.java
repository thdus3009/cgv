package com.tm.cgv.memberCupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberCuponRepository {
	
	public List<MemberCuponVO> memberCuponSelect(MemberCuponVO memberCuponVO) throws Exception;

}
