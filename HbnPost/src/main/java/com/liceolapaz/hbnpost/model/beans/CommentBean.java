package com.liceolapaz.hbnpost.model.beans;

public class CommentBean {
	private String content;
	private long post_id;

	public CommentBean() {

	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getPost_id() {
		return post_id;
	}

	public void setPost_id(long post_id) {
		this.post_id = post_id;
	}
}
