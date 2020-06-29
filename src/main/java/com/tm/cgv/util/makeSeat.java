package com.tm.cgv.util;

import java.util.ArrayList;

import com.fasterxml.jackson.databind.ser.std.StdArraySerializers.IntArraySerializer;

public class makeSeat {

//	public static void main(String[] args) {
//		
//		int row = 10; // j
//		int col = 10; 
//		
//		int[][] seats = new int[row][col];
//		
//		for(int i=0; i<row; i++) {
//			
//			for(int j=0; j<col; j++) {
//				
//				seats[i][j] = 1;
//			}
//		}
//		
//		
//		seats[0][0] = 0;
//		seats[0][1] = 0;
//		seats[0][2] = 0;
//		seats[0][7] = 0;
//		seats[0][8] = 0;
//		seats[0][9] = 0;
//		seats[9][4] = 0;
//		seats[9][5] = 0;
//		seats[9][6] = 0;
//
//		for(int i=0; i<row; i++) {
//			
//			for(int j=0; j<col; j++) {
//				
//				if(seats[i][j] == 1) 
//					System.out.print("[O]");
//				else
//					System.out.print("[X]");
//			}
//			System.out.println();
//		}
//		
//		
//		int index = 1;
//		int[][] seats2 = new int[row][col];
//		for(int i=0; i<row; i++) {
//			
//			for(int j=0; j<col; j++) {
//				
//				if(seats[i][j] == 1) {
//					seats2[i][j] = index;
//					index++;
//				}
//				else
//					seats2[i][j] = 0;
//			}
//		}
//		
//		for(int i=0; i<row; i++) {
//			
//			for(int j=0; j<col; j++) {
//				 
//				System.out.print("["+seats2[i][j]+"]");
//			}
//			System.out.println();
//		}
//	}
}
