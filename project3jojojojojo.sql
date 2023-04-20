DELETE FROM manager WHERE id = 'eh1111' OR id = 'red' OR id = 'ty3333' OR id = 'jr4444' OR id = 'jh5555' OR id = 'jg6666' OR id = 'hong';

delete from manager where id = 'blue';
select * from MANAGER;

select * from NOVEL;

select * from EPISODE;

select * from MEMBER;

select * from history;

select * from REPORT;

insert into history values(11, '211.63.89.140',sysdate, 'windows OS');

insert into report values(14, 27 ,25, 'practiceid', 4, sysdate);

insert into member values(11, '5ary', '����', '12345', sysdate, '010-1234-5677', 'rary@haha.com', 'cart.png', 5, sysdate, sysdate, 20);

insert into novel values(15, 27, '������', 1, 'practice.png', '�������丮', 1, 0, 5, 5, sysdate, 20);




	commit;

 /*�ʾ� */
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
/*���ڿ��� �ٲٰ� ���ؼ� ī��Ʈ  �ʾ�*/
SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)
  ) WHERE JOIN = TRUNC(SYSDATE-2);

SELECT COUNT(*) FROM ( SELECT * FROM (SELECT to_char(JOIN,'yyyy-MM-DD') JOIN FROM MEMBER)
  ) WHERE JOIN = '2023-04-15';



/*////////////////////////////////////////////////////////*//*////////////////////////////////////////////////////////*/


/*�ֱ� 5�� ��¥���� ������ �������� �ʾ�*/
SELECT
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE) ) AS todaymCnt,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-1 ) AS todaymCnt_1,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-2 ) AS todaymCnt_2,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-3 ) AS todaymCnt_3,
  (SELECT COUNT(*) FROM member WHERE JOIN = TRUNC(SYSDATE)-4 ) AS todaymCnt_4
FROM dual;


/*�����丮  */
select id, os, ip, visit
from HISTORY h, member m
where h.num_member = m.num_member;

select *
from HISTORY h, member m
where h.num_member = m.num_member;


/* ȸ������ : ��ȣ, ���̵�, ��ǰ ����, �Ű� ���� ����, �湮 ��¥, ���� ��¥, Ż�� ��¥
 NUM_MEMBER(���), ID(���), join(���), stop(���) ��ǰ ����(�뺧), �Ű� ���� ����(����Ʈ, ȸ������), VISIT(�����丮),
 */
 SELECT  m.num_member, m.id, m.join, m.stop,  h.visit, m.novelcnt, n.reportcnt
FROM member m
left Outer JOIN novel n ON m.num_member = n.num_member
left Outer JOIN report r ON n.num_member = r.num_member
left Outer JOIN history h ON r.num_member = h.num_member
order by m.num_member;




SELECT  m.num_member, m.id, m.join, m.stop, nvl(h.visit, sysdate-373752) visit, m.novelcnt, n.reportcnt
FROM member m
left Outer JOIN novel n ON m.num_member = n.num_member
left Outer JOIN report r ON n.num_member = r.num_member
left Outer JOIN history h ON r.num_member = h.num_member
order by m.num_member;

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









, MEMBER, NCNT
