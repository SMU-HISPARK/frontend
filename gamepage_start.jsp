<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test starting page</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>

        /* 공통 스타일 */
        @font-face {
            font-family: 'Pretendard';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Thin.woff') format('woff');
            font-weight: 100;
            font-display: swap;
        }

        html, body {
            min-height:100%; 
            margin:0; padding:0;
        }

        input {
            border: 1px solid #ccc;
            padding: 15px;
            font-size: 15px;
            font-weight: 400;
            height: 45px;
            font-family: 'Pretendard', sans-serif;
        }
        input:focus {
            outline: 1.5 solid #1a1a1a;
        }
        button {
            background-color: #fafafa; 
            border:1px solid #ccc;
            width: 160px;
            height: 50px;
            font-size: 15px;
            color: #1a1a1a;
            gap: 15px;
            font-family: 'Pretendard', sans-serif;
        }
        .black {
            background-color: #1a1a1a; 
            color: #fafafa;
        }
        

        /*// starting_section //*/
        /* title_box */
        .title_box {
            /*border:1px solid black; */
            height:59vh; width:50vh; 
            margin:auto;
            display:flex; flex-direction:column; justify-content: center; align-items: center;
            text-align: center;
        }
        .title_box h3 {
            font-size:1.6rem;
            margin-bottom: 20%;
        }

        /* button_box */
        .button_box {
            /*border:1px solid black; */
            height:40vh; width:50vh; 
            margin:auto; 
            display:flex; flex-direction:column; align-items: center;
        }
        .button_box input, .button_box button {
            height:13%; width:80%;
            margin:5px; 
        }

        /*// question_section //*/
        .question_section {
            display: none;
        }
        .question_box {
            /*border:1px solid black; */
            height:45vh; width:50vh; 
            margin:auto;
            display:flex; flex-direction:column; justify-content: center; align-items: center;
            text-align: center;
        }
        .question_box h4{
            font-size:1.1rem;
            margin-top: 45%;
        }
        .question_box h3 {
            font-size:1.6rem;
        }
        
        /* answer_box */
        .next_box {
            margin-top: auto;
            margin-bottom: 35%;
            width: fit-content;
            height: fit-content;
        }
        .next_button {
            height:40px; width:100px;
        }
        .next_button:disabled {         /* 비활성화 스타일 */
            background-color: lightgray;
            color: gray;
            border:1px solid gray;
            cursor: not-allowed;
        }
        .answer_box {
            /*border:1px solid black; */
            height:54vh; width:50vh; 
            margin:auto; 
            display:flex; flex-direction:column; align-items: center;
        }
        .answer_box .answer1, .answer_box .answer2 {
            height:13%; width:80%;
            margin:5px; 
        }
        .answer_box .selected {
            background-color: #1a1a1a;
            color: #fafafa;
        }




        /* modal 창 */
        
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1000; 
            inset: 0;
            background-color: rgba(0,0,0,0.5); /* 반투명 배경 */
            justify-content: center;
            align-items: center;
        }
        

        .modal_content {
            background-color: #fafafa;
            padding: 20px;
            width: 500px; 
            height: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .modal_content input {
            width: 80%;
            margin: 10px 0;
        }
        .modal_content button {
            /*
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            */
        }
        .close {
            color: #aaa;
            align-self: flex-end;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <!-- 시작 섹션 -->
    <section class="starting_section">
        <div class="title_box">
            <h3>동아리 신입부원 모집 테스트</h3>
            <p>나에게 맞는 동아리는 어디일까?</p>
        </div>

        <form id="start_form">
            <div class="button_box">
                <input type="text" name="name" placeholder="이름을 입력해주세요." 
                <c:if test="${session_name != null}">value="${session_name}"</c:if> />
                <c:if test="${session_id == null}">
                    <button type="button" class="login_button">내 프로필 가져오기</button>
                </c:if>
                <button type="submit" class="black">테스트 시작하기</button>
            </div>
        </form>
    </section>
    <!-- /시작 섹션 -->


    <!-- 질문 섹션 -->
    <section class="question_section">
        <div class="question_box">
            <h4>1/3</h4>                    <!-- 임시로 3문제까지 -->
            <h3>쉬는 시간의 나의 모습은?</h3>
        </div>
        <form>
            <div class="answer_box">
                <input type="hidden" class="question_num" value=""/>       <!-- DB에 저장된 질문번호 -->
                <button type="button" class="answer1">친구들과 수다</button>
                <input type="hidden" name="answer1" value=""/>             <!-- DB에 저장된 답변태그1 -->
                <button type="button" class="answer2">혼자서 책 읽기</button>
                <input type="hidden" name="answer2" value=""/>             <!-- DB에 저장된 답변태그2 -->
                <div class="next_box">
                    <button type="submit" class="next_button black" disabled>다음으로</button>
                </div>
            </div>
        </form>
    </section>
    <!-- /질문 섹션 -->


    <!-- 모달 창 -->
    <div class="login_modal modal">
        <div class="modal_content">
            <form action="/login" method="post">
                <span class="close">&times;</span>
                <h3>로그인 후 결과를 저장해 보세요.</h2>
                <input type="text" name="username" placeholder="아이디">
                <input type="password" name="password" placeholder="비밀번호">
                <input type="hidden" name="redirectTo" value="/game">
                <button type="submit" class="black">로그인</button>
            </form>
        </div>
    </div>
    <!-- /모달 창 -->

    <script>
        
        let name = '';
        let AnswerMap = new Map(); // 질문 번호와 답변을 저장할 Map
        let test_num = 0;      // 현재 질문 번호


        /* 이벤트 리스너 */


        /// 초기 화면 ///

        // 테스트 시작하기 클릭 시 
        $('#start_form').on('submit', (e) => {
            e.preventDefault();
            name = $('input[name="name"]').val();
            if(name.length < 1) {                   // 이름 유효성 검사
                alert('이름을 입력해주세요.');
                return;
            }
            // 테스트 시작
            $('.starting_section').css('display', 'none');
            $('.question_section').css('display', 'block');

            // 질문 번호 초기화
            test_num = 1;
            $('.question_box h4').text(test_num + '/12');

        }); // form submit


        const $modal = $(".modal");

        // 로그인 버튼 클릭 시 모달 창 열기
        $(".login_button").on('click', () => {
        	$modal.css('display', 'flex');
        });

        // 모달 창 닫기
        $('.close').on('click', () => {
        	$modal.css('display', 'none');
        });

        // 모달 창 외부 클릭 시 닫기
        $(window).on('click', (e) => {
        	if(e.target === $modal[0]) {
        		$modal.css('display', 'none');
        	}
        });
        /*----------------------------------------------------------------*/

        
        /// 질문 화면 ///

        // 답변 버튼 클릭 시 선택한 답변에 스타일 적용
        $(document).on('click', '.answer_box>button', function() {
            $('.answer_box button').removeClass('selected');
            $(this).addClass('selected');
            $('.next_button').prop('disabled', false); // 다음 버튼 활성화
        });

        // 다음 버튼 클릭 시
        $(document).on('click', '.next_button', (e) => {
            e.preventDefault();
            let selected_answer = $('.answer_box .selected').attr("class") == "answer1 selected" ? 'answer1' : 
                                  $('.answer_box .selected').attr("class") == "answer2 selected" ? 'answer2' : null;
            if(selected_answer == null) {          // 선택한 답변 유효성 검사
                alert('답변을 선택해주세요.');
                return;
            }
            saveAnswer(selected_answer);             // 답변 저장 함수 호출
            $('.answer_box button').removeClass('selected');                // 선택 스타일 초기화
            $('.next_button').prop('disabled', true); // 다음 버튼 비활성화

            // 다음 질문으로 넘어가기
            test_num = parseInt($('.question_box h4').text().split('/')[0]);
            if(test_num < 3) {     // 임시로 3문제까지
                test_num++;
                $('.question_box h4').text(test_num + '/3');
                processNextQuestion(selected_answer);   // 다음 질문 처리 함수 호출 (현재의 답변에 따라 다음 질문 불러오기)
            }else{
                alert('테스트가 완료되었습니다.');
                console.log('최종 답변 맵:', AnswerMap);
                
                ////////// 여기서 서버로 답변 맵 전송하는 코드 추가 가능 //////////
                // 예: AJAX 요청을 통해 서버에 AnswerMap 전송

                location.href = '/game/result'; // 결과 페이지로 이동
            }

            console.log('질문 번호:', $('.question_box h4').text().split('/')[0]);
            console.log('선택한 답변:', selected_answer);
            console.log('답변 맵:', AnswerMap);

        }); // next_button click

        /*--------------------------------------------------------------*/

        
        




        /* 함수 정의 */

        // 답변 저장 함수
        function saveAnswer(selected_answer) {
            let question_num = $('.question_num').val();
            let answer_tag = $(`.answer_box input[name="${selected_answer}"]`).val();
            AnswerMap.set(question_num, answer_tag);
        }

        // 다음 질문 처리 함수
        function processNextQuestion(selected_answer) {

            ///////// 여기에 다음 질문을 불러오는 로직 추가 /////////

            // 예: AJAX 요청을 통해 서버에서 다음 질문과 답변 태그를 받아와서 업데이트
            // 현재는 예시로 질문과 답변을 하드코딩
            let next_question = "다음 질문 예시입니다.";
            let next_answer1 = "다음 답변1 예시";
            let next_answer2 = "다음 답변2 예시";
            let next_question_num = 3;          // 다음 질문 번호
            let next_tag1 = "next_tag1";       // 다음 답변 태그1
            let next_tag2 = "next_tag2";       // 다음 답변 태그2

            // 화면 업데이트
            $('.question_box h3').text(next_question);
            $('.answer_box .answer1').text(next_answer1);
            $('.answer_box .answer2').text(next_answer2);
            $('.question_num').val(next_question_num);
            $('.answer_box input[name="answer1"]').val(next_tag1); 
            $('.answer_box input[name="answer2"]').val(next_tag2);
        }

    </script>
</body>
</html>