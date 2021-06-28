package org.example.printoffice.exception;

public class InvalidUsernameOrPasswordException extends RuntimeException {

	public InvalidUsernameOrPasswordException() {
	}

	public InvalidUsernameOrPasswordException(String s) {
		super(s);
	}

	public InvalidUsernameOrPasswordException(String s, Throwable throwable) {
		super(s, throwable);
	}

	public InvalidUsernameOrPasswordException(Throwable throwable) {
		super(throwable);
	}
}
