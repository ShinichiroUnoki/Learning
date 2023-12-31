-- 1. 商品テーブルのすべてのデータを「*」を用いずに抽出する。
SELECT CODE, NAME, PRICE, CATEGORIES, ASSOCIATION_PRODUCT_CODE FROM PRODUCTS;

-- 2. 商品テーブルのすべての商品名を抽出する。
SELECT NAME FROM PRODUCTS;

-- 3. 注文テーブルのすべてのデータを「*」を用いて抽出する。
SELECT * FROM ORDERS;

-- 4. 注文テーブルのすべての注文番号、注文枝番、商品コードを抽出する。
SELECT ORDERS_NUMBER, ORDERS_BRANCH_NUM, PRODUCTS_CODE FROM ORDERS;

-- 5. 商品テーブルに次の３つのデータを１回の実行ごとに１つずつ追加する。
INSERT INTO PRODUCTS(CODE, NAME, PRICE, CATEGORIES) VALUES('W0461', '冬のあったかコート', 12800, '1');
INSERT INTO PRODUCTS(CODE, NAME, PRICE, CATEGORIES) VALUES('S0331', '春のさわやかコート', 6800, '1');
INSERT INTO PRODUCTS(CODE, NAME, PRICE, CATEGORIES) VALUES('A0582', '秋のさわやかコート', 9800, '1');