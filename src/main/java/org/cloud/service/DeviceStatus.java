package org.cloud.service;

import java.util.ArrayList;
import org.cloud.DataModel.Device;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;
import com.google.gson.Gson;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;

public class DeviceStatus {
	public static final AWSCredentialsProvider CREDENTIALS_PROVIDER = new ClasspathPropertiesFileCredentialsProvider();
	public static final Region REGION = Region.getRegion(Regions.US_WEST_2);
	public static String TABLE_NAME;
	public static AmazonDynamoDBClient DB_CLIENT = new AmazonDynamoDBClient(CREDENTIALS_PROVIDER);

	Gson gson = new Gson();

	//Function for querying a specific attribute of the database
	//Returns a List of user maps
	//Selected attribute is passed in to query with value List<Map<String, AttributeValue>>
	public String getByAttribute()
	{
		ArrayList<Device> deviceList = new ArrayList<Device>();
		String deviceJson = "";
		DB_CLIENT.setRegion(REGION);
		ScanResult result;

		//ScanRequest scanRequest = new ScanRequest().withTableName(tableName).withScanFilter(conditions);
		ScanRequest scanRequest = new ScanRequest().withTableName("device");
		//Scan database for presence of query values
		result = DB_CLIENT.scan(scanRequest);

		//Print results to console for diagnostics
		for(int i = 0; i < result.getCount(); i++)
		{
			System.out.println(result.getItems().get(i).get("deviceId").getS());
			String deviceId = result.getItems().get(i).get("deviceId").getS();
			String deviceName = result.getItems().get(i).get("deviceName").getS();
			String deviceStatus =result.getItems().get(i).get("status").getS();

			Device deviceDetails = new Device(deviceId, deviceName, deviceStatus);
			deviceList.add(deviceDetails);
			deviceJson = gson.toJson(deviceList);

		}

		//Return JSON in string format 
		return deviceJson;

	}

}


