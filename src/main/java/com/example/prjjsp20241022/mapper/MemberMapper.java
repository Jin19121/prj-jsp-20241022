package com.example.prjjsp20241022.mapper;

import com.example.prjjsp20241022.dto.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member
            (id, password, nickname, description)
            VALUES (#{id}, #{password}, #{nickname}, #{description})
            """)
    int insert(Member member);

    @Select("""
            SELECT * FROM member
            ORDER BY id
            """)
    List<Member> selectAll();

    @Select("""
            SELECT * FROM member
            WHERE id = #{id}
            """)
    Member selectById(String id);

    @Delete("""
            DELETE FROM member
            WHERE id = #{id}
            AND password = #{password}
            """)
    int deleteByIdAndPsd(String id, String password);

    @Update("""
            UPDATE member
            SET nickname = #{nickname},
                description = #{description}
            WHERE id = #{id}""")
    int update(Member member);

    @Update("""
            UPDATE member
            SET password = #{newPassword}
            WHERE id = #{id}
              AND password = #{oldPassword}
            """)
    int updatePassword(String id, String oldPassword, String newPassword);

    @Select("""
            SELECT *
            FROM member
            WHERE id = #{id}
              AND password = #{password}""")
    Member selectByIdAndPassword(String id, String password);
}
