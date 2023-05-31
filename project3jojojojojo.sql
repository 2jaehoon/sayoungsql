DELETE FROM manager WHERE id = 'eh1111' OR id = 'red' OR id = 'ty3333' OR id = 'jr4444' OR id = 'jh5555' OR id = 'jg6666' OR id = 'hong';

delete from manager where id = 'blue';
select * from MANAGER;

select * from NOVEL;

select * from EPISODE;

select * from MEMBER;

select * from REPORT;





update member set stop=sysdate-1
			where id = 'pha1006';

select * from history;

select * from REPORT;

insert into history values(11, '211.63.89.140',sysdate, 'windows OS');

insert into report values(14, 27 ,25, 'practiceid', 4, sysdate);

insert into member values(11, '5ary', '래리', '12345', sysdate, '010-1234-5677', 'rary@haha.com', 'cart.png', 5, sysdate, sysdate, 20);

insert into novel values(15, 27, '연습용', 1, 'practice.png', '연습스토리', 1, 0, 5, 5, sysdate, 20);




	commit;

 /*초안 */
  SELECT
  (SELECT COUNT(*) FROM EPISODE) AS EALLCNT,
  (SELECT COUNT(*) FROM NOVEL) AS NALLCNT,
  (SELECT COUNT(*) FROM MEMBER WHERE JOIN = TRUNC(SYSDATE)) AS TODAY_MEMBER_CNT,
  TRUNC(SYSDATE-1) AS YESTERDAY
FROM dual;

 /*dashboard cnt */
SELECT
  (SELECT COUNT(*) FROM member) AS memberCnt,
  (SELECT COUNT(*) FROM NOVEL) AS novelCnt,
  (SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER) )
	WHERE JOIN = TRUNC(SYSDATE)) AS todaySignUpCnt,
  (SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history) )
	 WHERE visit = TRUNC(SYSDATE) ) AS todayVisitCnt,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(make,'yyyy-MM-DD') make FROM novel) )
	WHERE make = TRUNC(SYSDATE)) AS todayCreateNovelCnt,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(make,'yyyy-MM-DD') make FROM episode) )
	WHERE make = TRUNC(SYSDATE)) AS todayCreateEpCnt
FROM dual;







	select
 (SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER) )
	WHERE JOIN = TRUNC(SYSDATE-4)) AS SCnt4,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER) )
	WHERE JOIN = TRUNC(SYSDATE-3)) AS SCnt3,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER) )
	WHERE JOIN = TRUNC(SYSDATE-2)) AS SCnt2,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER) )
	WHERE JOIN = TRUNC(SYSDATE-1)) AS SCnt1,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER) )
	WHERE JOIN = TRUNC(SYSDATE)) AS SCnt
	from dual;






/*////////////////////////////////////////////////////////*/ /*////////////////////////////////////////////////////////*/




SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER);
/*문자열로 바꾸고 비교해서 카운트  초안*/
SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)
  ) WHERE JOIN = TRUNC(SYSDATE-2);

SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)
  ) WHERE JOIN = '2023-04-15';



/*////////////////////////////////////////////////////////*//*////////////////////////////////////////////////////////*/


/*최근 5일 날짜별로 데이터 가져오는 초안*/
SELECT
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE) ) AS todaymCnt,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-1 ) AS todaymCnt_1,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-2 ) AS todaymCnt_2,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-3 ) AS todaymCnt_3,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-4 ) AS todaymCnt_4
FROM dual;


/*히스토리  */
select id, os, ip, visit
from HISTORY h, member m
where h.num_member = m.num_member;

select *
from HISTORY h, member m
where h.num_member = m.num_member;


/* 회원관리 : 번호, 아이디, 작품 개수, 신고 누적 개수, 방문 날짜, 가입 날짜, 탈퇴 날짜
 NUM_MEMBER(멤버), ID(멤버), join(멤버), stop(멤버) 작품 개수(노벨), 신고 누적 개수(리포트, 회원으로), VISIT(히스토리),
 */
 SELECT  m.num_member, m.id, m.join, m.stop,  h.visit, m.novelcnt, n.reportcnt
