package com.innovation.iot.core;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import com.innovation.iot.domain.Device;
import com.innovation.iot.domain.Message;
import com.innovation.iot.domain.NoDataFoundException;
import com.innovation.iot.domain.User;
import com.innovation.iot.persistence.MessageDao;
import com.innovation.iot.representation.Notification;
import com.innovation.iot.representation.Status;

public class NotificationManager {

	private static final NotificationManager instance = new NotificationManager();

	private NotificationManager() {

	}

	public static NotificationManager getInstance() {
		return instance;
	}

	public String getNotifications(String deviceId, String userCode) {
		MessageDao dao = new MessageDao();
		ObjectMapper mapper = new ObjectMapper();
		Status status = null;
		String notifications = "";
		Notification notification = new Notification();
		try {
			User user = dao.getUser(userCode);
			Device device = dao.getDevice(deviceId);
			List<Message> messages = dao.getMessages(deviceId, userCode);
			notification.setAnnouncements(messages);
			notification.setUser(user);
			notification.setDevice(device);
			status = new Status();
			status.setCode("OK");
		} catch (ClassNotFoundException | SQLException | NoDataFoundException e) {
			status= new Status();
			status.setCode("KO");
			status.setDescription("Problem Occured");
		}
		notification.setStatus(status);
		try {
			notifications = mapper.writeValueAsString(notification);
		} catch (IOException e) {
			status= new Status();
			status.setCode("KO");
			status.setCode("Problem Occured");
		}
		notification.setStatus(status);
		return notifications;
	}

}
