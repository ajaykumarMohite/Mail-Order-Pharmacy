package com.cts.subscription.controllertest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import com.cts.subscription.client.AuthClient;
import com.cts.subscription.client.DrugClient;
import com.cts.subscription.client.RefillClient;
import com.cts.subscription.controller.SubscriptionController;
import com.cts.subscription.model.AuthResponse;
import com.cts.subscription.model.DrugDetails;
import com.cts.subscription.model.DrugLocationDetails;
import com.cts.subscription.model.MemberPrescription;
import com.cts.subscription.model.MemberSubscription;
import com.cts.subscription.model.ResponseForSuccess;
import com.cts.subscription.repository.MemberPrescriptionRepository;
import com.cts.subscription.repository.MemberSubscriptionRepository;
import com.cts.subscription.service.SubscriptionService;

@AutoConfigureMockMvc
@SpringBootTest
class RestControllerTest {

	@InjectMocks
	private SubscriptionController subscriptionController;

	@Mock
	private SubscriptionService subscriptionService;

	@MockBean
	MemberPrescriptionRepository memberPrescriptionRepository;

	@MockBean
	MemberSubscriptionRepository memberSubscriptionRepository;

	@MockBean
	private AuthClient authClient;

	@MockBean
	private DrugClient drugClient;

	@MockBean
	private RefillClient refillClient;

	@Autowired
	private MockMvc mockMvc;

	List<DrugLocationDetails> list = new ArrayList<DrugLocationDetails>();

	@Test
	void subscribeTest() throws Exception {

		list.add(new DrugLocationDetails("C001", "Chennai", 30, null));
		DrugDetails expected = new DrugDetails("C001", "Paracetamol", "Dr. Mandar", new Date(), new Date(), list);

		MemberPrescription memberPrescription = new MemberPrescription(12001L, "ajay", "Chennai", "6754", "MediBuddy",
				LocalDate.now(), "2times", 3, "Paracetamol", "Dr. Nachiket", 3);
		MemberSubscription memberSubscription = new MemberSubscription(1L, memberPrescription.getId(),
				memberPrescription.getMemberId(), memberPrescription.getDate(), memberPrescription.getQuantity(),
				memberPrescription.getDrugName(), memberPrescription.getCourseDuration(),
				memberPrescription.getMemberLocation(), "active");

		AuthResponse authResponse = new AuthResponse("ajay", "ajay", true);

		ResponseEntity<AuthResponse> response = new ResponseEntity<AuthResponse>(authResponse, HttpStatus.OK);
		ResponseEntity<Object> res = new ResponseEntity<>(new ResponseForSuccess("Refill Done Successfully"),
				HttpStatus.OK);
		ResponseEntity<String> subscriptionResponse = new ResponseEntity<String>(
				"You have successfully subscribed to " + memberPrescription.getDrugName(), HttpStatus.OK);

		when(authClient.getValidity("Bearer Token")).thenReturn(response);

		when(drugClient.getDrugByName("Bearer Token", "Paracetamol")).thenReturn(expected);

		when(drugClient.updateQuantity("Bearer Token", "Paracetamol", "Chennai", 3)).thenReturn(res);

		when(memberPrescriptionRepository.save(any(MemberPrescription.class))).thenReturn(memberPrescription);

		when(memberSubscriptionRepository.save(any(MemberSubscription.class))).thenReturn(memberSubscription);

		when(subscriptionService.subscribe("Bearer Token", memberPrescription)).thenReturn(subscriptionResponse);

		MvcResult result = mockMvc.perform(post("/api/subscribe").header("Authorization", "Bearer Token")
				.contentType(MediaType.APPLICATION_JSON)
				.content(
						"{ \"courseDuration\": 1, \"date\": \"2021-02-02\", \"doctorDetails\": \"Dr. Nachiket\", \"dosage\": \"2times\", \"drugName\": \"Paracetamol\", \"id\": 1, \"insuranceProvider\": \"MediBuddy\", \"memberId\": \"ajay\", \"memberLocation\": \"Chennai\", \"policyNumber\": \"6754\", \"quantity\": 3}")

				.accept(MediaType.APPLICATION_JSON))

				.andReturn();

		assertEquals(subscriptionResponse.getBody(), result.getResponse().getContentAsString());
	}

	@Test
	void unsubscribeTest() throws Exception {
		AuthResponse authResponse = new AuthResponse("ajay", "ajay", true);
		ResponseEntity<AuthResponse> response = new ResponseEntity<AuthResponse>(authResponse, HttpStatus.OK);
		ResponseEntity<String> responseEntity = new ResponseEntity<String>("You have succesfully Unsubscribed",
				HttpStatus.OK);
		String expected = "You have succesfully Unsubscribed";

		when(authClient.getValidity("Bearer Token")).thenReturn(response);
		when(refillClient.getRefillPaymentDues("Bearer Token", 1L)).thenReturn(false);
		when(subscriptionService.unsubscribe("Bearer Token", "ajay", 1L)).thenReturn(responseEntity);
		MvcResult result = mockMvc.perform(post("/api/unsubscribe/ajay/1").header("Authorization", "Bearer Token"))
				.andReturn();

		String actual = result.getResponse().getContentAsString();

		assertEquals(expected, actual);
	}

	@Test
	void unsubscribeRefillDueTest() throws Exception {
		AuthResponse authResponse = new AuthResponse("ajay", "ajay", true);
		ResponseEntity<AuthResponse> response = new ResponseEntity<AuthResponse>(authResponse, HttpStatus.OK);
		ResponseEntity<String> responseEntity = new ResponseEntity<String>("You have to clear your payment dues first.",
				HttpStatus.OK);
		String expected = "You have to clear your payment dues first.";

		when(authClient.getValidity("Bearer Token")).thenReturn(response);
		when(refillClient.getRefillPaymentDues("Bearer Token", 1L)).thenReturn(true);
		when(subscriptionService.unsubscribe("Bearer Token", "ajay", 1L)).thenReturn(responseEntity);
		MvcResult result = mockMvc.perform(post("/api/unsubscribe/ajay/1").header("Authorization", "Bearer Token"))
				.andReturn();

		String actual = result.getResponse().getContentAsString();

		assertEquals(expected, actual);
	}

}
