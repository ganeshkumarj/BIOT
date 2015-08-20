package com.innovation.iot.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.innovation.iot.core.NotificationManager;

@Path("/notifications")
public class NotificationService {
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("{deviceId}")
	public String getNotifications(@PathParam("deviceId") String deviceId, @QueryParam("userCode") String userCode){
		
		return NotificationManager.getInstance().getNotifications(deviceId, userCode);
	}
	
}