FROM member m
left Outer JOIN novel n ON m.num_member = n.num_member
left Outer JOIN report r ON n.num_member = r.num_member
left Outer JOIN history h ON r.num_member = h.num_member
order by m.num_member;




SELECT  DISTINCT m.num_member, m.id, m.join, nvl(m.stop, sysdate-1) stop, nvl(h.visit, m.join) visit, m.novelcnt, n.reportcnt
FROM member m
left Outer JOIN novel n ON m.num_member = n.num_member
left Outer JOIN report r ON n.num_member = r.num_member
left Outer JOIN history h ON r.num_member = h.num_member
order by m.num_member;



SELECT m.id, m.num_member,  m.join, nvl(m.stop, sysdate-1) stop, nvl(h.visit, m.join) visit, nvl(m.novelcnt, 0) novelcnt
FROM member m
left Outer JOIN novel n ON m.num_member = n.num_member
left Outer JOIN report r ON n.num_member = r.num_member
left Outer JOIN history h ON r.num_member = h.num_member
order by m.num_member;

 SELECT m.id, m.num_member, nvl(m.novelcnt, 0) novelcnt,
 nvl((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member), m.join) AS visit,
  m.join, nvl(m.stop, sysdate-1) stop FROM member m;

  (SELECT count() FROM NOVEL n WHERE m.num_member = n.num_member) as a from member m;

  select * from NOVEL;

			/*회원관리전체*/
   SELECT m.id, m.num_member,
  (SELECT COUNT(*) FROM novel where num_member=m.num_member) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member),m.join) AS visit,
  m.join, NVL(m.stop, sysdate-1) AS stop FROM member m CROSS JOIN dual;

	/*아이디 검색*/
     SELECT m.id, m.num_member,
  (SELECT COUNT(*) FROM novel where num_member=m.num_member) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member),m.join) AS visit,
  m.join, NVL(m.stop, sysdate-1) AS stop FROM member m CROSS JOIN dual where m.id = 'aa';

  SELECT m.id as id, m.num_member as member,
  (SELECT COUNT(*) FROM novel where num_member=m.num_member) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member),m.join) AS visit,
  m.join join, m.stop AS stop FROM member m CROSS JOIN dual where id = 'aa';

   SELECT m.id as id, m.num_member as member,
  (SELECT COUNT(*) FROM novel where num_member=m.num_member) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member),m.join) AS visitDate,
  m.join as joinDate, m.stop AS susPeriod FROM member m CROSS JOIN dual where id = 'aa';




SELECT *
FROM member m
left Outer JOIN novel n ON m.num_member = n.num_member
left Outer JOIN report r ON n.num_member = r.num_member
left Outer JOIN history h ON r.num_member = h.num_member;







 SELECT join, COUNT(*) AS member_count
FROM member
GROUP BY join
having join < TRUNC(SYSDATE);



	/* 오늘 가입자수  */
select
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-6)) AS JCnt6,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-5)) AS JCnt5,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-4)) AS JCnt4,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-3)) AS JCnt3,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-2)) AS JCnt2,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-1)) AS JCnt1,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE)) AS JCnt0
from dual;

			 /* 오늘 방문자 수 */
select
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-6)) AS vCnt6,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-5)) AS vCnt5,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-4)) AS vCnt4,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-3)) AS vCnt3,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-2)) AS vCnt2,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-1)) AS vCnt1,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE)) AS vCnt0
from dual;

/* 소설 총 개수 */
 select
