package com.cts.subscription.exception;

import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@NoArgsConstructor
public class SubscriptionNotFoundException extends Exception {

	public SubscriptionNotFoundException(String message) {
		super(message);

	}

}
