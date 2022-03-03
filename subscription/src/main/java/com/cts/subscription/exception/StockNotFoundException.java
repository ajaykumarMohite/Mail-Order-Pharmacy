package com.cts.subscription.exception;

import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@NoArgsConstructor
public class StockNotFoundException extends Exception {

	public StockNotFoundException(String message) {
		super(message);
	}
}
