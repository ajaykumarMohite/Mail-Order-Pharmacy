package com.cts.subscription.exception;

import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@NoArgsConstructor
public class DrugNotFoundException extends Exception {

	public DrugNotFoundException(String message) {
		super(message);
	}

}
