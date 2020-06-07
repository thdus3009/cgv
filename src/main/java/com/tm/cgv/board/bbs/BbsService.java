package com.tm.cgv.board.bbs;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.board.BoardService;
import com.tm.cgv.board.BoardVO;
import com.tm.cgv.board.bbsFile.BbsFileRepository;
import com.tm.cgv.board.bbsFile.BbsFileVO;
import com.tm.cgv.util.FileManager;
import com.tm.cgv.util.FilePathGenerator;
import com.tm.cgv.util.Pager;

@Service
public class BbsService implements BoardService {
	
	@Autowired
	private BbsRepository bbsRepository;
	@Autowired
	private FilePathGenerator filePathGenerator;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private BbsFileRepository bbsFileRepository;

	//List
	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		pager.makeRow();
		long totalCount = bbsRepository.totalCount(pager);
		pager.makeBlock(totalCount);
		return bbsRepository.boardList(pager);
	}

	//Select
	@Override
	public BoardVO boardSelect(BoardVO boardVO) throws Exception {
		return bbsRepository.boardSelect(boardVO);
	}

	//Insert
	@Override
	public int boardInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
		File dest = filePathGenerator.getUseClassPathResource("upload/bbs");
		int result = bbsRepository.boardInsert(boardVO);
		
		
		
		for (MultipartFile f : files) {
			if(f.getSize() > 0) {
				String fileName = fileManager.saveTransfer(f, dest);
				BbsFileVO bbsFileVO = new BbsFileVO();

				bbsFileVO.setNum(boardVO.getNum());
				bbsFileVO.setFileName(fileName);
				bbsFileVO.setOriName(f.getOriginalFilename());
				
				result = bbsFileRepository.fileInsert(bbsFileVO);
			}
		}
		
		return result;
		
	}

	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		return bbsRepository.boardUpdate(boardVO);
	}

	@Override
	public int boardDelete(BoardVO boardVO) throws Exception {
		return bbsRepository.boardDelete(boardVO);
	}

}
