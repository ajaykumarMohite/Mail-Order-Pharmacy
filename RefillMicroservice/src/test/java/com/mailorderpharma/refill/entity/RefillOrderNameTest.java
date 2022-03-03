package com.mailorderpharma.refill.entity;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.util.Date;

import org.junit.jupiter.api.Test;

class RefillOrderNameTest {
	Date date = new Date();
	RefillOrderName refillOrder = new RefillOrderName();

	@Test
	void testRefillId() {
		refillOrder.setId(1);
		assertEquals(1, refillOrder.getId());
	}

	@Test
	void testrefilledDate() {
		refillOrder.setRefilledDate(LocalDate.now());
		assertEquals(LocalDate.now(), refillOrder.getRefilledDate());
	}

	@Test
	void testPayStatus() {
		refillOrder.setPayStatus(true);
		assertEquals(true, refillOrder.getPayStatus());
	}

	@Test
	void testSubId() {
		refillOrder.setSubId(1);
		assertEquals(1, refillOrder.getSubId());
	}

	@Test
	void testRefillQuantity() {
		refillOrder.setQuantity(50);
		assertEquals(50, refillOrder.getQuantity());
	}

	@Test
	void testMemberId() {
		refillOrder.setMemberId("pranav");
		assertEquals("pranav", refillOrder.getMemberId());
	}

	@Test
	void test() {
		
	}

}