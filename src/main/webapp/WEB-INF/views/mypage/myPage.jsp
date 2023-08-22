<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("m_id");
    String nickname = (String) session.getAttribute("m_nickname");
    String name = (String) session.getAttribute("m_name");
    String email = (String) session.getAttribute("m_email");
    String admin = (String) session.getAttribute("m_admin");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>북플릭스</title>
    <%@include file="/resources/cdn/common.html" %>
    <link rel="stylesheet" href="/resources/css/myHome.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <style>
        .layout-container {
            padding: 50px;
            display: flex;
            flex-direction: column;
            align-items: center; /* 가로 방향 중앙 정렬 */
        }

        .content-container {
            width: 1200px;
            display: flex;
        }

        .sidebar-container {
            width: 30%; /* 사이드바 넓이 설정 */
        }

        .main-content-container {
            width: 70%;
            padding-left: 20px;
            flex-grow: 1; /* 남은 공간을 메인 콘텐츠가 차지하도록 설정 */
        }
    </style>
</head>
<body>
<%@include file="../common/mainHeader.jsp" %>
<div class="layout-container">
    <div class="content-container">
        <div class="sidebar-container">
            <%@include file="sidebar.jsp" %>
        </div>
        <div class="main-content-container" id="main-content">
            <%@include file="myHome.jsp" %>
        </div>
    </div>
</div>
<script>
    const checkPassword = () => {
        const passwordInput = document.getElementById('password').value;
        console.log("checkPassword 함수가 호출되었습니다.");
        if (passwordInput === '') {
            alert('비밀번호를 입력해주세요.');
            return;
        }

        const data = {
            password: passwordInput
        };

        fetch('/member/checkPassword', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(result => {
            console.log("Server response:", result);
            if (result.check === 1) {
                // 비밀번호 검증 성공 시 내 정보 관리 페이지로 이동
                document.getElementById('password-confirm').classList.add('hidden');
                document.getElementById('myInfoSection').classList.remove('hidden');
            } else {
                // 비밀번호 검증 실패 시 에러 메시지 표시
                alert('비밀번호가 틀렸습니다.\n다시 시도해주세요.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('서버에서 오류가 발생했습니다.\n잠시 후 다시 시도해주세요.');
        });
    }

    const updateMember = (fieldType) => {
        const valueInput = document.getElementById(fieldType).value.trim();
        const fieldNames = {
            m_nickname: '닉네임',
            m_pw: '비밀번호',
            m_phone: '휴대폰 번호'
        };
        const displays = {
            m_nickname: '#nickname-display',
           // m_phone: '#phone-display',
        };
        const display = displays[fieldType];

        if (valueInput === '') {
            alert(fieldNames[fieldType]+"을(를) 입력해주세요.");
            return;
        }

        if (fieldType === 'm_phone' && !/^010-\d{4}-\d{4}$/.test(valueInput)) {
            alert('올바른 휴대폰 번호 형식을 입력해주세요. (예: 010-1234-5678)');
            return;
        }

        const data = {
            type : fieldType,
            [fieldType] : valueInput
        };
        // 서버로 전송
        fetch('/member/updateMember', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(result => {
            if (result.status === 'exist') {
                alert('동일한 값이 존재합니다.');
            } else if (result.status === 'updated') {
                //location.reload(); // 페이지 새로고침
                if (display != null) {
                    document.querySelector(display).textContent = result.newInfo;
                }
                document.getElementById(fieldType).value = '';
                alert(fieldNames[fieldType]+"이(가) 변경되었습니다.");
            }
        })
        .catch(error => {
            console.error('업데이트 중 오류 발생:', error);
        });
    }
///////////////////////////////////////////////
    window.addEventListener('DOMContentLoaded', (event) => {
        const nowPasswordInput = document.getElementById('nowPassword');
        const newPasswordInput = document.getElementById('newPassword');
        const confirmPasswordInput = document.getElementById('checkPassword');
        const updatePasswordButton = document.getElementById('update-password-button');

        let isNowPasswordValid = false;
        let isNewPasswordValid = false;
        let isConfirmPasswordValid = false;

        const validatePassword = (password) => {
            // 여기에 비밀번호 유효성 검사 로직을 적용
            // 예: 길이 체크, 특수 문자 체크 등
            // 유효하면 true 반환, 아니면 false 반환
            const pattern = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*]).{8,20}$/;
            return pattern.test(password);
        }

        const checkPasswordMatch = () => {
            const newPassword = newPasswordInput.value;
            const confirmPassword = confirmPasswordInput.value;

            if (newPassword === '' || confirmPassword === '') {
                confirmPasswordInput.setCustomValidity('');
                isConfirmPasswordValid = false;
            } else if (newPassword !== confirmPassword) {
                confirmPasswordInput.setCustomValidity('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                isConfirmPasswordValid = false;
            } else {
                confirmPasswordInput.setCustomValidity('');
                isConfirmPasswordValid = true;
            }
            updateUpdatePasswordButton();
        }

        const updateUpdatePasswordButton = () => {
            if (isNowPasswordValid && isNewPasswordValid && isConfirmPasswordValid) {
                updatePasswordButton.disabled = false;
            } else {
                updatePasswordButton.disabled = true;
            }
        }

        nowPasswordInput.addEventListener('input', () => {
            isNowPasswordValid = nowPasswordInput.value !== '';
            updateUpdatePasswordButton();
        });

        newPasswordInput.addEventListener('input', () => {
            isNewPasswordValid = validatePassword(newPasswordInput.value);
            updateUpdatePasswordButton();
            checkPasswordMatch();
        });

        confirmPasswordInput.addEventListener('input', () => {
            checkPasswordMatch();
        });

        updatePasswordButton.addEventListener('click', () => {
            const nowPassword = nowPasswordInput.value;
            const newPassword = newPasswordInput.value;

            if (!isNewPasswordValid) {
                alert('새 비밀번호 형식이 올바르지 않습니다.');
                return;
            }

            if (!isConfirmPasswordValid) {
                alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                return;
            }

            const data = {
                nowPassword: nowPassword,
                newPassword: newPassword
            };

            fetch('/member/updatePassword', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(result => {
                    if (result.status === 'updated') {
                        alert('비밀번호가 변경되었습니다.');
                        nowPasswordInput.value = '';
                        newPasswordInput.value = '';
                        confirmPasswordInput.value = '';
                        isNowPasswordValid = false;
                        isNewPasswordValid = false;
                        isConfirmPasswordValid = false;
                        updateUpdatePasswordButton();
                    } else if (result.status === 'incorrect') {
                        alert('현재 비밀번호가 틀렸습니다.');
                    } else {
                        alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.');
                    }
                })
                .catch(error => {
                    console.error('비밀번호 변경 중 오류 발생:', error);
                });
        });
    });


</script>
</body>
</html>