(SELECT COUNT(*) FROM novel where make<(sysdate-6)) as allNCnt6,
(SELECT COUNT(*) FROM novel where make<(sysdate-5)) as allNCnt5,
(SELECT COUNT(*) FROM novel where make<(sysdate-4)) as allNCnt4,
(SELECT COUNT(*) FROM novel where make<(sysdate-3)) as allNCnt3,
(SELECT COUNT(*) FROM novel where make<(sysdate-2)) as allNCnt2,
(SELECT COUNT(*) FROM novel where make<(sysdate-1)) as allNCnt1,
(SELECT COUNT(*) FROM novel where make<(sysdate)) as allNCnt0
from dual;

   /* 멤버 총 수 */
 select
(SELECT COUNT(*) FROM member where join<(sysdate-6)) as allMCnt6,
(SELECT COUNT(*) FROM member where join<(sysdate-5)) as allMCnt5,
(SELECT COUNT(*) FROM member where join<(sysdate-4)) as allMCnt4,
(SELECT COUNT(*) FROM member where join<(sysdate-3)) as allMCnt3,
(SELECT COUNT(*) FROM member where join<(sysdate-2)) as allMCnt2,
(SELECT COUNT(*) FROM member where join<(sysdate-1)) as allMCnt1,
(SELECT COUNT(*) FROM member where join<(sysdate)) as allMCnt0
from dual;

select * from member;
select * from NOVEL;

	select
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history) )
	 WHERE visit = TRUNC(SYSDATE-1) ) as curval from dual;




select * from HISTORY;




select m.id, m.name, m.birth, m.phone, m.email, m.photo, m.join, m.stop,
						m.novelcnt, count(r.num_report) as report_cnt,
						h.visit as visitdate 	from member m
					left join report r on r.id = m.id
						left join history h on h.num_member = m.num_member 	where m.id = 'pha1006'
						group by m.id, m.name, m.birth, m.phone, m.email, m.photo, m.join, m.stop,m.novelcnt, h.visit;



    ALTER TABLE member MODIFY (stop DEFAULT SYSDATE-1);

    select * from MEMBER;
    commit;

     update member set stop
			= null
			where id = 'aa';


   update member set stop
			=sysdate+60
			where id = 'aa';

                /*cross join 비추*/


											/*cross join 비추*/
						   SELECT m.id as id, m.name as name, m.birth as birth, m.phone as phone, m.email as email,
							  NVL(m.photo,'profile_home.png') as photo, m.join as join , m.stop as stop,
  NVL((SELECT COUNT(*) FROM report where num_member=m.num_member),0) AS report_cnt,
  nvl((SELECT COUNT(*) FROM novel where num_member=m.num_member),0) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member),m.join) AS visitdate
   FROM member m CROSS JOIN dual where m.num_member=1;

				 /*이너 조인 사용해라*/

    SELECT id, name, birth, phone, email,
    NVL(m.photo,'profile_home.png') as photo, join , stop,
    NVL((SELECT COUNT(*) FROM comments WHERE num_member=m.num_member), 0) AS commentCnt,
    NVL((SELECT COUNT(*) FROM novel WHERE num_member=m.num_member), 0) AS novelcnt,
    NVL((SELECT MAX(h.visit) FROM history h WHERE h.num_member = m.num_member), m.join) AS visitdate
		FROM member m
		INNER JOIN dual ON num_member = 1;






  select * from REPORT;
  select * from NOVEL;



SELECT m.id as id, m.num_member as num_member,
  (SELECT COUNT(*) FROM novel WHERE num_member=m.num_member) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member), m.join) AS visitDate,
  m.join as joinDate, m.stop AS susPeriod
FROM member m
INNER JOIN dual;

     select * from MEMBER;
    	select * from episode ;

     insert into member values(5, 'ex1141', '1이재', 'qwer12234', sysdate, '010-41311-1746', 'j1@naver.com', null, sysdate, null);
				 commit;

				  insert into episode values(11, 2, 2, '테스트', '테스트틀',0, null, sysdate, '테스트');
				 commit;

				 insert into comments values(3,'테스asdasdasdsadsadsadsadsadsadsadsa트2',2,11,sysdate);

				 delete from comments where comment_num=3;

		 update member set id='abc', name='이재훈', phone='010-1414-1414', email='jh@nate.com'
		 where num_member='ex1545';

		 select * from COMMENTS;
       comment_num, id, title, detail, make;
		 /*댓글관리 리스트*/
		 /*comment_num, id, num_episode, detail, make*/
		 select *
		 from member m
		 inner join comments c on m.num_member = c.num_member
		 inner join episode e on c.num_episode = e.num_episode
		 where comment_num = 1;

