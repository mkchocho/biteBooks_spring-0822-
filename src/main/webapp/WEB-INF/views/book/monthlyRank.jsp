<%--
  Created by IntelliJ IDEA.
  User: mkchocho
  Date: 2023/08/08
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 책 그리드 -->
<div class="container">
    <div style="height: 50px"><!--공간주기--></div>
    <%
        if("novel".equals(mainPage)){
    %>
    <h4 style="color: #606060; font-weight: bold">웹소설 월간 랭킹</h4>
    <div class="row" style="margin-left: 25px">
        <!-- 첫 번째 세로 줄 -->
        <div class="col-md-4">
            <!-- 첫 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>1</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 두 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>2</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 세 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>3</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 두 번째 세로 줄 -->
        <div class="col-md-4">
            <!-- 첫 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>4</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 두 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>5</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 세 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>6</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 세 번째 세로 줄 -->
        <div class="col-md-4">
            <!-- 첫 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>7</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 두 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>8</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 세 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4766000067/small#1" alt="상수리나무 아래">
                    </div>
                    <div class="rank-num">
                        <h3>9</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">상수리나무 아래</a></p>
                        <p><a href="#">작가</a></p>
                        <p>️️️⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }else{
    %>
    <h4 style="color: #606060; font-weight: bold">웹툰 월간 랭킹</h4>
    <div class="row" style="margin-left: 25px">
        <!-- 첫 번째 세로 줄 -->
        <div class="col-md-4">
            <!-- 첫 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>1</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 두 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>2</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 세 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>3</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 두 번째 세로 줄 -->
        <div class="col-md-4">
            <!-- 첫 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>4</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 두 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>5</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 세 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>6</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 세 번째 세로 줄 -->
        <div class="col-md-4">
            <!-- 첫 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>1</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 두 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>8</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
            <!-- 세 번째 카드 -->
            <div class="month-rank">
                <div style="display: flex; align-items: center;">
                    <div class="rank-image">
                        <img src="https://img.ridicdn.net/cover/4524000324/large#1" alt="초보자가 MMORPG하는 만화">
                    </div>
                    <div class="rank-num">
                        <h3>9</h3>
                    </div>
                    <div class="rank-info">
                        <p><a href="#">MMORPG하는 만화</a></p>
                        <p><a href="#">대충 작가</a></p>
                        <p>⭐️⭐️⭐️⭐️</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>