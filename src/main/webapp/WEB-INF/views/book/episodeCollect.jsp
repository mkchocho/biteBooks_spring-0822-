<%--
  Created by IntelliJ IDEA.
  User: mkchocho
  Date: 2023/08/21
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!------------ 대여 | 소장 탭----------------->
<div class="detail-tab">
    <div style="background-color: rgb(216, 216, 216); border: 1px solid rgb(170, 170, 170); border-top: none; border-left: none;">
        <a href="/book/detail?b_no=<%=rmap.get("b_no")%>">대여하기</a>
    </div>
    <div style="background-color: white;">
        <a href="/book/detail?b_no=<%=rmap.get("b_no")%>&tab=collect">소장하기</a>
    </div>
</div>
<!------------ end of 대여 | 소장 탭----------------->
<div class="detail-table" style="margin-bottom: 50px;" >
    <table class="table" style="text-align: start;">
        <thead>
        <tr>
            <th scope="col" style="width: 15%">
                <div class="form-check cart-check check-all">
                    <input class="form-check-input" type="checkbox" id="selectAll">
                    <label class="form-check-label" for="selectAll">전체 선택</label>
                </div>
            </th>
            <th scope="col" colspan="2" style="text-align: right " >
                <button style="border: none; background-color: transparent">
                    <i class="fa-solid fa-cart-shopping fa-lg" style="color: #626161; margin-right: 10px; padding-top: 2px"></i>
                </button>
                <button class="white-button">소장하기</button>
            </th>
        </tr>
        </thead>
        <%-- --------------------------------테이블 헤더 끝-----------------------------------%>
        <tbody>
        <tr>
            <th scope="col">
                <div class="form-check cart-check check-option">
                    <input class="form-check-input" type="checkbox" name="option[]" value="">
                    <label class="form-check-label"><img class="detail-thumbnail" src=<%=rmap.get("b_thumbnail")%>></label>
                </div>
            </th>
            <td>
                <div class="table-info">
                    <p><%=rmap.get("b_title")%> <%=epMap.get("ep_no")%>화</p>
                    <p style="color: gray; font-size: 14px;"><%=epMap.get("ep_cdate")%></p>
                    <p style="color: #2679ff;"><%=epMap.get("ep_cprice")%>원</p>
                </div>
            </td>
            <td>
                <div class="episode-button">
                    <button class="white-button">소장</button>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>