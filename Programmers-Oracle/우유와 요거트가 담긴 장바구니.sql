/*
CART_PRODUCTS 테이블은 장바구니에 담긴 상품 정보를 담은 테이블입니다. 
CART_PRODUCTS 테이블의 구조는 다음과 같으며, ID, CART_ID, NAME, PRICE는 
각각 테이블의 아이디, 장바구니의 아이디, 상품 종류, 가격을 나타냅니다.

NAME	TYPE
ID	INT
CART_ID	INT
NAME	VARCHAR
PRICE	INT
데이터 분석 팀에서는 우유와 요거트를 동시에 구입한 장바구니가 있는지 알아보려 합니다. 
우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL 문을 작성해주세요. 
이때 결과는 장바구니의 아이디 순으로 나와야 합니다.

예시
예를 들어 CART_PRODUCTS 테이블이 다음과 같다면

CART_PRODUCTS 테이블

ID	CART_ID	NAME	PRICE
5488	83	알루미늄 호일	2980
8435	83	우유	1880
5489	286	반찬류	3700
5491	286	요거트	2980
5504	286	우유	1880
8437	448	요거트	2980
8454	448	우유	1880
5490	1034	케첩	1380
5492	1034	일회용품	1080
83번 장바구니에는 우유만 있고 요거트가 없습니다.
286번 장바구니에는 우유와 요거트가 모두 있습니다.
448번 장바구니에는 우유와 요거트가 모두 있습니다.
1034번 장바구니에는 우유와 요거트가 모두 없습니다.
따라서 SQL 문을 실행하면 다음과 같이 나와야 합니다.

CART_ID
286
448
  */
  
-- 코드를 입력하세요
-- 우유와 요거트를 동시에 구입한 장바구니의 id 조회 order by cart_id asc     
select A.cart_id
from (select cart_id,name from cart_products where name = '우유') A,
     (select cart_id,name from cart_products where name = '요거트') B
where A.cart_id = B.cart_id
group by A.cart_id
order by cart_id;
