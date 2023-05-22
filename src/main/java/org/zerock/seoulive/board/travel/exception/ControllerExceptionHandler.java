package org.zerock.seoulive.board.travel.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

// 컨트롤러에서 발생하는 예외를 핸들링하는 클래스라 알려주는거
// 컨트롤러는 패키지에 등록하니
@ControllerAdvice(basePackages={"org.zerock.myapp.controller"}) // For one package
public class ControllerExceptionHandler {

//	// NullPointerException 을 처리하는 예외 메소드
//	@ExceptionHandler({
//		NullPointerException.class,
//		IllegalStateException.class,
//		NumberFormatException.class
//	})	// 발생하는
//	String handleRuntimeException(Exception e,Model model) {
//		log.trace("handleRuntimeException({}) 인보크",e);
//
//		log.error("\t1. Exception Type : {}  ",e.getClass().getName());
//		log.error("\t2. Exception Mesg : {}  ",e.getMessage());
//
//
//		//공유 영역중, Request Scope의 공유속성으로 바인딩
//		model.addAttribute("__EXCEPTION__",e);
//
//
//
//		// 컨트롤러의 핸들러 메소드와 동일한 리턴타입
//		//	즉 뷰의 이름
//		return "errorPage";
//	} //

    // Exception을 처리하는 메소드
    @ExceptionHandler(Exception.class)
    String handleException (Exception e,Model model) {
        log.trace("handleException({}) 인보크",e);

        log.error("\t1. Exception Type : {}  ",e.getClass().getName());
        log.error("\t2. Exception Mesg : {}  ",e.getMessage());


        //공유 영역중, Request Scope의 공유속성으로 바인딩
        model.addAttribute("__EXCEPTION__",e);

        // 컨트롤러의 핸들러 메소드와 동일한 리턴타입
        //	즉 뷰의 이름
        return "errorPage";
    } //





    @ExceptionHandler(ControllerException.class)
    String handleControllerException (Exception e,Model model) {
        log.trace("handleControllerException({}) 인보크",e);

        log.error("\t1. Exception Type : {}  ",e.getClass().getName());
        log.error("\t2. Exception Mesg : {}  ",e.getMessage());


        //공유 영역중, Request Scope의 공유속성으로 바인딩
        model.addAttribute("__EXCEPTION__",e);

        // 컨트롤러의 핸들러 메소드와 동일한 리턴타입
        //	즉 뷰의 이름
        return "errorPage";
    } //

}