, MANAGER_CMT, MAKE, MANAGER_CMT
		 /*게시판 관련 sql*/                                      
		 select * from BOARD;

		 select * from BOARD_CMT;

		 select BOARD_NUM, m.id as id, TITLE, MAKE, VIEWS
		 from board b
		 inner join member m on b.NUM_MEMBER = m.NUM_MEMBER
		 	 where m.id = 'bb';

		 	 update board set views=(views+1) where board_num=33;



			update board set detail='이걸로 바꿀거다 나는 업데이트'
			where num_member = 2 and board_num = 33;
			commit;

			delete from board where board_num=40;

			delete from board_cmt where board_cmt_num=15;

			update board_cmt set detail='업데이트할래'
			where num_member = 3 and board_cmt_num=25;




		 insert into board(BOARD_NUM, num_member, TITLE, DETAIL, MAKE, VIEWS) va, BOARDlues(?,3,'titletest1', 'detailtest1', sysdate, 'viewtest1');

		 CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1;
		 commit;
		 INSERT INTO board (BOARD_NUM, num_member, TITLE, DETAIL, MAKE, VIEWS)
			VALUES (board_seq.NEXTVAL, 2, 'titletest1', 'detailtest1', sysdate, 15);

			delete from board where board_num=2;





ALTER SEQUENCE board_seq INCREMENT BY -2  MINVALUE 0;   /*1있는 곳에 값넣은걸로  숫자는 현재값 넣어야함 조절*/
SELECT board_seq.NEXTVAL FROM DUAL;
ALTER SEQUENCE board_seq INCREMENT BY 1;


							 /*게시판 댓글*/

               			select * from BOARD_CMT;
, DETAIL, DETAIL, DETAILcreate sequence board_cmt_seq
start with 1
maxvalue 9999999999
increment by 1;
												rollback;
delete from board_cmt where board_num=1;

    ALTER TABLE board_cmt DROP COLUMN board_type;

          ALTER TABLE BOARD_CMT
ADD MANAGER_CMT NUMBER(30);

alter table board_cmt
modify detail clob;

ALTER TABLE board ADD (detail2 CLOB);

UPDATE 테이블명 SET 임시컬럼명 = 기존컬럼명;

ALTER TABLE board DROP COLUMN detail;

ALTER TABLE board RENAME COLUMN detail2 TO detail;

commit;

truncate table board;

select * from BOARD_CMT;

         INSERT INTO board_cmt (BOARD_CMT_NUM, BOARD_NUM, NUM_MEMBER, DETAIL, MAKE)
			VALUES (board_cmt_seq.NEXTVAL, 1, 2, '댓글에서의 detailtest1', sysdate);
						commit;

select m.id as id, bc.make, bc.detail
		 from board b
		 inner join member m on b.NUM_MEMBER = m.NUM_MEMBER
		 inner join board_cmt bc on b.board_num = bc.board_num
		 where b.board_num=1;

		 /*m.id as id, bc.make, bc.detail*/
		 select *
		 from member m
		 inner join board b on m.NUM_MEMBER = b.NUM_MEMBER
		 inner join board_cmt bc on m.NUM_MEMBER = bc.NUM_MEMBER
		 where b.board_num=1;

		 select
		 ( select id from member where NUM_MEMBER=bc.NUM_MEMBER) id, make, detail
		 from board_cmt bc
		 where board_num=1;

				 select id
				 from member
				 where NUM_MEMBER=NUM_MEMBER;



