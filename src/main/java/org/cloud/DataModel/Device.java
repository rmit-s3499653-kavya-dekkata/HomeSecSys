package org.cloud.DataModel;

public class Device {

	private String deviceId;
	private String deviceName;
	private String deviceStatus;
	
	public Device(String deviceId, String deviceName, String deviceStatus) {
		super();
		this.deviceId = deviceId;
		this.deviceName = deviceName;
		this.deviceStatus = deviceStatus;
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