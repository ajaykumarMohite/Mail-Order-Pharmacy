package com.cts.subscription.exception;

import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@NoArgsConstructor
public class InvalidTokenException extends Exception {

	public InvalidTokenException(String message) {
		super(message);
	}
}
