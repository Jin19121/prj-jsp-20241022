package com.example.prjjsp20241022.mapper;

import com.example.prjjsp20241022.dto.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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
            ORDER BY inserted DESC
            """)
    List<Member> selectAll();

    @Select("""
            SELECT * FROM member
            WHERE id = #{id}
            """)
    Member selectById(String id);
}
