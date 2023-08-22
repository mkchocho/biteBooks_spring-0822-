<%--
  Created by IntelliJ IDEA.
  User: mkchocho
  Date: 2023/08/18
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row row-container">
    <h4 style="color: #606060; margin-left: 40px">최신 작품</h4>
    <%------------------------- 장르버튼 눌렀을 때 조회 결과가 인덱스 4보다 짧아서 터져서 만든 구간--------------------%>
    <%
        if(bListDate.size()<4){
            for (int i = 0; i < bListDate.size(); i++) {
                Map<String, Object> rmap = bListDate.get(i);
    %>
    <div class="col-md-3 mb-5">
        <div class="card" style="width: 15rem;">
            <a href="/book/detail?b_no=<%=rmap.get("b_no")%>">
                <img src=<%=rmap.get("b_thumbnail")%> class="card-img-top" alt="..." style="height: 250px; object-fit: cover;">
            </a>
            <div class="card-body">
                <h5 class="card-title"><a href="/book/detail?b_no=<%=rmap.get("b_no")%>"><%=rmap.get("b_title")%></a></h5>
                <h6 class="card-subtitle"><%=rmap.get("b_author")%></h6>
                <p class="card-text"><%=rmap.get("b_descript")%></p>
            </div>
        </div>
    </div>
    <%------------------------- 장르버튼 눌렀을 때 조회 결과가 인덱스 4보다 짧아서 터져서 만든 구간 끝--------------------%>
    <%
        }}else{
        for (int i = 0; i < 4; i++) {
            Map<String, Object> rmap = bListDate.get(i);
    %><%--스크롤 길어져서 결과값 4개만 보려고 인덱스 상수 4로 고정 함--%>
    <div class="col-md-3 mb-5">
        <div class="card" style="width: 15rem;">
            <a href="/book/detail?b_no=<%=rmap.get("b_no")%>">
                <img src=<%=rmap.get("b_thumbnail")%> class="card-img-top" alt="..." style="height: 250px; object-fit: cover;">
            </a>
            <div class="card-body">
                <h5 class="card-title"><a href="/book/detail?b_no=<%=rmap.get("b_no")%>"><%=rmap.get("b_title")%></a></h5>
                <h6 class="card-subtitle"><%=rmap.get("b_author")%></h6>
                <p class="card-text"><%=rmap.get("b_descript")%></p>
            </div>
        </div>
    </div>
    <%}}%>
</div>
<div class="row row-container">
    <h4 style="color: #606060; margin-left: 40px">전체 작품</h4>
    <% for (int i = 0; i < bList.size(); i++) {
        Map<String,Object> rmap = bList.get(i);
    %>
    <div class="col-md-3 mb-5">
        <div class="card" style="width: 15rem;">
            <a href="/book/detail?b_no=<%=rmap.get("b_no")%>">
                <img src=<%=rmap.get("b_thumbnail")%> class="card-img-top" alt="..." style="height: 250px; object-fit: cover;">
            </a>
            <div class="card-body">
                <h5 class="card-title"><a href="/book/detail?b_no=<%=rmap.get("b_no")%>"><%=rmap.get("b_title")%></a></h5>
                <h6 class="card-subtitle"><%=rmap.get("b_author")%></h6>
                <p class="card-text"><%=rmap.get("b_descript")%></p>
            </div>
        </div>
    </div>
    <%}%>
</div>