package com.mailorderpharma.refill.restclients;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

import com.mailorderpharma.refill.entity.ValidateToken;

@FeignClient(name = "${authservice.client.name}",
url = "${authservice.client.url}")
public interface AuthFeign {

	@GetMapping(value = "/validate")
	public ResponseEntity<ValidateToken> getValidity(@RequestHeader("Authorization") final String token);
}
