package com.tm.cgv.banner;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BannerRepository {
	
	public List<BannerVO> selectSideBannerList(int index) throws Exception;
	
	public int bannerInsert(BannerVO bannerVO) throws Exception;
	
	public BannerVO selectBanner(int num) throws Exception;
	
	public int updateBanner(BannerVO bannerVO) throws Exception;
	
	public int deleteBanner(int num) throws Exception;
}
