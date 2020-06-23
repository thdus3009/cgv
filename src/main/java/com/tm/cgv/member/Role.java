package com.tm.cgv.member;

import lombok.AllArgsConstructor;
import lombok.Getter;

// 실제로 사용하지 않는 클래스 auth 테이블을 만들지 않고
// 가볍게 구현하고 싶을때 사용하는 클래스

@Getter
@AllArgsConstructor
public enum Role {
    ADMIN("ROLE_ADMIN"),
    MEMBER("ROLE_MEMBER");

	private String value;
}