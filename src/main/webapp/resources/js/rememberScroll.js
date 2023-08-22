// 페이지가 로드될 때 이전 스크롤 위치로 이동
window.onload = function() {
    if (sessionStorage.getItem('scrollPosition')) {
        window.scrollTo(0, sessionStorage.getItem('scrollPosition'));
    }
}

// 링크 클릭 시 현재 스크롤 위치를 저장
document.querySelectorAll('a').forEach(function(link) {
    link.addEventListener('click', function() {
        sessionStorage.setItem('scrollPosition', window.scrollY);
    });
});

// // 사용자가 페이지를 스크롤할 때마다 스크롤 위치를 저장 (옵션)
// window.onscroll = function() {
//     sessionStorage.setItem('scrollPosition', window.scrollY);
// }