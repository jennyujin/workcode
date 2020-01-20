-- WHERE 조건문
-- AND OR 조건 여러개 연결
-- like 와 % 사용
-- GROUP BY로 그룹별 출력

-- WHERE & like '%'
-- code가 CC, DD로 시작하는 관측치 추출 
-- %의 의미는 어떤 글자가 포함더될 수 있다는 뜻
SELECT *
  FROM DB.ADMIN.TABLENAME
  WHERE CODE like 'CC%' or CODE like 'DD%'

-- 그룹별 출력 
SELECT GROUPVAR1, COUNT (*) AS N
  FROM DB.ADMIN.TABLENAME
  WHERE CODE like 'CC%' or CODE like 'DD%'
GROUP BY GROUPVAR1

--조건 여러개 AND로 연결
SELECT GROUPVAR1, COUNT (*) AS N
  FROM DB.ADMIN.TABLENAME
  WHERE SEX = 'FEMALE' and CODE like 'CC%' or CODE like 'DD%'
GROUP BY GROUPVAR1

-- 기간설정
-- YMD는 YYYY.MM.DD로 구성된 변수
-- 2008년에서 2016년 사이의 데이터를 출력하기 위한 코드
SELECT DISTINCT SEX, COUNT (*) AS COUNT
  FROM DB.ADMIN.TABLENAME
  WHERE YMD>'2007.12.31' and  YMD<'2017.01.01'
GROUP BY SEX

