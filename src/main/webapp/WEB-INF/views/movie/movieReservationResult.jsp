<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="section section-complement">
    <div class="col-head">
        <!--<img src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/title_complement.png" alt="예매 완료" />-->
    </div>
	<div class="col-body">
        <div class="article result">
            <div class="text_complement"><img src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step4/text_complement.png" alt="예매가 완료 되었습니다."> </div>
			
            <div class="ticket_summary_wrap">
                <div class="ticket_summary">
                    <div class="poster"><img src="" alt=""></div>
                    <table>
                        <caption>예매정보</caption>
                        <thead></thead>
                        <tbody>
                            <tr class="ticket_no">
                                <th scope="row">예매번호</th> 
                                <td><span class="red">${reservationVO.num}</span></td>
                            </tr>
                            <tr class="movie_name">
                                <th scope="row">영화</th>
                                <td><em></em>${reservationVO.movieInfoVO.title}</td>
                            </tr>
                            <tr class="theater">
                                <th scope="row">극장</th>
                                <td><em><span class="theater_name"></span>${reservationVO.cinemaName} / ${reservationVO.theaterName}<span class="theater_loc"></span></em></td>
                            </tr>
                            <tr class="movie_date">
                                <th scope="row">일시</th>
                                <td><em>${reservationVO.movieTimeVO.screenDate} ${reservationVO.movieTimeVO.screenTime} ~ ${endTime}</em></td>
                            </tr>
                            <tr class="people">
                                <th scope="row">인원</th>
                                <td><em>일반 2명</em></td>
                            </tr>
                            <tr class="seat">
                                <th scope="row">좌석</th>
                                <td><em>${reservationVO.seats}</em></td>
                            </tr>
                            <tr class="payment_price">
                                <th scope="row">결제금액</th>
                                <td><span class="price">${reservationVO.totalPrice}</span> 원</td>
                            </tr>
                            <tr class="payment_method">
                                <th scope="row">결제수단</th>
                                <td>
                                    <div class="row">
                                        <span class="title"><em>${reservationVO.paymentVO.pay_method}</em></span>
                                        <span class="content"><span class="price">5,000</span>원 (CJ ONE 포인트 <span class="price">3,000</span>원)</span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="ticket_exception">
                <em>CGV 청담씨네시티는 대중교통이용을 권장합니다.</em><br>
                <span class="desc">발레파킹을 이용하실 수 있으나, 가능 차량수가 한정적이며 주변 교통상황에 따라 지연될 수 있습니다.</span>
            </div>
            <div class="ticket_button_group"><div>
                <a class="btn_step4 btn_result_smssend" href="#" onclick="sendTicketResultSMS();return false;"><span>예매결과 SMS발송</span></a>
                <a class="btn_step4 btn_red btn_ticket_check" href="#" onclick="confirmCancelTicketResult();return false;"><span>예매확인/취소</span></a>
            </div></div>
            <div class="ticket_instructions">
                <dl>
                    <dt><img src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step4/text_ticket_instructions.png" alt="예매 유의 사항"></dt>
                    <dd>
                        <ul>
                            <li>CJ ONE 포인트는 상영일 익일 적립됩니다.<em>(영화관람권, 비회원 예매 제외)</em></li>
                            <li>영화 상영 스케줄은 영화관사정에 의해 변경될 수 있습니다.</li>
                            <li>비회원 예매하신 경우는 예매내역이 이메일로  발송되지 않습니다.</li>
                        </ul>
						
					</dd>
                </dl>
            </div>
        </div>
    </div>
</div>

<script>
$(".ticket_summary .movie_date em").

</script>













