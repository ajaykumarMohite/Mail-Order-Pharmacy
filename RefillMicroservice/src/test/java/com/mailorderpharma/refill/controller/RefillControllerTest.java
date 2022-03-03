package com.mailorderpharma.refill.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mailorderpharma.refill.dao.RefillOrderRepository;
import com.mailorderpharma.refill.entity.RefillOrder;
import com.mailorderpharma.refill.entity.ValidateToken;
import com.mailorderpharma.refill.exception.InvalidTokenException;
import com.mailorderpharma.refill.exception.SubscriptionIdNotFoundException;
import com.mailorderpharma.refill.restclients.AuthFeign;
import com.mailorderpharma.refill.restclients.SubscriptionClient;
import com.mailorderpharma.refill.service.RefillOrderService;
import com.mailorderpharma.refill.service.RefillOrderSubscriptionService;

@AutoConfigureMockMvc
@SpringBootTest
class RefillControllerTest {

	@InjectMocks
	RefillController refillController;

	@MockBean
	RefillOrderService refillOrderService;
	
	@MockBean
	RefillOrderSubscriptionService refillOrderSubscription;


	@Mock
	RefillOrderRepository repos;

	@MockBean
	AuthFeign authClient;
	
	@MockBean
	SubscriptionClient subscriptionClient;
	
	@Autowired
	MockMvc mockMvc;

	List<RefillOrder> list = new ArrayList<>();
	List<RefillOrder> finallist = null;

	@Test
	void viewRefillStatusTestByMemberId() throws Exception {
		list.add(new RefillOrder(1, LocalDate.now(), true, (long) 1, 10, "pranav"));
		list.add(new RefillOrder(2, LocalDate.now(), true, (long) 1, 5, "pranav"));
		when(repos.findAll()).thenReturn(list);

		finallist = list.stream().filter(p -> p.getMemberId().equals("pranav")).collect(Collectors.toList());

		repos.findAll().forEach(System.out::println);

		String expectedValue = list.get(0).getMemberId();
		System.out.println("Member ID =" + expectedValue);
		ValidateToken validateToken = new ValidateToken("pranav", "pranav", true);
		ResponseEntity<ValidateToken> response = new ResponseEntity<ValidateToken>(validateToken, HttpStatus.OK);
		System.out.println(response);
		when(authClient.getValidity("Bearer Token")).thenReturn(response);
		when(refillOrderService.getStatusByMember("pranav", "Bearer Token")).thenReturn(finallist);
		MvcResult result = mockMvc
				.perform(get("/api/viewRefillStatusforAll/{mid}", "pranav").header("Authorization", "Bearer Token"))
				.andReturn();
		String actualValue = result.getResponse().getContentAsString();
		System.out.println("Actual Value" + actualValue);
		assertEquals(expectedValue, actualValue.substring(187, 193));

	}

	@Test
	void viewRefillStatusBySubId() throws Exception {
		list.add(new RefillOrder(1, LocalDate.now(), true, (long) 1, 10, "pranav"));
		list.add(new RefillOrder(2, LocalDate.now(), true, (long) 1, 5, "pranav"));
		when(repos.findAll()).thenReturn(list);

		finallist = list.stream().filter(p -> p.getSubId() == 1).collect(Collectors.toList());

		repos.findAll().forEach(System.out::println);

		ObjectMapper objectMapper = new ObjectMapper();
		String expectedValue = objectMapper.writeValueAsString(list.get(0).getId());

		System.out.println("SUB ID =" + expectedValue);
		ValidateToken validateToken = new ValidateToken("pranav", "pranav", true);
		ResponseEntity<ValidateToken> response = new ResponseEntity<ValidateToken>(validateToken, HttpStatus.OK);
		System.out.println(response);
		when(authClient.getValidity("Bearer Token")).thenReturn(response);
		when(refillOrderService.getStatus((long) 1, "Bearer Token")).thenReturn(finallist);
		MvcResult result = mockMvc
				.perform(get("/api/viewRefillStatus/{subid}", (long) 1).header("Authorization", "Bearer Token"))
				.andReturn();
		String actualValue = result.getResponse().getContentAsString();
		System.out.println("Actual Value" + actualValue);
		assertEquals(expectedValue, actualValue.substring(160, 161));

	}

