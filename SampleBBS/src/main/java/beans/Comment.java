package beans;

import java.sql.Timestamp;


public class Comment {
    private int commentId;
    private int articleId;
    private String userId;
    private String body;
    private Timestamp createdAt;

    public int getCommentId() { return commentId; }
    public void setCommentId(int commentId) { this.commentId = commentId; }

    public int getArticleId() { return articleId; }
    public void setArticleId(int articleId) { this.articleId = articleId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getBody() { return body; }
    public void setBody(String body) { this.body = body; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
