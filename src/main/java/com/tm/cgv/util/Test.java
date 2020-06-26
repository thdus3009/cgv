package com.tm.cgv.util;

public class Test {

	public static void main(String[] args) {
		//숫자는 나중에 입력받아올것		   
		int a = 8;   //L열
		int b = 12;	  //15번
		int[][] ar = new int[a][b];
		
		int index = 1;
		for(int i=0; i<a; i++) {
			for(int j=0; j<b; j++) {
				ar[i][j] = index;
				index++;
			}
		}
		

		for(int i=0; i<a; i++) {
			for(int j=0; j<b; j++) {
				if(ar[i][j]<10) {
					System.out.print("["+ ar[i][j] + " ]");
				}else {
				System.out.print("["+ ar[i][j] + "]");
				}
			}
			System.out.println();
		}
		
		
		//만든대로 jsp > 이중 for문 뿌려주기
		
		char row = 'a'; 
		for(int k=0; k<b; k++)
		if(b%15==0) {
			row += 1;
			System.out.println(row);
		}
	}
	
	

}
