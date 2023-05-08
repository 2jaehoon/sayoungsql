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
	WHERE JOIN = TRUNC(SYSDATE-2)) AS todaySignUpCnt,
  (SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history) )
	 WHERE visit = TRUNC(SYSDATE-2) ) AS todayVisitCnt,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(make,'yyyy-MM-DD') make FROM novel) )
	WHERE make = TRUNC(SYSDATE-2)) AS todayCreateNovelCnt,
	(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(make,'yyyy-MM-DD') make FROM episode) )
	WHERE make = TRUNC(SYSDATE-2)) AS todayCreateEpCnt
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


   SELECT m.id, m.num_member,
  (SELECT COUNT(*) FROM novel where num_member=m.num_member) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member),m.join) AS visit,
  m.join, NVL(m.stop, sysdate-1) AS stop FROM member m CROSS JOIN dual;




SELECT *
FROM member m
left Outer JOIN novel n ON m.num_member = n.num_member
left Outer JOIN report r ON n.num_member = r.num_member
left Outer JOIN history h ON r.num_member = h.num_member;







 SELECT join, COUNT(*) AS member_count
FROM member
GROUP BY join
having join < TRUNC(SYSDATE);




select
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-4)) AS SCnt4,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-3)) AS SCnt3,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-2)) AS SCnt2,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE-1)) AS SCnt1,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)) WHERE JOIN = TRUNC(SYSDATE)) AS SCnt
from dual;


select
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-4)) AS vCnt4,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-3)) AS vCnt3,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-2)) AS vCnt2,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE-1)) AS vCnt1,
(SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(visit,'yyyy-MM-DD') visit FROM history)) WHERE visit = TRUNC(SYSDATE)) AS vCnt
from dual;

 select
(SELECT COUNT(*) FROM novel where make<(sysdate-4)) as allMCNT4,
(SELECT COUNT(*) FROM novel where make<(sysdate-3)) as allMCNT3,
(SELECT COUNT(*) FROM novel where make<(sysdate-2)) as allMCNT2,
(SELECT COUNT(*) FROM novel where make<(sysdate-1)) as allMCNT1,
(SELECT COUNT(*) FROM novel where make<(sysdate)) as allMCNT
from dual;

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
			=sysdate+60
			where id = 'pha1006';


      select m.id, m.name, m.birth, m.phone, m.email, m.photo, m.join, m.stop,
			count(r.num_report) as novelcnt, count(r.num_report) as report_cnt,
						h.visit as visitdate from member m
						left join report r on r.id = m.id
						left join history h on h.num_member = m.num_member where m.id = 'jaehun3385';

						   SELECT m.id, m.name, m.birth, m.phone, m.email, m.photo, m.join, m.stop,
  NVL((SELECT COUNT(*) FROM report where num_member=m.num_member),0) AS report_cnt,
  nvl((SELECT COUNT(*) FROM novel where num_member=m.num_member),0) AS novelcnt,
  NVL((SELECT MAX(h.visit) FROM history h WHERE m.num_member = h.num_member),m.join) AS visitdate
   FROM member m CROSS JOIN dual where m.id='jaehun3385';

  select * from REPORT;
  select * from NOVEL;




