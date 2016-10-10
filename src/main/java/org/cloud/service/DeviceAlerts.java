package org.cloud.service;

import java.util.ArrayList;

import org.cloud.DataModel.Device;

import com.google.gson.Gson;

public class DeviceAlerts {

	Gson gson = new Gson();
	static ArrayList<Device> alertList = new ArrayList<Device>();
	public String DeviceAlert(ArrayList<Device> deviceList){

		
		String alertJson = "";

		for(Device device: deviceList){
			String name = device.getDeviceName();
			String status = device.getDeviceStatus();
			String message = device.getDeviceMessage();
			Device deviceAlerts = computeAlert(name, status, message);
			alertList.add(deviceAlerts);
			alertJson = gson.toJson(alertList);
		}

		return alertJson;
	}

	public static Device computeAlert(String name, String status, String message){

		
		if((name.equalsIgnoreCase("\"door\"")) || (name.equalsIgnoreCase("\"window\""))
				|| (name.equalsIgnoreCase("\"glass\""))){
			if((status.equalsIgnoreCase("\"unlocked\"")) || (status.equalsIgnoreCase("\"broken\""))){
				return new Device(name,status,message);
			}
		}
		if((name.equalsIgnoreCase("\"camera")) && (status.equalsIgnoreCase("\"inactive\""))){
			return new Device(name,status,message);
		}
		if((name.equalsIgnoreCase("\"lights\"")) && (status.equalsIgnoreCase("\"off\""))){
			return new Device(name,status,message);
		}
		if((name.equalsIgnoreCase("\"fireAlaram\"")) && (status.equalsIgnoreCase("\"triggered\""))){
			return new Device(name,status,message);
		}
		if(name.equalsIgnoreCase("\"thermostat\"")){
			String temp = status.replace("\"", " ");
			System.out.println("termo "+ temp);
			if(Integer.parseInt(temp.trim()) > 40){
				return new Device(name,status,message);
			}
		}
		return null;

	}
}
