# 📢 THE MICE

![웹 1920 메인 (inwrap1280px)_개인회원  오버-클릭시](https://github.com/Shye-Seo/themice/assets/93040911/2c0efd39-8cfc-4616-98b6-62bca81e0767)

* 개발기간 : 2022.09.13 ~ 2022.11.18 (10주)
* 참여인원 : 개발자 1명, 디자이너 1명
* URL : <http://www.mice79.com/>

<br>

## 🔍 프로젝트 소개
- 간편하게 웹 페이지를 **제작**할 수 있는 서비스입니다.
- 업로드한 이미지에 **워터마크**를 삽입하여 콘텐츠의 무분별한 사용을 방지합니다.
- **웹 크롤링** 기술을 활용하여 MICE 통합 정보 포털의 역할을 합니다. (현재 중지된 상태)
- 시스템 관리자는 별도의 페이지를 통해 기업/개인회원 및 플랫폼을 관리할 수 있습니다.

<br>

## 🛠 기술 스택
### Environment
<picture><img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/amazonaws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"></picture>


### Development
<picture><img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=openjdk&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"></picture>

<br>

## 💡 프로젝트 구조

```
📦TheMice
 ┣ 📂src
 ┃ ┗ 📂main
 ┃ ┃ ┣ 📂java
 ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┣ 📂admin : 시스템 관리자
 ┃ ┃ ┃ ┃ ┣ 📂business : 기업회원
 ┃ ┃ ┃ ┃ ┣ 📂certification : 이메일 인증, 문자전송
 ┃ ┃ ┃ ┃ ┣ 📂common : 페이징, 워터마크, 임시저장, 암호화
 ┃ ┃ ┃ ┃ ┣ 📂contents : 전시
 ┃ ┃ ┃ ┃ ┃ ┗ 📂comments : 댓글
 ┃ ┃ ┃ ┃ ┣ 📂crawling : 벡스코 웹 크롤링
 ┃ ┃ ┃ ┃ ┣ 📂member : 개인회원
 ┃ ┃ ┃ ┃ ┣ 📂notice : 공지사항
 ┃ ┃ ┃ ┃ ┣ 📂payment : 결제
 ┃ ┃ ┃ ┃ ┗ 📂website : 별도로 제작되는 웹페이지
 ┃ ┃ ┣ 📂resources
 ┃ ┃ ┃ ┗ 📂sql : sql query
 ┃ ┃ ┗ 📂webapp
 ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┣ 📂img
 ┃ ┃ ┃ ┣ 📂js
 ┃ ┃ ┃ ┣ 📂WEB-INF
 ┃ ┃ ┃ ┃ ┣ 📂jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📂aside : quick 메뉴
 ┃ ┃ ┃ ┃ ┃ ┣ 📂comment
 ┃ ┃ ┃ ┃ ┃ ┣ 📂footer
 ┃ ┃ ┃ ┃ ┃ ┣ 📂header
 ┃ ┃ ┃ ┃ ┃ ┗ 📂view
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂business_page
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂certification
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂create_page
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂detail : 상세페이지 테마
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂member_page
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂page_type_1 : 1번타입 홈페이지
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂page_type_2 : 2번타입 홈페이지
 ┃ ┃ ┃ ┃ ┣ 📜applicationContext.xml
 ┃ ┃ ┃ ┃ ┣ 📜dispatcher-servlet.xml
 ┃ ┃ ┃ ┃ ┣ 📜ScheduleContext.xml
 ┃ ┃ ┃ ┃ ┗ 📜web.xml
 ┃ ┃ ┃ ┣ 📜index.jsp
 ┃ ┃ ┃ ┗ 📜test.jsp

```

<br>

