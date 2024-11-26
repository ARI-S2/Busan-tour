# Busan-tour
![KakaoTalk_20241104_170008487](https://github.com/user-attachments/assets/84a75683-1dec-4b9c-8ee1-68b52c6d3c49)

>  쌍용교육센터 1차 팀 프로젝트
> 
> 2023.12. - 2024.01. (2개월)

<br>

## 📝 프로젝트 개요
부산을 찾는 관광객들을 위해 하나의 웹 페이지에서 간편하게 여행 계획을 세울 수 있도록 관광명소, 맛집, 예약 및 쇼핑 정보에 대한 다양한 기능을 제공하는 공간입니다.
<br>

## 👨‍👨‍👦‍👦 팀원 구성
* 팀장 : 김연수
* 팀원1 : 김하영
* 팀원2 : 윤새영
* 팀원3 : 김선호

<br>

## ⚙️ 사용 기술
- `Java 14`, `JSP/Servelt(JSTL)`
- `Oracle 21c`
- `AJAX`, `JQuery`,`JavaScript`, `HTML/CSS`
- `AWS EC2`
<br>

## 📌 담당 기능

### 1. 관광지 소개
- 조회수 및 찜하기 기반 인기 관광지 추천
- 명소/체험 목록과 상세보기
- Cookie를 활용한 최근 본 목록
- 검색어 및 태그 기반 검색 및 정렬
- AJAX를 이용한 찜하기 

### 2. 마이페이지 기능
- 회원정보 수정 및 탈퇴
  - jQuery를 이용한 폼 입력 유효성 검사
  - Kakao 우편번호 API 활용
- AJAX를 이용한 장바구니 관리 및 구매내역
- 찜 목록 관리
- 나의 문의내역 관리

### 3. 관리자페이지 기능
- 회원 관리
- 특산물 CRUD 관리 및 검색
- AJAX를 이용한 예약 상태 즉시 변경 및 화면 갱신
- Q&A 게시판 답변 기능

### 4. AWS EC2를 이용한 서버 배포

<br>

## 📌 그 외 팀원 담당 기능

###  5. 사용자 인증
- 회원가입 및 로그인
- 아이디/비밀번호 찾기

###  6. 맛집 예약
- 맛집 목록과 상세보기 
- AJAX를 활용한 예약 시스템
  - 가능한 예약날짜, 예약시간, 인원 선택에 따른 실시간 정보 출력
- AJAX를 이용한 예약 상태(대기/승인/취소) 즉시 변경 및 화면 갱신
- 검색어 및 태그 기반 검색 및 정렬
  
###  7. 전시회 예약
- 전시회 목록과 상세보기 
- AJAX를 활용한 예약 시스템
  - 가능한 예약날짜, 예약시간, 인원 선택에 따른 실시간 정보 출력
- AJAX를 이용한 예약 상태(대기/승인/취소) 즉시 변경 및 화면 갱신
- 검색어 및 태그 기반 검색 및 정렬

###  8. 특산물 쇼핑
- 특산물 목록과 상세보기 
- KakaoPay API를 활용한 결제
- AJAX를 이용한 특산물 리뷰/대댓글 
  - 대댓글이 있는 리뷰 삭제 시 경고창 표시
  
###  9. 커뮤니티
- 파일 첨부가 가능한 공지사항 및 Q&A 게시판
- AJAX를 이용한 댓글 및 대댓글 
  - 대댓글이 있는 댓글 삭제 시 경고창 표시

<br>

## 💾 DB 설계
![꾸미기 page05_1](https://github.com/user-attachments/assets/7ab80803-57fd-4956-8b33-7be436f2fa03)


<br>

## 📋 요구사항 명세
<details>
<summary> 상세 보기 </summary>
<div markdown="1">

![꾸미기 page07_1](https://github.com/user-attachments/assets/2d9362e6-7421-4748-a5a4-14f98b64da69)
![슬라이드1](https://github.com/user-attachments/assets/c9eb3093-2fac-4a8d-950e-9a1a9ed9e58a)
![슬라이드2](https://github.com/user-attachments/assets/6e0f376f-6bc3-41dd-a2cf-e2a7bc7f797c)
![슬라이드3](https://github.com/user-attachments/assets/ea86bcd1-7e99-4639-a21f-7af9dc2fd6bd)
![슬라이드4](https://github.com/user-attachments/assets/39b5e7e2-fd37-497c-8642-373a306aa47e)
![슬라이드5](https://github.com/user-attachments/assets/fcff820b-7b18-42ca-bff6-38e7788c0018)
![슬라이드6](https://github.com/user-attachments/assets/97914a77-bed4-4ae2-8b90-d80dc1b82ff9)
![슬라이드7](https://github.com/user-attachments/assets/856342b3-75ef-4c56-8f02-2090860ce89f)
![슬라이드8](https://github.com/user-attachments/assets/378bd854-7053-458c-9962-4f17dc06632a)

</div>
</details>

<br>

## 🖥️ 담당 기능 화면 설계
### [메인 페이지]
![그림1](https://github.com/user-attachments/assets/ec3fe3b0-54d5-4b1a-9338-853e2b97e856)

### [관광지 페이지]
![꾸미기 page53_1](https://github.com/user-attachments/assets/324a16d8-7220-4429-becf-a1aeb0e84dff)
![꾸미기 page54_1](https://github.com/user-attachments/assets/416907f3-ab7b-4143-a96d-64288ccb4a6a)

### [마이 페이지]
![꾸미기 page74_1](https://github.com/user-attachments/assets/288ffb62-4d7c-4d42-bb5b-b0076413b067)
![꾸미기 page75_1](https://github.com/user-attachments/assets/4ed24483-8aad-4081-b0da-31c54c2105c6)
![꾸미기 page76_1](https://github.com/user-attachments/assets/5b14fcdb-e3f4-48a6-add6-38c26b841eab)
![꾸미기 page77_1](https://github.com/user-attachments/assets/a8ee4d9f-4066-4fa6-aac1-b888e047fa7f)
![꾸미기 page78_1](https://github.com/user-attachments/assets/ecc1d6f1-ba5e-4aa7-b51e-2dda3c353143)
![꾸미기 page79_1](https://github.com/user-attachments/assets/d556be89-0730-411b-8963-ce3e7db2cb84)
![꾸미기 page80_1](https://github.com/user-attachments/assets/b487a5ed-b8a8-4b9b-a32f-807648609098)

### [관리자 페이지]
![꾸미기 page81_1](https://github.com/user-attachments/assets/d04db46e-459f-47c0-b498-73bf3e5df6d8)
![꾸미기 page82_1](https://github.com/user-attachments/assets/e7df6922-4452-42bc-b88e-8069bb07474d)
![꾸미기 page83_1](https://github.com/user-attachments/assets/1eab8551-cbec-4e8c-8602-b22264f5dcd4)
![꾸미기 page84_1](https://github.com/user-attachments/assets/df2340d0-9e98-4e1a-a8c5-456950dc5606)
