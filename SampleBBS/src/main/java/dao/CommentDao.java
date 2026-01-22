package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Comment;

public class CommentDao extends Dao {

    public List<Comment> findByArticleId(int articleId) {
        List<Comment> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = this.createConnection();
            String sql = "select * from comments where article_id=? order by created_at asc";
            ps = con.prepareStatement(sql);
            ps.setInt(1, articleId);
            rs = ps.executeQuery();

            if (rs.first()) {
                do {
                    Comment c = new Comment();
                    c.setCommentId(rs.getInt("comment_id"));
                    c.setArticleId(rs.getInt("article_id"));
                    c.setUserId(rs.getString("user_id"));
                    c.setBody(rs.getString("body"));
                    c.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(c);
                } while (rs.next());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (ps != null) ps.close(); } catch (SQLException e) {}
            if (con != null) this.closeConnection(con);
        }

        return list;
    }

    public void insert(Comment c) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = this.createConnection();
            String sql = "insert into comments(article_id, user_id, body, created_at) values(?, ?, ?, now())";
            ps = con.prepareStatement(sql);
            ps.setInt(1, c.getArticleId());
            ps.setString(2, c.getUserId());
            ps.setString(3, c.getBody());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch (SQLException e) {}
            if (con != null) this.closeConnection(con);
        }
    }
}
