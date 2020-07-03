package com.tm.cgv.cuponInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CuponInfoService {
	
	@Autowired
	private CuponInfoRepository cuponInfoRepository;
	
	public CuponInfoVO cuponInfoSelectOne(CuponInfoVO cuponInfoVO) throws Exception{
		return cuponInfoRepository.cuponInfoSelectOne(cuponInfoVO);
	}
	
	public int cuponInfoDelete(CuponInfoVO cuponInfoVO) throws Exception{
		return cuponInfoRepository.cuponInfoDelete(cuponInfoVO);
	}

	public CuponInfoVO cuponInfoSelect(CuponInfoVO cuponInfoVO) throws Exception{
		return cuponInfoRepository.cuponInfoSelect(cuponInfoVO);
	}
}
