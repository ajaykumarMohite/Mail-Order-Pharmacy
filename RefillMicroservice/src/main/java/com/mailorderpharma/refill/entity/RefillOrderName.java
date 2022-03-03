package com.mailorderpharma.refill.entity;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RefillOrderName {
	
	long id;
	private String drugName;
	LocalDate refilledDate;
	private Boolean payStatus;
	private long subId;
	int quantity;
	String memberId;
}
