package com.cts.subscription.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AuthResponse {
	/**
	 * Id of user
	 */
	private String uid;
	/**
	 * Name of the user
	 */
	private String name;
	/**
	 * Validity check
	 */
	private boolean isValid;
}