	@Test
	void getRefillPaymentDuesSuccess() throws Exception {
		ArrayList<RefillOrder> list = new ArrayList<>();
		boolean finalValue;
		RefillOrder refillOrder = new RefillOrder(1, LocalDate.now(), false, 1, 3, "pranav");
		list.add(refillOrder);
		ValidateToken validateToken = new ValidateToken("pranav", "pranav", true);
		ResponseEntity<ValidateToken> response = new ResponseEntity<ValidateToken>(validateToken, HttpStatus.OK);
		when(authClient.getValidity("token")).thenReturn(response);

		List<RefillOrder> paymentDueList = list.stream().filter(p -> p.getSubId() == 1).filter(p -> (!p.getPayStatus()))
				.collect(Collectors.toList());
		boolean expectedValue = paymentDueList.isEmpty() ? false : true;

		System.out.println("Expected Value  " + expectedValue);
		when(repos.findAll()).thenReturn((ArrayList<RefillOrder>) list);
		when(refillOrderService.getRefillPaymentDues(1, "token")).thenReturn(expectedValue);
		MvcResult result = mockMvc.perform(get("/api/getRefillPaymentDues/{subscriptionId}",(long) 1)
				.header("Authorization", "token")).andReturn();
		String actualValue = result.getResponse().getContentAsString();
		
		if(actualValue.equals("true"))
			finalValue=true;
		else
			finalValue=false;
		System.out.println("Actual Value" + actualValue);
		assertEquals(expectedValue, finalValue);
	}
	
	@Test
	void getRefillPaymentDuesUnSuccess() throws Exception {
		ArrayList<RefillOrder> list = new ArrayList<>();
		boolean finalValue;
		RefillOrder refillOrder = new RefillOrder(1, LocalDate.now(), true, 1, 3, "pranav");
		list.add(refillOrder);
		ValidateToken validateToken = new ValidateToken("pranav", "pranav", true);
		ResponseEntity<ValidateToken> response = new ResponseEntity<ValidateToken>(validateToken, HttpStatus.OK);
		when(authClient.getValidity("token")).thenReturn(response);

		List<RefillOrder> paymentDueList = list.stream().filter(p -> p.getSubId() == 1).filter(p -> (!p.getPayStatus()))
				.collect(Collectors.toList());
		boolean expectedValue = paymentDueList.isEmpty() ? false : true;

		System.out.println("Expected Value  " + expectedValue);
		when(repos.findAll()).thenReturn((ArrayList<RefillOrder>) list);
		when(refillOrderService.getRefillPaymentDues(1, "token")).thenReturn(expectedValue);
		MvcResult result = mockMvc.perform(get("/api/getRefillPaymentDues/{subscriptionId}",(long) 1)
				.header("Authorization", "token")).andReturn();
		String actualValue = result.getResponse().getContentAsString();
		
		if(actualValue.equals("true"))
			finalValue=true;
		else
			finalValue=false;
		System.out.println("Actual Value" + actualValue);
		assertEquals(expectedValue, finalValue);
	}
	
	@Test
	void getall() throws Exception {

		ArrayList<RefillOrder> list = new ArrayList<>();
		RefillOrder refillOrder = new RefillOrder(1, LocalDate.now(), true, 1, 3, "pranav");
		list.add(refillOrder);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String expectedValue = objectMapper.writeValueAsString(list.get(0).getId());
		
		
		ValidateToken validateToken = new ValidateToken("pranav", "pranav", true);
		ResponseEntity<ValidateToken> response = new ResponseEntity<ValidateToken>(validateToken, HttpStatus.OK);
		when(authClient.getValidity("token")).thenReturn(response);
	    when(refillOrderSubscription.getall("token")).thenReturn(list);
		MvcResult result = mockMvc
				.perform(get("/api/viewRefillOrderSubscriptionStatus").header("Authorization", "token"))
				.andReturn();
		String actual = result.getResponse().getContentAsString();
		assertEquals(expectedValue, actual.substring(7, 8));

	}
	
	@Test
	void deleteBySubscriptionId() throws SubscriptionIdNotFoundException, InvalidTokenException {

		ArrayList<RefillOrder> list = new ArrayList<>();
		list.add(new RefillOrder(1, LocalDate.now(), true, 1, 3, "pranav"));
		ValidateToken validateToken = new ValidateToken("pranav", "pranav", true);
		ResponseEntity<ValidateToken> response = new ResponseEntity<ValidateToken>(validateToken, HttpStatus.OK);
		when(authClient.getValidity("token")).thenReturn(response);
		refillOrderSubscription.deleteBySubscriptionId(1, "token");
		int size = repos.findAll().size();
		assertEquals(list.size()-1, size);

	}
	
	
}