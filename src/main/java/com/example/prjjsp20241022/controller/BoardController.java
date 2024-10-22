package com.example.prjjsp20241022.controller;

import com.example.prjjsp20241022.dto.Board;
import com.example.prjjsp20241022.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    //게시물 CRUD
    private final BoardService service;

    //게시물 작성 경로 /board/new
    @GetMapping("new")
    public void newBoard() {
        // /WEB-INF/view/board/new.jsp
    }

    @PostMapping("new")
    public String newBoard(Board board, RedirectAttributes rttr) {
        service.add(board);

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
        List<Board> list = service.list(page);
        model.addAttribute("boardList", list);
//        model.addAttribute("boardList", service.list());

        //현재 페이지
        model.addAttribute("currentPage", page);

        //페이지 번호의 오른쪽 끝 값
        Integer endRight = ((page - 1) / 10 + 1) * 10;
        model.addAttribute("endRight", endRight);

        //페이지 왼쪽
        Integer endLeft = endRight - 9;
        model.addAttribute("endLeft", endLeft);

        //다음
        Integer nextPage = endRight + 1;
        model.addAttribute("next", nextPage);

        //이전
        Integer prevPage = endLeft - 1;
        model.addAttribute("prev", prevPage);

        //마지막 페이지 연산
        Integer lastPage = service.count();
        model.addAttribute("lastPage", lastPage);
    }

    //각 게시글
    @GetMapping("view")
    public void viewBoard(Integer id, Model model) {
        Board board = service.get(id);
        model.addAttribute("board", board);
    }

    //삭제
    @PostMapping("delete")
    public String deleteBoard(Integer id, RedirectAttributes rttr) {
        service.remove(id);

        rttr.addFlashAttribute("message",
                Map.of("type", "warning",
                        "text", id + "번 게시물 삭제 완료"));
        return "redirect:/board/list";
    }

    //수정
    @GetMapping("edit")
    public void editBoard(Integer id, Model model) {
        Board board = service.get(id);
        model.addAttribute("board", board);
    }

    @PostMapping("edit")
    public String editBoard(Board board, RedirectAttributes rttr) {
        service.update(board);

        rttr.addFlashAttribute("message",
                Map.of("type", "edited",
                        "text", board.getId() + "번 게시물 수정 완료"));
        rttr.addAttribute("id", board.getId());
        return "redirect:/board/view";
    }
}
