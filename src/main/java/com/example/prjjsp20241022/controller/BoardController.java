package com.example.prjjsp20241022.controller;

import com.example.prjjsp20241022.dto.Board;
import com.example.prjjsp20241022.dto.Member;
import com.example.prjjsp20241022.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    //게시물 CRUD
    private final BoardService service;

    //게시물 작성 경로 /board/new
    @GetMapping("new")
    public String newBoard(@SessionAttribute(value = "loggedInMember", required = false) Member member,
                           RedirectAttributes rttr) {
        // /WEB-INF/view/board/new.jsp
//        Object o = session.getAttribute("loggedInMember");
//        System.out.println("o = " + o);//login 전엔 null, 로그인 후엔 회원 정보

        if (member == null) {
            // 로그인 안한 상태
            rttr.addFlashAttribute("message", Map.of("type", "warning",
                    "text", "로그인한 회원만 글 작성이 가능합니다."));
            return "redirect:/member/login";
        } else {
            // 로그인 한 상태
            return "board/new";
        }
    }

    @PostMapping("new")
    public String newBoard(Board board, RedirectAttributes rttr,
                           @SessionAttribute("loggedInMember") Member member) {
        service.add(board, member);

        rttr.addFlashAttribute("message",
                Map.of("type", "success",
                        "text", "새 게시물 등록 완료"));
        rttr.addAttribute("id", board.getId());
        return "redirect:/board/view";
    }

    //게시글 list + page 나눔
    @GetMapping("list")
    public void listBoard(@RequestParam(name = "page", defaultValue = "1") Integer page,
                          Model model) {
        //한 페이지에 10개 게시물 표시

        Map<String, Object> result = service.list(page);
        model.addAllAttributes(result);
//        model.addAttribute("boardList", service.list());


    }

    //각 게시글
    @GetMapping("view")
    public void viewBoard(Integer id, Model model) {
        Board board = service.get(id);
        model.addAttribute("board", board);
    }

    //삭제
    @PostMapping("delete")
    public String deleteBoard(Integer id, RedirectAttributes rttr,
                              @SessionAttribute("loggedInMember") Member member) {
        try {
            service.remove(id, member);

            rttr.addFlashAttribute("message",
                    Map.of("type", "warning",
                            "text", id + "번 게시물 삭제 완료"));
            return "redirect:/board/list";
        } catch (RuntimeException e) {
            rttr.addFlashAttribute("message", Map.of("type", "danger",
                        "text", id + "번 게시물 삭제 권한이 없습니다."));
            rttr.addAttribute("id", id);
            return "redirect:/board/view";
        }
    }

    //수정
    @GetMapping("edit")
    public String editBoard(Integer id,
                            Model model,
                            RedirectAttributes rttr,
                            @SessionAttribute("loggedInMember") Member member) {
        Board board = service.get(id);
        if (board.getWriter().equals(member.getId())) {
            model.addAttribute("board", board);
            return null;
        } else {
            rttr.addFlashAttribute("message",
                    Map.of("type", "danger",
                            "text", "게시물 수정권한이 없습니다."));
            return "redirect:/member/login";
        }
    }

    @PostMapping("edit")
    public String editBoard(Board board, RedirectAttributes rttr,
                            @SessionAttribute("loggedInMember") Member member) {
        try {
            service.update(board, member);

            rttr.addFlashAttribute("message",
                    Map.of("type", "warning",
                            "text", board.getId() + "번 게시물 수정 완료"));
        } catch (RuntimeException e) {
            rttr.addFlashAttribute("message",
                    Map.of("type", "danger",
                            "text", board.getId() + "번 게시물 수정 수정 권한 없음"));
        }
        rttr.addAttribute("id", board.getId());
        return "redirect:/board/view";
    }
}
