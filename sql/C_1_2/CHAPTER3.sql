-- 6. 商品テーブルから、商品コードが「W1252」のデータを抽出する。
SELECT * FROM PRODUCTS WHERE CODE = 'W1252';

-- 7. 商品コードが「S0023」の商品について、商品テーブルの単価を500円に変更する。
UPDATE PRODUCTS 
SET PRICE = 500
WHERE CODE = 'S0023';

-- 8. 商品テーブルから、単価が千円以下の商品データを抽出する。
SELECT * FROM PRODUCTS WHERE PRICE <= 1000;

-- 10. 注文テーブルから、2022年以降の注文データを抽出する。
SELECT * FROM ORDERS WHERE ORDERS_DATE >= '2022-01-01';

-- 11. 注文テーブルから、2021年11月以前の注文データを抽出する。
SELECT * FROM ORDERS WHERE ORDERS_DATE < '2021-11-01';

-- 12. 商品テーブルから、クーポン割引を利用していない注文データを抽出する。
SELECT P.* FROM PRODUCTS AS P
LEFT JOIN ORDERS AS O
ON P.CODE = O.PRODUCTS_CODE
WHERE COUPON_DISCOUNT_TICKET IS NULL;

-- 13. 注文テーブルから、クーポン割引を利用していない注文データを抽出する。
SELECT * FROM ORDERS WHERE COUPON_DISCOUNT_TICKET IS NULL;

-- 14. 商品テーブルから、商品コードが「N」で始まる商品を削除する。
DELETE FROM PRODUCTS WHERE CODE LIKE 'N%';

-- 15. 商品テーブルから、商品名に「コート」が含まれる商品について、商品コード、商品名、単価を抽出する。
SELECT CODE, NAME, PRICE 
FROM PRODUCTS
WHERE NAME LIKE '%コート%';

-- 16. 「靴」または「雑貨」もしくは「未分類」の商品について、商品コード、商品区分を抽出する。
--     ただし、記述する条件式は１つであること。
SELECT * FROM PRODUCTS WHERE CATEGORIES IN(2, 3, 9);

-- 17. 商品テーブルから、商品コードが「A0100」〜「A0500」に当てはまる商品データを抽出する。記述する条件式は１つであること。
SELECT * FROM PRODUCTS WHERE CODE >= 'A0100' AND CODE <= 'A0500';

-- 18. 注文テーブルから、商品コードが「N0501」「N1021」「N0223」のいずれかを注文した注文データを抽出する。
SELECT * FROM ORDERS WHERE PRODUCTS_CODE IN('N0501', 'N1021', 'N0223');

-- 19. 商品テーブルから、「雑貨」で商品名に「水玉」が含まれる商品データを抽出する。
SELECT * FROM PRODUCTS WHERE  CATEGORIES = 3 AND NAME LIKE '%水玉%';

-- 20. 商品テーブルから、商品名に「軽い」または「ゆるふわ」のどちらかが含まれる商品データを抽出する。
SELECT * FROM PRODUCTS WHERE NAME LIKE '%軽い%' OR NAME LIKE '%ゆるふわ%';

-- 21. 商品テーブルから、「衣類」で単価が３千円以下、または「雑貨」で単位が１万円以上の商品データを抽出する。
SELECT * FROM PRODUCTS WHERE (CATEGORIES = 1 AND PRICE <= 3000) OR (CATEGORIES = 3 AND PRICE >= 10000);

-- 22. 注文テーブルから、2022年3月中に、一度の注文で数量3個以上の注文があった商品コードを抽出する。
SELECT PRODUCTS_CODE FROM ORDERS WHERE ('2022-03-01' <= ORDERS_DATE AND '2022-03-31' >= ORDERS_DATE) AND QUANTITY >= 3;

-- 23. 注文テーブルから、一度の注文で数量10個以上を注文したか、クーポン割引を利用した注文データを抽出する。
SELECT * FROM ORDERS WHERE QUANTITY >= 10 OR COUPON_DISCOUNT_TICKET IS NOT NULL;

-- 24. 商品テーブルと注文テーブルそれぞれについて、主キーの役割を果たしている列名を日本語で解答する。
商品コード FROM PRODUCTS, 注文番号 FROM ORDERS;

