package com.example.prjjsp20241022.mapper;

import com.example.prjjsp20241022.dto.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member
            (id, password, nickname, description)
            VALUES (#{id}, #{password}, #{nickname}, #{description})
            """)
    int insert(Member member);
}
