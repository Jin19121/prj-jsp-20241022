package com.example.prjjsp20241022.controller;

import com.example.prjjsp20241022.dto.Member;
import com.example.prjjsp20241022.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
    private final MemberService service;

    @GetMapping("signup")
    public void signup() {
    }

    @PostMapping("signup")
    public String signupProcess(Member member, RedirectAttributes rttr) {
        System.out.println("member = " + member);
        service.addMember(member);

        rttr.addFlashAttribute("message",
                Map.of("type", "success", "text", "회원 가입 완료"));
        rttr.addAttribute("id", member.getId());
        return "redirect:/member/view";
    }

    @GetMapping("list")
    public void list(Model model) {
        model.addAttribute("memberList", service.list());
    }

    @GetMapping("view")
    public void info(String id, Model model) {
        Member member = service.info(id);
        model.addAttribute("member", member);
    }


    @GetMapping("edit")
    public void edit(String id, Model model) {
        Member member = service.info(id);
        model.addAttribute("member", member);
    }

    @PostMapping("edit")
    public String editMember(Member member, RedirectAttributes rttr) {
        service.updateMember(member);

        rttr.addFlashAttribute("message",
                Map.of("type", "warning",
                        "text", member.getId() + " 회원 정보 수정 완료"));
        rttr.addAttribute("id", member.getId());
        return "redirect:/member/view";
    }
}
