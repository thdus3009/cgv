package com.tm.cgv.cuponInfo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CuponInfoRepository {
	
	public CuponInfoVO cuponInfoSelectOne(CuponInfoVO cuponInfoVO) throws Exception;

	public int cuponInfoDelete(CuponInfoVO cuponInfoVO) throws Exception;
	
	public CuponInfoVO cuponInfoSelect(CuponInfoVO cuponInfoVO) throws Exception;
	
}
