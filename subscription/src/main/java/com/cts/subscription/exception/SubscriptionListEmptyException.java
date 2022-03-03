package com.cts.subscription.exception;

import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@NoArgsConstructor
public class SubscriptionListEmptyException extends Exception {

	public SubscriptionListEmptyException(String message) {
		super(message);
	}
}
