package org.cloud.service;

import java.util.ArrayList;
import java.util.Collections;

import org.cloud.DataModel.Device;
import org.json.JSONObject;

import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;
import com.google.gson.Gson;

public class DeviceStatus {
	public static final AWSCredentialsProvider CREDENTIALS_PROVIDER = new ClasspathPropertiesFileCredentialsProvider();
	public static final Region REGION = Region.getRegion(Regions.US_EAST_1);
	public static String TABLE_NAME;
	public static AmazonDynamoDBClient DB_CLIENT = new AmazonDynamoDBClient(CREDENTIALS_PROVIDER);
	static DynamoDB dynamoDB = new DynamoDB(new AmazonDynamoDBClient(new ProfileCredentialsProvider()));
	static String tableName = "devices";

	Gson gson = new Gson();
	DeviceAlerts alerts = new DeviceAlerts();
	private ArrayList<Device> deviceList = new ArrayList<Device>();

	//Function for querying a specific attribute of the database
	//Returns a List of user maps
	//Selected attribute is passed in to query with value List<Map<String, AttributeValue>>
	public String HistoryData()
	{	
		deviceList.clear();
		String deviceJson = "";
		DB_CLIENT.setRegion(REGION);
		ScanResult result;

		//ScanRequest scanRequest = new ScanRequest().withTableName(tableName).withScanFilter(conditions);
		ScanRequest scanRequest = new ScanRequest().withTableName("devices");
		//Scan database for presence of query values
		result = DB_CLIENT.scan(scanRequest);

		//Print results to console for diagnostics
		for(int i = 0; i < result.getCount(); i++)
		{
			//System.out.println(result.getItems().get(i).get("deviceId").getS());
			String deviceId = result.getItems().get(i).get("deviceId").getS();
            deviceId = deviceId.replace("\"", "");
            String deviceName = result.getItems().get(i).get("deviceName").getS();
            deviceName = deviceName.replace("\"", "");
            String deviceStatus =result.getItems().get(i).get("status").getS();
            deviceStatus = deviceStatus.replace("\"", "");
            String deviceMessage = result.getItems().get(i).get("message").getS();
            deviceMessage = deviceMessage.replace("\"", "");
            String timeStamp = result.getItems().get(i).get("timeStamp").getS();
            timeStamp = timeStamp.replace("\"", "");

			Device deviceDetails = new Device(timeStamp, deviceId, deviceName, deviceStatus,deviceMessage);
			deviceList.add(deviceDetails);
			deviceJson = gson.toJson(deviceList);

		}

		//Return JSON in string format 
		return returnPage("1");

	}


	public String returnPage(String pageNo) {
		String pageJson = "";
		Gson gson = new Gson();
	
		if(pageNo.equalsIgnoreCase("last")) {
			double pge = deviceList.size()/7.0;
			int page = (int) Math.ceil(pge);
			System.out.println(pge + " " + page);
			ArrayList<Device> pageSpeeds = new ArrayList<Device>(deviceList.subList(((page*7) - 7) , deviceList.size()));
			pageJson = gson.toJson(pageSpeeds);			
			return pageJson+":::"+page+":::"+deviceList.size();
		} else {
			double pge = Double.parseDouble(pageNo)*7;
			int page = (int) Math.floor(pge);
			ArrayList<Device> pageSpeeds = new ArrayList<Device>(deviceList.subList(page-7, page));
			pageJson = gson.toJson(pageSpeeds);
			return pageJson+":::"+pageNo+":::"+deviceList.size();
		}
	}


	public String AlertData(String userStatus){
		ArrayList<Device> lastestDevices = new ArrayList<Device>();
		Collections.sort(deviceList, Device.timeComparator);
		int i = 0;
		
			for(Device str: deviceList){
				System.out.println(i);
				if(i < 7){
				lastestDevices.add(str);
				i++;
			}
		}
		System.out.println(" size is " + lastestDevices.size());
		String alertJson = alerts.DeviceAlert(lastestDevices, userStatus);
		lastestDevices.clear();
		return alertJson;
	}

}


