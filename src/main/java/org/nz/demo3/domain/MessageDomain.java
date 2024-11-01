package org.nz.demo3.domain;

public class MessageDomain {
    private String id;
    private String name;
    private String message;
    private String created_at;
    private String content;
    private String sender; // 新添加的发送者属性

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    // 新添加的setSender方法
    public void setSender(String sender) {
        this.sender = sender;
    }
}
