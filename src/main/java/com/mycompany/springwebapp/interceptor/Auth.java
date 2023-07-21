package com.mycompany.springwebapp.interceptor;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME) //나는 실행할때만 쓸거야~~
@Target({ElementType.METHOD})//어디에 적용할꺼야? 적용대상이 모야!?-> 지금은 메소드!
public @interface Auth {
	public enum Role{USER , ADMIN}; // Role 이라는 enum을 생성 (USER, ADMIN) 이케 있따.
	public Role value() default Role.USER; // 기본값은 USER
}
