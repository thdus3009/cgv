package com.tm.cgv.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Component
public class FileManager {
   
   private int widthPix = 100;
   private int heightPix = 100;
   private boolean resizeFlag = false;
   
   //filsaver
   public String saveTransfer(MultipartFile file, File dest) throws Exception{
      
      String fileName ="";

      fileName = UUID.randomUUID().toString();
      fileName = fileName +"_"+file.getOriginalFilename();
      InputStream inputStream = file.getInputStream();
      
      File originDest = new File(dest,fileName);
      File resizeDest = new File(dest,fileName);
      FileOutputStream thumbnail = null;
      
      // resizeOption을 안켰거나, imgType이 아니라면, 일반 저장 
      if(!this.resizeFlag || !checkImageType(originDest)) {
    	 System.out.println("섬네일 실패");
         file.transferTo(originDest);
      } else {
    	  System.out.println("섬네일 저장");
         // 썸네일로 저장
         thumbnail = new FileOutputStream(resizeDest);
        // Thumbnailator.createThumbnail(inputStream, thumbnail, widthPix, heightPix);
         Thumbnailator.createThumbnail(inputStream,thumbnail,widthPix,heightPix);
         thumbnail.close();
      }
      
      System.out.println("fileMAnger :fileName : "+fileName);
      
      return fileName;
   }
   
   public String saveFileCopy(MultipartFile file,File dest) throws Exception{
      String fileName ="";

      fileName = UUID.randomUUID().toString();
      fileName = fileName +"_"+file.getOriginalFilename();
      
      dest = new File(dest,fileName);
      FileCopyUtils.copy(file.getBytes(), dest);
      
      return fileName;
   }
   
   
   // fileDelete
   public int deleteFile(String fileName, File dest)throws Exception{
	   
	   	System.out.println("dest : "+dest);
	   	System.out.println("fileName : "+fileName);
	      File file = new File(dest, fileName);
	      
	      
	     System.out.println("file : "+file);
	      boolean check=false;
	      int result=0;
	      
	      if(file.exists()) {
	    	  System.out.println("deleteFile IN");
	         check = file.delete();
	         System.out.println("check : "+check);
	      }
	      if(check) {
	         result=1;
	      }
	      
	      System.out.println(result+"d result");
	      return result;
	   }
   
   // img인지 체크
   private boolean checkImageType(File file) throws Exception{
      
      String contentType = Files.probeContentType(file.toPath());
      System.out.println("파일타입 : "+contentType);
      return contentType.startsWith("image");
   }
   
   public void onResizeFunction() {
      
      this.resizeFlag = true;
   }

   public void onResizeFunction(int pixel) {
      
      this.widthPix = pixel;
      this.heightPix = pixel;
      this.resizeFlag = true;
   }
}