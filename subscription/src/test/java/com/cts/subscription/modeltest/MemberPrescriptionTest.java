package com.cts.subscription.modeltest;


import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;



import org.junit.jupiter.api.Test;

import com.cts.subscription.model.MemberPrescription;


 class MemberPrescriptionTest {

	LocalDate date = LocalDate.now();  
	 
	 
	 MemberPrescription memberPrescription = new MemberPrescription();
	 
	 	@Test
		 void prescriptionDetailssetTest()
		{
	 		memberPrescription.setId(1L);
	 		memberPrescription.setDoctorDetails("Ajay");
	 		memberPrescription.setDosage("2 times");
	 		memberPrescription.setDrugName("Paracetamol");
	 		memberPrescription.setInsuranceProvider("MediBuddy");
	 		memberPrescription.setMemberLocation("Pune");
	 		memberPrescription.setQuantity(2);
	 		memberPrescription.setPolicyNumber("2E44");
	 		memberPrescription.setCourseDuration(2);
	 		memberPrescription.setDate(LocalDate.now());
	 		
	 		assertEquals(1L,memberPrescription.getId());
	 		assertEquals("Ajay",memberPrescription.getDoctorDetails());
	 		assertEquals("2 times",memberPrescription.getDosage());
	 		assertEquals("Paracetamol",memberPrescription.getDrugName());
	 		assertEquals("MediBuddy",memberPrescription.getInsuranceProvider());
	 		assertEquals("Pune",memberPrescription.getMemberLocation());
	 		assertEquals(2, memberPrescription.getQuantity());
	 		assertEquals("2E44", memberPrescription.getPolicyNumber());
	 		assertEquals(2, memberPrescription.getCourseDuration());
	 		assertEquals(LocalDate.now(), memberPrescription.getDate());
	 		
		}

}
