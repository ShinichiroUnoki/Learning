-- 55. 商品コード「S0604」の商品について、商品コード、商品名、単価、これまでに販売した
--     数量を抽出する。ただし、抽出には、選択列リストにて注文デーブルを副問合せする
--     SELECT文を用いること。
SELECT CODE, NAME, PRICE, (SELECT COUNT(PRODUCTS_CODE) FROM ORDERS WHERE PRODUCTS_CODE = 'S0604') AS 販売数量 FROM PRODUCTS
WHERE CODE = 'S0604';

-- 56. 次の注文について、商品コードを間違って登録したことがわかった。商品テーブルより条件に
-- 　　 合致する商品コードを取得し、該当の注文テーブルを更新する。ただし、注文テーブルの更新には、
--     SET句にて商品テーブルを副問い合わせするUPDATE文を用いること。
--     ・注文日：2022-03-15 注文番号：202203150014 注文枝番：1
--     ・正しい商品の条件：商品区分が「靴」で、商品名に「ブーツ」「雨」「安心」を含む
UPDATE ORDERS
SET PRODUCTS_CODE = (SELECT CODE FROM PRODUCTS 
WHERE CATEGORIES = '2' AND NAME LIKE '%ブーツ%' AND '%雨%' AND '%安心%')
WHERE ORDERS_DATE = '2022-03-15' AND ORDERS_NUMBER = '202203150014' AND ORDERS_BRANCH_NUM = '1';

-- 57. 商品名に「あったか」が含まれる商品が売れた日付とその商品コードを過去の日付順に抽出する。
--     ただし、WHERE句でIN演算子を利用した副問い合わせを用いること。
SELECT ORDERS_DATE, PRODUCTS_CODE FROM ORDERS
LEFT JOIN PRODUCTS
ON ORDERS.PRODUCTS_CODE = PRODUCTS.CODE
WHERE PRODUCTS.NAME IN (SELECT PRODUCTS.NAME FROM PRODUCTS WHERE NAME LIKE '%あったか%')
ORDER BY ORDERS_DATE ASC;

-- 58. 商品ごとにそれぞれ平均販売数量を求め、どの商品の平均販売数量よりも多い数が売れた
--     商品を探し、その商品コードと販売数量を抽出する。ただし、ALL演算子を利用した
--     副問い合わせを用いること。
-- MEMO: 1日の平均販売数量のことっぽいのでこれで修正.この問題は後回し
SELECT PRODUCTS_CODE, (COUNT(PRODUCTS_CODE) / COUNT(ORDERS_DATE)) AS SALES_PRODUCTS_AMOUNT, COUNT(ORDERS_DATE), COUNT(PRODUCTS_CODE)
FROM ORDERS
GROUP BY PRODUCTS_CODE
HAVING SALES_PRODUCTS_AMOUNT > ALL(SELECT (COUNT(PRODUCTS_CODE) / COUNT(ORDERS_DATE)) FROM ORDERS);

-- 59. クーポン割引を利用して販売した商品コード「W0746」の商品について、その販売数量と、商品1個あたりの
-- 　　 平均割引額を抽出する。列名は「割引による販売数」と「平均割引額」とし、1円未満は切り捨てる。
-- 　　 抽出にはFROM句で副問い合わせを利用すること。
-- MariadbではFROM句にAS句で名前をつけないとエラーになるので要注意。
SELECT COUNT(PRODUCTS_CODE) AS '割引による販売数',
TRUNCATE(AVG(COUPON_DISCOUNT_TICKET), 0) AS '平均割引額'
FROM (SELECT * FROM ORDERS WHERE PRODUCTS_CODE = 'W0746' AND COUPON_DISCOUNT_TICKET IS NOT NULL) AS SUB;

-- 