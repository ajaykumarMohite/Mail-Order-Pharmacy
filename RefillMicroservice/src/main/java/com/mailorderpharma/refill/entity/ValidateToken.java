package com.mailorderpharma.refill.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ValidateToken {
	
	private String uid;
	private String name;
	private boolean isValid;
}
