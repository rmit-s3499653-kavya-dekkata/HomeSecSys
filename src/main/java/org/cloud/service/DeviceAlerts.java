package org.cloud.service;

import java.util.ArrayList;

import org.cloud.DataModel.Device;

import com.google.gson.Gson;

public class DeviceAlerts {

	Gson gson = new Gson();
	static ArrayList<Device> alertList = new ArrayList<Device>();
	public String DeviceAlert(ArrayList<Device> deviceList, String userStatus){

		alertList.clear();
		String alertJson = "";

		for(Device device: deviceList){
			String name = device.getDeviceName();
			String status = device.getDeviceStatus();
			String message = device.getDeviceMessage();
			Device deviceAlerts = computeAlert(name, status, message, userStatus);
			if(deviceAlerts != null)
				alertList.add(deviceAlerts);
			alertJson = gson.toJson(alertList);
		}

		return alertJson+":::"+alertList.size();
	}

	public static Device computeAlert(String name, String status, String message, String userStatus){

        if(userStatus.equalsIgnoreCase("Home")){
            if((name.equalsIgnoreCase("Door")) || (name.equalsIgnoreCase("Window"))
                    || (name.equalsIgnoreCase("Glass"))){
                if(status.equalsIgnoreCase("broken")){
                    return new Device(name,status,message);
                }
            }
            if((name.equalsIgnoreCase("FireAlarm")) && (status.equalsIgnoreCase("triggered"))){
                return new Device(name,status,message);
            }
            if(name.equalsIgnoreCase("Thermostat")){
//                String temp = status.replace("\"", " ");
                if(Integer.parseInt(status.trim()) > 40){
                    return new Device(name,status,message);
                }
            }
        }
        else if(userStatus.equalsIgnoreCase("away")){
            if((name.equalsIgnoreCase("Door")) || (name.equalsIgnoreCase("Window"))
                    || (name.equalsIgnoreCase("Glass"))){
                if((status.equalsIgnoreCase("unlocked")) || (status.equalsIgnoreCase("broken"))){
                    return new Device(name,status,message);
                }
            }
            if((name.equalsIgnoreCase("Camera")) && (status.equalsIgnoreCase("inactive"))){
                return new Device(name,status,message);
            }
            if((name.equalsIgnoreCase("Lights")) && (status.equalsIgnoreCase("off"))){
                return new Device(name,status,message);
            }
            if((name.equalsIgnoreCase("FireAlarm")) && (status.equalsIgnoreCase("triggered"))){
                return new Device(name,status,message);
            }
            if(name.equalsIgnoreCase("Thermostat")){
//                String temp = status.replace("\"", " ");
                if(Integer.parseInt(status.trim()) > 40){
                    return new Device(name,status,message);
                }
            }
        }
        return null;

    }
}
