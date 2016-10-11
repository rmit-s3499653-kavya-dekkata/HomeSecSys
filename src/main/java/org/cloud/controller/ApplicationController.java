package org.cloud.controller;


import org.cloud.service.DeviceStatus;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value = "/services")
public class ApplicationController {

	DeviceStatus deviceStatus = new DeviceStatus();
	
	
	@RequestMapping(value = "/dashBoard")
	public String getData() {

		String jsonData = deviceStatus.HistoryData();
		//System.out.println("data is " + jsonData);
		if (!jsonData.isEmpty()){
			return jsonData;
		}else{
			return "failure";
		}
	}
	
	@RequestMapping(value = "/alerts")
	public String getAlerts() {

		String jsonData = deviceStatus.AlertData();
		System.out.println("data is " + jsonData);
		if (!jsonData.isEmpty()){
			return jsonData;
		}else{
			return "failure";
		}
	}
	
	@RequestMapping(value = "/historyPagination", method = RequestMethod.POST)
	public String getPages(@RequestBody String data) {
		JSONObject obj = new JSONObject(data);
		String jsonData = deviceStatus.returnPage(obj.getString("PAGE"));
		System.out.println("data is " + jsonData);
		if (!jsonData.isEmpty()){
			return jsonData;
		}else{
			return "failure";
		}
	}
}