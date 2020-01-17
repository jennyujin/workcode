-- CHECK ALL COLUMNS 
-- select *은 모든 변수들을 의미함  
-- 즉, 다음 코드는 table 내의 모든 변수들을 출력가능  
SELECT * FROM DB.ADMIN.TABLENAME 


-- CHECK EACH VARIABLES 
-- 변수 VAR1의 항목들이 몇개있는지 확인 
-- count한 변수를 남기는데 그 변수 이름은 COUNT 
SELECT DISTINCT VAR1, COUNT (*) AS COUNT 
  FROM DB.ADMIN.TABLENAME 
  GROUP BY VAR1 
; 

  
-- CHECK PK (Primary Key) 
-- 그룹 내 순위 결정
-- VAR1으로 그룹을 결정하고 VAR2로 순서를 정렬 
-- row number을 변수로 남기는데 그 변수의 이름은 RANKING 이다  
SELECT *, 
Row_number() over(PARTITION BY VAR1 ORDER BY VAR2 desc) RANKING 
FROM DB.ADMIN.TABLENAME 


-- CHECK PK - UNIQUE VALUE
-- VAR1, VAR2, VAR3 을 구분자로 그룹핑하여 항목 COUNT 
-- 유일성을 위한 pk 확인이 가능 - 모두 1이 되어야함 
SELECT VAR1, VAR2, VAR3, COUNT (*) AS COUNT
  FROM DB.ADMIN.TABLENAME 
  GROUP BY VAR1, VAR2, VAR3


-- CODE AND NAME MATCH
-- VAR1_CD, VAR1_NM 가 1:1 매칭되는지 확인
SELECT DISTINCT VAR1_CD, VAR1_NM  
    FROM DB.ADMIN.TABLENAME 


-- CHECK SPECIFIC VALUE
-- where 문을 사용하여 특정 값을 갖는 행을 출력
-- 특정값 추출 시 유용 
SELECT VAR1, VAR2, VAR3
    FROM DB.ADMIN.TABLENAME
    WHERE VAR1 = 'Endometrioid-'


-- COUNT COLUMN OBS
-- 각 변수들의 관측치 갯수를 count 
SELECT count(VAR1)
    FROM DB.ADMIN.TABLENAME

SELECT count(VAR1),count(VAR2),count(VAR3),count(VAR4)
    FROM DB.ADMIN.TABLENAME


