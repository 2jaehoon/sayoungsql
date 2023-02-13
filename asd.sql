select COUNTRY, cc.MAKER, cma.MODEL, CAR_YEAR, PRICE, CAR_OPTION
from car_country cc, car_maker cma, car_model cmo
where (cc.maker=cma.maker) and (cma.model=cmo.model(+)) and (cc.maker = 'BENZ');

select * from CAR_MAKER;

select * from CAR_COUNTRY;

SELECT MAKER
FROM CAR_MAKER
WHERE MAKER='BENZ';
