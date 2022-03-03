package com.mailorderpharma.drugservice.model.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.mailorderpharma.drugservice.entity.Stock;

class StockTest {

	Date date = new Date();
	Stock stock1 = new Stock();
	Stock stock2 = new Stock("PR1","PARACETAMOL",date,100);
	
	@Test
	void testDrugId() {
		stock1.setDrugId("PR1");
		assertEquals("PR1", stock1.getDrugId());
	}
	
	@Test
	void testDrugName() {
		stock1.setDrugName("PARACETAMOL");
		assertEquals("PARACETAMOL",stock1.getDrugName());
	}
	
	@Test
	void testDate() {
		stock1.setExpiryDate(date);
		assertEquals(date, stock1.getExpiryDate());
	}
	
	@Test
	void testStock() {
		stock1.setStocks(100);
		assertEquals(100, stock1.getStocks());
	}
}
