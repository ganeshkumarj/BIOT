package com.innovation.iot.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class Message {

	private int id;
	private List<MessageContent> messages;
	private String intervel;
	private String createdBy;
	private String profileImage;
	private Timestamp startTimeStamp;
	private Timestamp endTimeStamp;

	public Message(int id, List<MessageContent> messages, String intervel, String createdBy, String profileImage,
			Timestamp start, Timestamp end) {
		this.id = id;
		this.messages = messages;
		this.intervel = intervel;
		this.createdBy = createdBy;
		this.profileImage = profileImage;
		this.startTimeStamp = start;
		this.endTimeStamp = end;
	}

	public Message(int id, List<MessageContent> messages, String createdBy, String profileImage, Date start) {
		this(id, messages, null, createdBy, profileImage, getTimeStamp(start), null);
	}
	
	
	private static Timestamp getTimeStamp(Date startDate){
		return new Timestamp(startDate.getTime());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIntervel() {
		return intervel;
	}

	public void setIntervel(String intervel) {
		this.intervel = intervel;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	
	public Timestamp getStartTimeStamp() {
		return startTimeStamp;
	}

	public void setStartTimeStamp(Timestamp startTimeStamp) {
		this.startTimeStamp = startTimeStamp;
	}

	public Timestamp getEndTimeStamp() {
		return endTimeStamp;
	}

	public void setEndTimeStamp(Timestamp endTimeStamp) {
		this.endTimeStamp = endTimeStamp;
	}

	public List<MessageContent> getMessages() {
		return messages;
	}

	public void setMessages(List<MessageContent> messages) {
		this.messages = messages;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", messages=" + messages + ", intervel="
				+ intervel + ", createdBy=" + createdBy + ", profileImage="
				+ profileImage + ", startTimeStamp=" + startTimeStamp
				+ ", endTimeStamp=" + endTimeStamp + "]";
	}

	

}
