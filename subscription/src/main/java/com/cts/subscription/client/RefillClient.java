package com.cts.subscription.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

import com.cts.subscription.exception.InvalidTokenException;

@FeignClient(name = "${refill.client.name}", url = "${refill.client.url}")
public interface RefillClient {

	@GetMapping("/getRefillPaymentDues/{subscriptionId}")
	public boolean getRefillPaymentDues(@RequestHeader("Authorization") String token,
			@PathVariable("subscriptionId") long subscriptionId) throws InvalidTokenException;

	@DeleteMapping(path = "/deleteBySubscriptionId/{subscriptionId}")
	public void deleteBySubscriptionId(@RequestHeader("Authorization") String token,
			@PathVariable("subscriptionId") long subscriptionId) throws InvalidTokenException;

}
