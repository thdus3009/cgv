package com.tm.cgv.reserveCheck;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReserveCheckRepository {

	public List<ReserveCheckVO> reservationCheckedSelect(ReserveCheckVO reserveCheckVO) throws Exception;
}
