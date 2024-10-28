package com.example.prjjsp20241022.service;

import com.example.prjjsp20241022.dto.Board;
import com.example.prjjsp20241022.dto.Member;
import com.example.prjjsp20241022.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public void add(Board board, Member member) {
        mapper.insert(board, member);
    }

    public Map<String, Object> list(Integer page, String searchTarget, String keyword) {
        //한 페이지에 10개
        Integer offset = (page - 1) * 10;
//        List<Board> list = mapper.selectAll();
        List<Board> list = mapper.selectAllPaging(offset, searchTarget, keyword);

        //Controller에게 넘겨 줄 정보들
        Map<String, Object> map = new HashMap<>();

        //페이지 관련 정보들
        Integer countAll = mapper.countAll(searchTarget, keyword);
        Integer lastPageNumber = (countAll - 1) / 10 + 1; //마지막 페이지
        Integer rightPageNumber = ((page - 1) / 10 + 1) * 10; //현재 페이지 기준 오른쪽 끝 페이지 번호
        Integer leftPageNumber = rightPageNumber - 9; //현재 페이지 기준 왼쪽 끝


        Integer nextPageNumber = rightPageNumber + 1; //다음 클릭 시
        Integer prevPageNumber = leftPageNumber - 1; //이전 클릭 시

        Boolean hasNextPage = nextPageNumber < lastPageNumber;
        Boolean hasPrevPage = prevPageNumber > 1;

        Map<String, Object> pageInfo = new HashMap<>();

        rightPageNumber = Math.min(rightPageNumber, lastPageNumber);

        pageInfo.put("lastPageNumber", lastPageNumber);
        pageInfo.put("rightPageNumber", rightPageNumber);
        pageInfo.put("leftPageNumber", leftPageNumber);
        pageInfo.put("currentPageNumber", page);//현재 페이지
        pageInfo.put("nextPageNumber", nextPageNumber);
        pageInfo.put("prevPageNumber", prevPageNumber);
        pageInfo.put("hasNextPage", hasNextPage);
        pageInfo.put("hasPrevPage", hasPrevPage);

        //오른쪽 끝페이지는 마지막 페이지보다 클 수 없다

        map.put("pageInfo", pageInfo);
        map.put("boardList", list);
        return map;
    }

    public Board get(Integer id) {
        return mapper.selectById(id);
    }

    public void remove(Integer id, Member member) {
        Board board = mapper.selectById(id);
        if (board.getWriter().equals(member.getId())) {
            mapper.deleteById(id);
        } else {
            throw new RuntimeException("삭제 권한이 없습니다.");
        }
    }

    public void update(Board board, Member member) {
        Board board1 = mapper.selectById(board.getId());
        if (board1.getWriter().equals(member.getId())) {
            mapper.update(board);
        } else {
            throw new RuntimeException("수정 권한 없음");
        }
    }
}
