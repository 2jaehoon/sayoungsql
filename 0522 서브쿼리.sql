	 select model, car_year, price, cc, car_option, car_img,hiredate
from
(select model, car_year, price, cc, car_option, car_img,
	to_char(hiredate, 'yyyy-mm-dd day q"분기"') hiredate,
	row_number() over(order by hiredate desc) rnum
from car_model)
where rnum between 1 and 10;

select cc.country, cc.maker, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img
from car_country cc, car_maker cma, car_model cmo
where (cma.maker=cc.maker and cmo.model(+)=cma.model)
and cc.maker in ('현대', 'BMW');
