package com.mailorderpharma.refill.entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class RefillOrder {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	long id;
	LocalDate refilledDate;
	private Boolean payStatus;
	private long subId;
	int quantity;
	String memberId;

}
