package kosta.mapda.service.service;

import java.io.File;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.CouponCategory;
import kosta.mapda.domain.service.MyCoupon;
import kosta.mapda.repository.CouponCategoryRepository;
import kosta.mapda.repository.CouponRepository;
import kosta.mapda.repository.MyCouponRepository;
import kosta.mapda.repository.enterprise.EnterpriseRepository;
import kosta.mapda.repository.member.MemberRepository;
//import net.sourceforge.barbecue.Barcode;
//import net.sourceforge.barbecue.BarcodeFactory;
//import net.sourceforge.barbecue.BarcodeImageHandler;

@Service
@Transactional
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponRepository couponRepository;
	
	@Autowired
	private CouponCategoryRepository couponCategoryRepository;
	
	@Autowired
	private MyCouponRepository myCouponRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private EnterpriseRepository enterpriseRepository;
	
	@Override
	public Page<Coupon> selectAll(Pageable pageable, String couponName, Long category) {
		Page<Coupon> couponResult;
		if(couponName.isEmpty()==true && category==null) {
			couponResult = couponRepository.findAll(pageable);
		}else if(couponName.isEmpty()!=true && category==null){
			couponResult = this.selectByName(pageable, couponName);
		}else if(couponName.isEmpty()==true && category!=null) {
			couponResult = this.selectByCategory(pageable, category);
		}else {
			couponResult = couponRepository.findAll(pageable);
		}
			
		return couponResult;
	}
	
	/*@Override
	public Page<Coupon> selectAll(Pageable pageable, String couponName, Long category) {
		Page<Coupon> couponResult;
		if(couponName==null && category==null) {
			couponResult = couponRepository.findAll(pageable);
		}else if(couponName!=null && category==null){
			couponResult = this.selectByName(pageable, couponName);
		}else if(couponName==null && category!=null) {
			couponResult = this.selectByCategory(pageable, category);
		}else {
			CouponCategory couponCategory = couponCategoryRepository.findById(category).orElse(null);
//			couponResult = couponRepository.findAllBycpNameContainingAndcouponCategory(pageable, couponName, couponCategory);
		}
			
		return couponResult;
	}*/

	@Override
	public Coupon selectCoupon(Long couponNo) {
		
		return couponRepository.findById(couponNo).orElse(null);
	}

	@Override
	public Page<Coupon> selectByName(Pageable pageable, String keyword) {
		
		return couponRepository.findBycpNameContaining(pageable, keyword);
		
	}

	@Override
	public Page<Coupon> viewAll(Pageable pageable) {
		
		return couponRepository.findAll(pageable);
	}
	
	/**
	 * 발급상태 변경하는 ajax 메소드
	 */
	@Override
	public void stop(Long cpNo) {
//		couponRepository.deleteById(cpNo);
		Coupon dbCoupon = couponRepository.findById(cpNo).orElse(null);
		if(dbCoupon.getCpState()==1) {
			dbCoupon.setCpState(0);
		} else {
			dbCoupon.setCpState(1);
		}
		
		couponRepository.save(dbCoupon);
	}

	
	@Override
	public Page<Coupon> selectByCategory(Pageable pageable, Long category) {
		
		CouponCategory couponCategory = couponCategoryRepository.findById(category).orElse(null);
		
		return couponRepository.findBycouponCategory(pageable, couponCategory);
		
	}

	@Override
	public List<CouponCategory> couponCategory() {
		
		return couponCategoryRepository.findAll();
	}

	@Override
	public Page<MyCoupon> selectByMyCoupon(Pageable pageable, Long memNo) {
		
		
		//Member member = memberRepository.findById(memNo).orElse(null);

		
		//myCouponRepository.test().forEach(a->System.out.println(a));
		//List<MyCoupon> list = myCouponRepository.test();
		//System.out.println(list);
		
		System.out.println("===========================");
		return myCouponRepository.findBymember_memNo(pageable, memNo);
	}
	
	@Override
	public void insertCoupon(Coupon coupon) {
		Enterprise member = new Enterprise();
		member.setMemNo(1L);
		coupon.setMember(member);
		
		Coupon dbCoupon = new Coupon(); 	
		
		dbCoupon = couponRepository.save(coupon);
		
	}

	@Override
	public void insertMyCoupon(Coupon coupon, Long memNo, HttpSession session) {
		
		
		/*try {
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
			   String couponNum = buf.toString();
			 
			
			  Barcode barcode = BarcodeFactory.createCode128(couponNum);
			  
			  File file = new File("c:/barcode1.png");
			  
			  BarcodeImageHandler.savePNG(barcode, file);
			  
			  MyCoupon mc = new MyCoupon();
				
				mc.setBarcoNo("1234");
				mc.setMember(memberRepository.findById(memNo).orElse(null));
				mc.setMycpState(1);
				mc.setBarcoImgPath(couponNum);
				
				mc.setCoupon(coupon);
				
				myCouponRepository.save(mc);
			  
			  }
			  
			  }catch(Exception e) {
				  e.printStackTrace();
		}*/
		
	}
	
	public void updateCoupon(Coupon coupon) {
		Coupon dbCoupon = couponRepository.findById(coupon.getCpNo()).orElse(null);
		Long cpcaNo = coupon.getCouponCategory().getCpcaNo();
		CouponCategory dbCate = couponCategoryRepository.findById(cpcaNo).orElse(null);
		Long memNo = coupon.getMember().getMemNo();
		Enterprise dbEnter = enterpriseRepository.findById(memNo).orElse(null);
		
		dbCoupon.setCouponCategory(dbCate);
		dbCoupon.setMember(dbEnter);
		dbCoupon.setCpImgpath(coupon.getCpImgpath());
		dbCoupon.setCpName(coupon.getCpName());
		dbCoupon.setCpPlace(coupon.getCpPlace());
		dbCoupon.setCpPrice(coupon.getCpPrice());
		dbCoupon.setCpDetail(coupon.getCpDetail());
		dbCoupon.setCpUsingdetail(coupon.getCpUsingdetail());
		couponRepository.save(dbCoupon);
		
	}
	
	@Override
	public CouponCategory getCouponCategory(Long cpcaNo) {
		
		
		return couponCategoryRepository.findById(cpcaNo).orElse(null);
		
	}
	

	
	
}
