package com.mailorderpharma.refill.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mailorderpharma.refill.dao.RefillOrderRepository;
import com.mailorderpharma.refill.entity.RefillOrder;
import com.mailorderpharma.refill.exception.InvalidTokenException;
import com.mailorderpharma.refill.restclients.AuthFeign;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RefillOrderSubscriptionServiceImpl implements RefillOrderSubscriptionService {


	@Autowired
	RefillOrderRepository refillOrderRepository;
	
	@Autowired
	private AuthFeign authFeign;

	String msg = "Invalid Credentials";

	@Override
	public List<RefillOrder> getall(String token) throws InvalidTokenException {
		log.info("inside getall method");

		if (authFeign.getValidity(token).getBody().isValid()) {
			return refillOrderRepository.findAll();
		} else
			throw new InvalidTokenException(msg);
	}

	@Override
	@Transactional
	public void deleteBySubscriptionId(long subscriptionId, String token) throws InvalidTokenException {
		
		log.info("inside deleteBySubscriptionId method");
 
		if (authFeign.getValidity(token).getBody().isValid()) {
			refillOrderRepository.deleteBySubscriptionId(subscriptionId);
		} else
			throw new InvalidTokenException(msg);
	}

}
