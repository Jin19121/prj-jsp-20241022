package com.example.prjjsp20241022.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Member {
    private String id;
    private String password;
    private String nickname;
    private String description;
    private LocalDateTime inserted;
}