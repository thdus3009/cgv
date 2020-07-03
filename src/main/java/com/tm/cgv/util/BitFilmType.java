package com.tm.cgv.util;

import java.util.ArrayList;
import java.util.List;

public class BitFilmType {


	   private byte a = 0x04;//4
	   private byte b = 0x02;//2
	   private byte c = 0x01;//1
	   
	
	   public List<List<Byte>> getState(List<Integer> values) { //6.. 7.. 3..
	      
	      List<List<Byte>> list = new ArrayList<List<Byte>>();


	      byte tmp = 0;
	      for (int i : values) {
	    	  System.out.println("i : " + i);
	    	 List<Byte> type = new ArrayList<Byte>();
	      
	         tmp = (byte)(i & a);
	         if(tmp == this.a)
	            type.add(a);
	         
	         tmp = (byte)(i & b);
	         if(tmp == this.b)
	        	type.add(b);
	         
	         tmp = (byte)(i & c);
	         if(tmp == this.c)
	        	 type.add(c);
	         
	         list.add(type);

	      }
	      

	      
	     // System.out.println(list.get(6).get(0));
	      //System.out.println(list.get(6).get(1));
	      
	      return list;
	   }
}