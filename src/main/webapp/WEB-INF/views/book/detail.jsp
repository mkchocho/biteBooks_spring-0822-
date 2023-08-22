<%@ page import="java.util.Map, java.util.List" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%    String user = (String)session.getAttribute("m_id");
    String nickname = (String)session.getAttribute("m_nickname");
    String tab = (String)request.getParameter("tab");
    int epId = 0;

    List<Map<String,Object>> bList = (List<Map<String,Object>>)request.getAttribute("bList");
//    out.print(bList.get(0));
    Map<String,Object> rmap = bList.get(0);
//----------------------------------------------좋아요-----------------------------------------------
    List<Map<String,Object>> likeSelect = (List<Map<String,Object>>)request.getAttribute("likeSelect");
    Map<String, Object> lmap = null;
    if (likeSelect != null) {//로그인 안하면 likeSelect가 null이라서 likeSelect.size()가 터짐
        int size = 0;
        size = likeSelect.size();
        if (size != 0) {//좋아요값 db에 없을 경우 : select 쿼리문 탄 후 [] 리스트 만들어짐 , null이 아니어서 likeSelect.size() 로 터짐방지
            lmap = likeSelect.get(0);
        }
    }
//-------------------------------에피소드리스트----------------------------------------
    List<Map<String,Object>> epList = (List<Map<String,Object>>)request.getAttribute("epList");
    for(int i=0; i<epList.size(); i++){
        out.print(epList.get(i));
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/resources/cdn/common.html"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/bookDetail.css">
    <link rel="stylesheet" href="/resources/css/common.css">
<%--    <script type="text/javascript">
        const detailRental = () => {
            window.location.href="/board/boardDelete.pj2?b_no=<%=rmap.get("B_NO")%>";
        }
    </script>--%>
    <script>
        const oneRental = () => {
            document.querySelector("#one-order-rental").submit();
        }
    </script>
    <title>책 상세조회</title>
</head>
<body>
<%@include file="../common/mainHeader.jsp"%>
<div class="container mt-4 mb-4">
    <!-- 검색 목록 -->

    <div class="row mb-4" >
        <div class="col-md-9" >
            <!-- 이미지 및 상세 정보 -->
            <div class="detail-container">
                <div class="img-container">
                    <img src=<%=rmap.get("b_thumbnail")%> alt="thumbnail">
                    <div class="my-book-button" >
                        <%if(lmap == null && user != null){%>
                        <p><span class="heart" onclick="toggleHeart(this)">♡</span>
                        <%}else if(lmap == null && user == null){%>
                        <p><span class="heart"><a href="/member/login" onclick="return showLoginAlert();">♡</a></span>
                        <%}else{%>
                        <p><span class="heart" onclick="toggleHeart(this)">♥</span>
                        <%}%>
                            234</p>
                    </div>
                </div>
                <div class="book-info-container">
                    <h2><%=rmap.get("b_title")%></h2>
                    <p><%=rmap.get("b_author")%></p>
                    <p><%=rmap.get("b_publisher")%></p>
                    <p>총 **화 | 미완결</p>
                </div>
            </div>
<%-------------------------------에피소드 대여 / 소장 구분부분-------------------------------%>
            <%if(tab==null||"rental".equals(tab)){//대여하기 버튼 누르면 episodeRental.jsp
                for(int i=0; i<epList.size(); i++){
                    Map<String,Object> epMap = epList.get(i);%>
                <%@include file="episodeRental.jsp"%>
            <%}/*---------------end of 에피소드 테이블 for문-----------*/
            /*----------------end of 대여하기 탭 include 부분---------*/
            }else if("collect".equals(tab)){
                for(int i=0; i<epList.size(); i++){//소장하기 버튼 누르면 episodeRental.jsp
                    Map<String,Object> epMap = epList.get(i);%>
                    <%@include file="episodeCollect.jsp"%>
            <%}/*---------------end of 에피소드 테이블 for문-----------*/
            }%><%-----------------end of 소장하기 탭 include 부분-----------%>

    <%-------------------------------end of 에피소드 대여 / 소장 구분부분-------------------------------%>

            <hr>
            <div class="white-box p-4">
                <!-- 작품 소개 섹션 -->
                <h4>작품소개</h4>
                <p><%=rmap.get("b_descript")%></p>
                <hr>
                <!-- 저자 섹션 -->
                <h4>저자</h4>
                <p><%=rmap.get("b_author")%></p>
                <hr>
                <!-- 리뷰 섹션 -->
                <h4>리뷰</h4>
                <label for="rating"></label>

                <form class="mb-3" name="myform" id="myform" method="post">
                    <fieldset>
                        <span class="text-bold">별점을 선택해주세요</span>
                        <input type="radio" name="reviewStar" value="5" id="rate1"><label
                            for="rate1">★</label>
                        <input type="radio" name="reviewStar" value="4" id="rate2"><label
                            for="rate2">★</label>
                        <input type="radio" name="reviewStar" value="3" id="rate3"><label
                            for="rate3">★</label>
                        <input type="radio" name="reviewStar" value="2" id="rate4"><label
                            for="rate4">★</label>
                        <input type="radio" name="reviewStar" value="1" id="rate5"><label
                            for="rate5">★</label>
                    </fieldset>
                    <div>
		<textarea class="col-auto form-control" type="text" id="reviewContents"
                  placeholder="리뷰를 남겨주세요"></textarea>
                    </div>
                </form>
            </div>
        </div>

        <!-- 여기에 구분선을 추가합니다. -->
        <!-- 베스트 목록 -->
        <div class="col-md-3 detail-right">
            <h5 style="font-size: 15px;"><%=rmap.get("b_genre")%>&nbsp;베스트<a href="#"
                                               style="padding-left: 5px; text-decoration: none; color: inherit;">></a>
            </h5>
            <ul class="book-list">
                <li><span class="ranking">1</span> 명문고 ex급 조연의 이야기</li>
                <li><span class="ranking">2</span> 백작가의 망나니가 되었다</li>
                <li><span class="ranking">3</span> 서브 남주가 파업하맨 생기는 일</li>
                <li><span class="ranking">4</span> 블랙 기업 조선</li>
                <li><span class="ranking">5</span> 환생 했더니 단종의 보모!?</li>
                <li><span class="ranking">6</span> 흑막이지만 세계 평화가 좋다</li>
                <li><span class="ranking">7</span> 저승의 왕위를 계승했다</li>
                <li><span class="ranking">8</span> 히든 피스로 전설 기사</li>
                <li><span class="ranking">9</span> 회귀자 사용설명서</li>
                <li><span class="ranking">10</span> 반려 쉘터 키우기</li>

            </ul>
        </div>
    </div>
</div>


<script>
    function toggleHeart(element) {
        let isLiked;
        if (element.textContent === '♡') {
            element.textContent = '♥︎';
            isLiked = true;
        } else {
            element.textContent = '♡';
            isLiked = false;
        }
        // 서버로 요청 보내기
        fetch('/like/heart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ liked: isLiked, m_id : <%=user%>, b_no : <%=rmap.get("b_no")%>})
        }).then(response => {
            if (!response.ok) {
                console.error('Failed to send like status to server');
            }
        });

    }
        function showLoginAlert() {
            // 알림창 표시
            var isConfirmed = confirm("로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니까?");

            // 사용자가 확인을 누르면 true를 반환하여 페이지 이동을 수행
            // 취소를 누르면 false를 반환하여 페이지 이동을 중지
            return isConfirmed;
        }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
