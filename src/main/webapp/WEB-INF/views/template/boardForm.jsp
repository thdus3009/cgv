<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
						<form action="./bbs${path}" method="post" enctype="multipart/form-data">
							<fieldset>
								<input type="hidden" value="${bbsVO.num}" name="num">
								<div class="tbl_write">
									<p class="tbl_info">
										체크(<em><img alt="" src="../images/bbsWrite/ico_redstar.png"> </em>)된 항목은 필수 입력 사항입니다.
									</p>
									<table class="tbl_bbs_write">
										<colgroup>
											<col style="width: 100px;">
											<col style="width: 320px;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label>아이디</label></th>
												<td colspan="3"><strong>${sessionScope.memberVO.id}</strong></td>
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td><strong>${sessionScope.memberVO.phone}</strong></td>
												<th scope="row">이메일</th>
												<td><span>${sessionScope.memberVO.email}</span></td>
											</tr>
											<tr>
												<th scope="row">
													<label>제목 <img alt="" src="../images/bbsWrite/ico_redstar.png"> </label>
												</th>
												<td colspan="3">
													<input id="title" name="title" type="text" class="in01 check" style="width: 672px;" value="${bbsVO.title}">
												</td>
											</tr>
											<tr>
												<th scope="row">
													<label>내용 <img alt="" src="../images/bbsWrite/ico_redstar.png"> </label>
												</th>
												<td colspan="3">
													<textarea id="textarea_l" name="contents" rows="5" cols="70" class="textarea check" placeholder="※문의 내용 및 첨부파일 내에 개인정보(신용카드번호, 계좌번호, 주민번호 등)가 포함되지 않도록 유의하시기 바랍니다.">${bbsVO.contents}</textarea>
													<p class="byte_info">
														<span id="s_byte">0</span>/5000BYTE
														<span>(<span id="s_length">0</span>/2500자)</span>
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">
													<label>첨부파일</label>
												</th>
												
												<td colspan="3" id="fileInput">
												<c:if test="${path eq 'Update'}">
													<c:if test="${not empty bbsVO.bbsFileVO}">
														<p>${bbsVO.bbsFileVO.oriName}<i id="btn-remove"  data-title="${bbsVO.bbsFileVO.fileName}" data-num="${bbsVO.num}" 
																						class="remove fileDelete" style="font-weight: bold"> x</i></p>
													</c:if>
													<c:if test="${empty bbsVO.bbsFileVO}">
														<p><input type="file" name="files"> </p>
													</c:if>
												</c:if>
													
												</td>
											</tr>
										</tbody>
									
									</table>
									
								</div>
								<div class="btn_s">
									<a href="./bbsList" class="round gray"><span>취소</span></a>
									<button id="btn" type="submit" class="round inred"><span>수정하기</span></button>
								</div>
							</fieldset>
						</form>