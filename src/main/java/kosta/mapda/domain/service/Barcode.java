package kosta.mapda.domain.service;

import java.io.File;
import java.util.HashSet;
import java.util.Random;

//import net.sourceforge.barbecue.BarcodeFactory;
//import net.sourceforge.barbecue.BarcodeImageHandler;

public class Barcode {
/*
	
		
	//@RequestMapping("/couponnum")
	 public static void main(String[] args) {
	  
	  //실행시 ???개 쿠폰 생성
	  int couponSize = 16;

	  final char[] possibleCharacters =
	    {'1','2','3','4','5','6','7','8','9','0'};
	  
	  final int possibleCharacterCount = possibleCharacters.length;
	  String[] arr = new String[couponSize];
	  Random rnd = new Random();
	  int currentIndex = 0;
	  int i = 0;
	  while (currentIndex < couponSize) {
	   StringBuffer buf = new StringBuffer(16);
	   //i는 8자리의 랜덤값을 의미
	   for (i= 16; i > 0; i--) {
	    buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
	   }
	   String couponnum = buf.toString();
	    
	   
	   System.out.println(couponnum);
	  }
	 }

	
		 
		 
		 
		 
		 
		 
	
     
	


		

		/*
		 * try {
		 * 
		 * net.sourceforge.barbecue.Barcode barcode =
		 * BarcodeFactory.createCode128(couponnum); File file = new
		 * File("c:/barcode1.png");
		 * 
		 * BarcodeImageHandler.savePNG(barcode, file); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */

	

}
