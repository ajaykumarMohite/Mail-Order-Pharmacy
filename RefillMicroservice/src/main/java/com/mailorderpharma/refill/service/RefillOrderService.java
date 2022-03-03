package com.mailorderpharma.refill.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mailorderpharma.refill.entity.RefillOrder;
import com.mailorderpharma.refill.exception.DrugQuantityNotAvailable;
import com.mailorderpharma.refill.exception.InvalidTokenException;
import com.mailorderpharma.refill.exception.RefillEmptyException;
import com.mailorderpharma.refill.exception.SubscriptionIdNotFoundException;
import com.mailorderpharma.refill.exception.SubscriptionListEmptyException;
import com.mailorderpharma.refill.exception.SubscriptionNotFoundException;

import feign.FeignException;

@Service
public interface RefillOrderService {

	public List<RefillOrder> getStatus(long subId, String token)
			throws SubscriptionIdNotFoundException, InvalidTokenException;
		
	public List<RefillOrder> getStatusByMember(String memberId, String token)
			throws InvalidTokenException, RefillEmptyException;

	public RefillOrder requestAdhocRefill(Long subId, Boolean payStatus, int quantity, String location, String token,String memberId)
			throws ParseException, FeignException, InvalidTokenException, DrugQuantityNotAvailable, SubscriptionNotFoundException;
	
	public boolean getRefillPaymentDues(long subscriptionId, String token) throws InvalidTokenException;

	public List<RefillOrder> getRefillDuesAsOfDate(String memberId, String date, String token) throws InvalidTokenException, SubscriptionListEmptyException;

}
