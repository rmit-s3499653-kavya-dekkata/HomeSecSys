package org.cloud.controller;


import org.cloud.service.DeviceStatus;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value = "/services")
public class ApplicationController {

	DeviceStatus deviceStatus = new DeviceStatus();

	@RequestMapping(value = "/dashBoard")
	public String getData() {

		String jsonData = deviceStatus.getByAttribute();
		System.out.println("data is " + jsonData);
		if (!jsonData.isEmpty()){
			return jsonData;
		}else{
			return "failure";
		}
	}
}