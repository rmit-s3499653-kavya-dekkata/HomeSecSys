package org.cloud.DataModel;

import java.util.Comparator;

public class Device {

	private String deviceId;
	private String deviceName;
	private String deviceStatus;
	private String deviceMessage;
	private String timeStamp;
	
	public Device(String timeStamp, String deviceId, String deviceName, String deviceStatus, String message) {
		this.timeStamp = timeStamp;
		this.deviceId = deviceId;
		this.deviceName = deviceName;
		this.deviceStatus = deviceStatus;
		this.deviceMessage = message;
	}
	
	public Device(String deviceName, String deviceStatus, String message) {
		this.deviceName = deviceName;
		this.deviceStatus = deviceStatus;
		this.deviceMessage = message;
	}

	/*Comparator for sorting the list by Student Name*/
    public static Comparator<Device> timeComparator = new Comparator<Device>() {

	public int compare(Device s1, Device s2) {
	   String device1 = s1.getTimeStamp().toUpperCase();
	   String device2 = s2.getTimeStamp().toUpperCase();

	   //descending order
	   return device2.compareTo(device1);

	   //descending order
	   //return StudentName2.compareTo(StudentName1);
    }};
   
	public String getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}

	public String getDeviceMessage() {
		return deviceMessage;
	}

	public void setDeviceMessage(String deviceMessage) {
		this.deviceMessage = deviceMessage;
	}

	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getDeviceStatus() {
		return deviceStatus;
	}
	public void setDeviceStatus(String deviceStatus) {
		this.deviceStatus = deviceStatus;
	}
}