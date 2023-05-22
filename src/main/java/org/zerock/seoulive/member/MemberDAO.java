package org.zerock.seoulive.member;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.Date;

public class MemberDAO {
    public void update(Connection conn, Member member) throws SQLException {
        try (PreparedStatement pstmt = conn.prepareStatement(
                "update member set name = ?, password = ? where memberid = ?")) {
//            pstmt.setString(1, member.getName());
//            pstmt.setString(2, member.getPassword());
//            pstmt.setString(3, member.getId());
            pstmt.executeUpdate();
        }
    }

} // end class
