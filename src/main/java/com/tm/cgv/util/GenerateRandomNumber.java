package com.tm.cgv.util;

import java.util.Random;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GenerateRandomNumber {

	private int certNumLength = 6;
    
    public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        
        int range = (int)Math.pow(10,certNumLength);
        int trim = (int)Math.pow(10, certNumLength-1);
        int result = random.nextInt(range)+trim;
         
        if(result>range){
            result = result - trim;
        }
        
        return String.valueOf(result);
    }
}
