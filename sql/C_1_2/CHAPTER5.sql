-- 34. 商品テーブルの商品区分「未分類」の商品について、商品コード、単価、キャンペーン価格の一覧を取得する。
--     キャンペーン価格は単価の5%引きであり、1円未満の端数は考慮しなくてよい。一覧は商品コード順にならべること。
SELECT CODE, PRICE, TRUNCATE(PRICE * 95 / 100, 0) AS キャンペーン価格
FROM PRODUCTS
ORDER BY CODE;

-- 35. 注文日が2022年3月12〜14日で、同じ商品を2個以上注文し、すでにクーポン割引を利用している注文について、さらに300円を割引することになった。
-- 　　 該当データのクーポン割引料を更新する。
UPDATE ORDERS
SET COUPON_DISCOUNT_TICKET = COUPON_DISCOUNT_TICKET + 300
WHERE ORDERS_DATE >= '2022-03-12' AND ORDERS_DATE <= '2022-03-14' AND QUANTITY >= 2;

-- 36. 注文番号「202202250126」について、商品コード「W0156」の注文数を1つ減らすよう更新する。
UPDATE ORDERS 
SET QUANTITY = QUANTITY - 1
WHERE ORDERS_NUMBER = '202202250126' AND PRODUCTS_CODE = 'W0156';

-- 37. 注文テーブルから、注文番号「202110010001」〜 「202110319999」の注文データを抽出する。
--     注文番号と枝番は「-」(ハイフン)でつなげて1つの項目として抽出する。
SELECT CONCAT(ORDERS_NUMBER, '-', ORDERS_BRANCH_NUM) AS 注文番号 FROM ORDERS
WHERE ORDERS_NUMBER >= '202110010001' AND ORDERS_NUMBER <= '202110319999';

-- 38. 商品テーブルから、商品区分の一覧を取得する。見出しは「区分」と「区分名」とし、区分名には日本語名を表記する。
SELECT CATEGORIES, 
CASE CATEGORIES WHEN '1' THEN '衣類'
                WHEN '2' THEN '靴'
                WHEN '3' THEN '雑貨'
                WHEN '9' THEN '未分類'
END AS 区分名
FROM PRODUCTS;

-- 39. 商品テーブルから、商品コード、商品名、単価、販売価格ランク、商品区分を抽出する。販売価格ランクは、3千円未満を
-- 　　 「S」、3千円以上１万円未満を「M」、1万円以上を「L」とする。また、商品区分はコードと日本語名称を「：」（コロン）で
--     連結して表記する。一覧は、単価の昇順に並べ、同額の場合は商品コードの昇順に並べること。
SELECT 
CASE CATEGORIES WHEN '1' THEN CONCAT('衣類:', CODE)
                WHEN '2' THEN CONCAT('靴:', CODE)
                WHEN '3' THEN CONCAT('雑貨:', CODE)
                WHEN '9' THEN CONCAT('未分類:', CODE)
END AS 分類, 
NAME, PRICE, 
CASE WHEN PRICE < 3000 THEN 'S'
     WHEN PRICE >= 3000 AND PRICE < 10000 THEN 'M'
     WHEN PRICE >= 10000 THEN 'L'
END AS 販売価格ランク
FROM PRODUCTS ORDER BY CODE ASC;

-- 40. 商品テーブルから、商品名が10文字を超過する商品名とその文字数を抽出する。文字数の昇順に並べること。
SELECT NAME, LENGTH(NAME) AS 文字数 FROM PRODUCTS WHERE LENGTH(NAME) > 10 ORDER BY LENGTH(NAME) ASC;

-- 41. 注文テーブルから、注文日と注文番号の一覧を抽出する。注文番号は日付の部分を取り除き、4桁の連番部分だけを表記すること。
SELECT ORDERS_DATE, SUBSTRING(ORDERS_NUMBER, 9, 4) AS 注文番号 FROM ORDERS;

-- 42. 商品テーブルについて、商品コードの一文字目が「M」の商品の商品コードを「E」で始まるよう更新する。
UPDATE PRODUCTS SET CODE = REPLACE(CODE, 'M', 'E');

-- 43. 注文番号の連番部分が「1000」〜「2000」の注文番号を抽出する。連番部分4桁を昇順で抽出すること。
SELECT ORDERS_NUMBER FROM ORDERS 
WHERE SUBSTRING(ORDERS_NUMBER, 9, 4) >= 1000 
AND SUBSTRING(ORDERS_NUMBER, 9, 4) <= 2000
ORDER BY SUBSTRING(ORDERS_NUMBER, 9, 4) ASC;

-- 44. 商品コード「S1990」の廃番日を、関数を使って本日の日付に修正する。
UPDATE ABOLISHMENT_PRODUCTS SET ABOLISHMENT_DATE = REPLACE(ABOLISHMENT_DATE, '2021-02-10', '2023-10-02') WHERE CODE = 'S1990';
-- SELECT * FROM ABOLISHMENT_PRODUCTS WHERE CODE = 'S1990';

-- 45. 1万円以上の商品の一覧を取得する。ただし、30%値下げしたときの単価を、商品コード、商品名、現在の単価と併せて取得する。
-- 　　 値下げ後の単価の見出しは、「値下げした単価」とし、1円未満は切り捨てること。
SELECT CODE, NAME, PRICE, TRUNCATE((PRICE * 0.7), 0) AS 値下げした単価 FROM PRODUCTS WHERE PRICE >= 10000;

