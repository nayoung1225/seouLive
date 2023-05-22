package org.zerock.seoulive.board.travel.exception;

// 개발자가 만드는 컨트롤러의 핸들러 메소드에서 오류발생시,
// 아래에 정의된 사용자정의예외객체로 Wrapping 해서 throw 하게
// 하기 위해 정의된 예외클래스
public class ControllerException extends Exception {
//	private static final long serialVersionUID = 1L;

    private static final long serialVersionUID = 1L;

    public ControllerException(String message) {
        super(message);
    } // Default Construcotr

    public ControllerException(Exception originalException) {
        super(originalException);
    } // Default Construcotr
}
