<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="ticket_payment_method">
	<a href="#" onclick="return false;" id="ticket_payment_top" class="sreader">결제시작</a>
	<input type="hidden" id="memberId" value="${memberVO.name}">
	<!-- 할인쿠폰 -->
	<div class="tpm_wrap" id="discCoupon">
		<h4 class="ts3_titlebar ts3_t1">
			<span class="header">STEP 1. </span> 
			<a href="#"><span>다시하기</span></a>
		</h4>
		<div class="tpm_header" data-index="-1">
			<h4>할인쿠폰</h4>
			<a class="tpmh_btn"><span>펼치기</span></a>
		</div>
		<div class="tpm_body" style="display: none;">
			<div class="guide_wrap">
				<div class="guide">
					<div class="guide_text">선택 불가능한 할인쿠폰 항목은 비활성화 처리됩니다.</div>
					<div class="guide_option">
						<div class="icon disabled"></div>
						비활성화 항목
					</div>
				</div>
			</div>
			<!-- guide_wrap -->
			<div class="tpm_discount">
				<div class="background"></div>
				<div class="discount_list">
					<ul>
						<li id="cgvCoupon_li" class="selected">
							<div class="dimmCon" style="display: none;">&nbsp;</div>
							<a href="#" onclick="return false;">CGV 할인쿠폰</a>
						</li>
						<li id="cjOneCoupon_li">
							<div class="dimmCon" style="display: none;">&nbsp;</div>
							<a href="#" onclick="return false;">CJ ONE 할인쿠폰</a>
						</li>
					</ul>
				</div>
				<div class="discount_form">
					<div id="cgvCoupon" class="form" style="display: block">
						<h5>CGV 할인쿠폰</h5>
						<div class="form_button">
							<a class="brown" href="#"><span>등록하기</span></a>
							<a class="gray" href="#"><span>전체 쿠폰</span></a>
						</div>
						<div class="form_list">
							<div class="list_header">
								<span class="col col1">사용가능 쿠폰</span>
								<span class="col col2">쿠폰 번호</span> 
								<span class="col col3">유효기간</span>
							</div>
							<div class="list_body nano has-scrollbar">
								<ul class="content" tabindex="-1" style="right: -17px; bottom: -17px;">
									
								</ul>
								
								
								<div class="message">사용 가능한 CGV 할인쿠폰이(가) 없습니다.</div>
								<div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
									<div class="slider slider-y" style="height: 50px;">
									</div>
								</div>
								<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
									<div class="slider slider-x" style="width: 50px;">
									</div>
								</div>
							</div>
						</div>
						<div class="form_result">
							<span class="title">할인금액:</span> 
							<span class="price">0</span> 
							<span class="won">원</span>
						</div>
					</div>
					
					
					<div id="cjOneCoupon" class="form" style="display: none;">
						<h5>CJ ONE 할인쿠폰</h5>
						<div class="form_button">
							<a class="gray" href="#"> 
							<span>전체 쿠폰</span></a>
						</div>
						<div class="form_list">
							<div class="list_header">
								<span class="col col1">사용가능 쿠폰</span> 
								<span class="col col2">쿠폰 번호</span> 
								<span class="col col3">유효기간</span>
							</div>
							<div class="list_body nano has-scrollbar">
								<ul class="content" tabindex="-1" style="right: -17px; bottom: -17px;">
								
								</ul>
								<div class="message">사용 가능한 CJ ONE 할인쿠폰이(가) 없습니다.</div>
								<div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
									<div class="slider slider-y" style="height: 50px;">
									</div>
								</div>
								<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
									<div class="slider slider-x" style="width: 50px;">
									</div>
								</div>
							</div>
						</div>
						<div class="form_result">
							<span class="title">할인금액:</span>
							<span class="price">0</span> 
							<span class="won">원</span>
						</div>
						<div class="form_guide">
							<dl>
								<dt>이용안내</dt>
								<dd class="split">
									CJ ONE 쿠폰은 최대 3매까지 사용이 가능합니다.<br>유효기간 만료 시, 기 예매된 티켓의 취소 후 재 사용 불가합니다.
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- tpm_body -->
	</div>






	<!-- 포인트/상품권 -->
	<div class="tpm_wrap" id="payPoints">
		<h4 class="ts3_titlebar ts3_t1">
			<span class="header">STEP 3.</span> 
			<a href="#"><span>다시하기</span></a>
		</h4>
		<div class="tpm_header">
			<h4>포인트 및 기타결제 수단</h4>
			<a class="tpmh_btn"><span>펼치기</span></a>
		</div>
		
		<div class="tpm_body" style="display: none;">
			<div class="guide_wrap">
				<div class="guide">
					<div class="guide_text">선택 불가능한 기타 포인트 항목은 비활성화 처리됩니다.</div>
					<div class="guide_option">
						<div class="icon disabled"></div>
						비활성화 항목
					</div>
				</div>
			</div>
			<!-- guide_wrap -->
			<div class="tpm_discount">
				<div class="background"></div>
				<div class="discount_list">
					<ul>
						<li id="cjOnePoint_li" class="selected">
							<div class="dimmCon" style="display: none;">&nbsp;</div>
							<a href="#" onclick="return false;">CJ ONE 포인트</a>
						</li>
						<li id="cgvGiftPrePay_li" >
							<div class="dimmCon" style="display: none;">&nbsp;</div>
							<a href="#" onclick="return false;">CGV 기프트카드</a>
						</li>
					</ul>
				</div>
				<div class="discount_form">
					<div id="cjOnePoint" class="form" style="display: block">
						<h5>CJ ONE 포인트</h5>
						<div class="tpm_coupon_button"></div>
						<div class="form_con">
							<div class="inner_con2">
								<dt>
									<label class="noneInput">보유 포인트</label>
								</dt>
								<dd class="amtValue">
									<span class="hasPoint">0</span>원
								</dd>

								<dt class="secondTit">
									<label for="cjOnePointipt">사용할 포인트</label>
								</dt>
								<dd>
									<input class="textBox2 type-n nohan" type="text" id="cjOnePointipt" value="0">원
								</dd>

								<dt class="secondTit">
									<input type="checkbox" id="cjOnePointchk">
								</dt>
								<dd>
									<label for="cjOnePointchk">모두사용</label>
								</dd>
							</div>
						</div>
						<div class="form_guide">
							<dl>
								<dt>이용안내</dt>
								<dd class="split">
									CJ ONE 포인트는 <em>1,000P</em> 이상부터 <em>10P</em> 단위로 사용 가능합니다.
								</dd>
							</dl>
						</div>
					</div>
					
					
					
					<div id="cgvGiftPrePay" class="form" style="display: none;"> <!-- block -->
						<h5>CGV 기프트카드</h5>
						<div class="tpm_coupon_button">
							<a class="brown" href="#"><span>등록하기</span></a>

						</div>
						<div class="form_con">
							<div class="inner_con2">
								<dt>
									<label class="noneInput">카드 보유 금액</label>
								</dt>
								<dd class="amtValue">
									<span class="hasPoint">0</span>원
								</dd>

								<dt class="secondTit">
									<label for="cgvGiftPrePayipt">적용금액</label>
								</dt>
								<dd>
									<input class="textBox2 type-n nohan" type="text" id="cgvGiftPrePayipt" value="0" >원
								</dd>

								<dt class="secondTit">
									<input type="checkbox" id="cgvGiftPrePaychk">
								</dt>
								<dd>
									<label for="cgvGiftPrePaychk">모두사용</label>
								</dd>
							</div>
						</div>

					</div>


				</div>
			</div>
		</div>
		<!-- tpm_body -->
	</div>
	
	
	
	
	<!-- 최종결제 -->
	<div id="lastPayMethod">
		<h4 class="ts3_titlebar ts3_t1">
			<span class="header">STEP 4. </span> 
			<span class="title">최종결제 수단</span>
		</h4>
		<h4 class="ts3_titlebar ts3_t1" style="display: none;">
			<span class="header">비회원결제</span> 
			<span class="desc">비회원 예매는 신용카드 결제만 가능합니다.</span>
		</h4>

		<div class="tpm_wrap tpm_last_pay">
			<div class="tpm_body">
				<div>
				
					<!--  최종결제 수단 -->
					<div class="payment_select radio_group" id="lastPayCon" style="opacity: 1;">
						<span style="opacity: 1;">
							<input type="radio" id="last_pay_radio0" name="last_pay_radio" value="0" checked="checked">
							<label for="last_pay_radio0">신용카드 </label>
						</span>
						<span style="opacity: 1;">
							<input type="radio" id="last_pay_radio1" name="last_pay_radio" value="1">
							<label for="last_pay_radio1">휴대폰 결제</label>
						</span>
						<span style="opacity: 1;">
							<input type="radio" id="last_pay_radio2" name="last_pay_radio" value="2">
							<label for="last_pay_radio2">계좌이체</label>
						</span>
						<span style="opacity: 1;">
							<input type="radio" id="last_pay_radio3" name="last_pay_radio" value="3">
							<label for="last_pay_radio3">간편결제</label>
						</span>
						<span>
							<input type="radio" name="last_pay_radio" value="4" id="SettleBank_btn">
							<label for="SettleBank_btn">내통장결제</label>
						</span>
					</div>
					
					
					<!-- 간편결제 -->
					<div class="payment_select radio_group" id="smartPayCon" style="display: none; opacity: 1;">
						<span style="opacity: 1;">
							<input type="radio" id="last_pay_radio4" name="last_pay_radio2" value="0">
							<label for="last_pay_radio4">카카오페이</label>
						</span>
						
						<span style="opacity: 1;"><input type="radio" name="last_pay_radio2" value="3" id="naverPay_btn">
							<label for="naverPay_btn">네이버페이</label>
							<i style="display: inline-block; margin: 0px 15px 0px -8px; line-height: 1.2em;">
								<img alt="네이버페이 1% 적립" width="58px" src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step3/ico_naverPay_1per.png">
							</i>
						</span>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="ticket_payment_summary">
	<div class="tps_wrap" style="top: 0px;">
	<div class="tps_body">
		<div class="summary_box total_box">
			<div class="payment_header">결제하실 금액</div>
			<div class="payment_footer">
				<div class="result">
					<span class="num verdana" id="summary_total_amount"></span><span class="won">원</span>
				</div>
			</div>
		</div>
		<div class="summary_box discount_box" id="tps_discount_box">
			<div class="payment_header">할인내역</div>
			<div class="payment_body" id="summary_discount_list">
			
			</div>
			<div class="payment_footer">
				<div class="label">
					<span>총 할인금액</span>
				</div>
				<div class="result">
					<span class="num verdana" id="summary_discount_total">0</span><span class="won">원</span>
				</div>
			</div>
		</div>
		<div class="summary_box payment_box" id="tps_payment_box">
			<div class="payment_header">결제내역</div>
			<div class="payment_body" id="summary_payment_list">
				<dl>
					<dt>신용카드</dt>
					<dd><span class="num"></span>
					<span class="won">원</span></dd>
				</dl>
			</div>
			<div class="payment_footer">
				<div class="label">
					<span>남은 결제금액</span>
				</div>
				<div class="result">
					<span class="num verdana" id="summary_payment_total"></span><span class="won">원</span>
				</div>
			</div>
			
		</div>
	</div>
	
	<div id="timerView" class="tps_footer " style="height: 50px; font-weight: bold;"></div></div>
</div>



<script type="text/javascript" src="/js/movie/moviePayment.js"></script>


