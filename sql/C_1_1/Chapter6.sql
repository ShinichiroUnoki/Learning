-- 49. 口座テーブルから、残高の合計、最大、最小、平均、登録データ件数を求める。
SELECT SUM(BALANCE) AS 残高の合計, MAX(BALANCE) AS 残高の最大, MIN(BALANCE) AS 残高の最小, AVG(BALANCE) AS 残高の平均
FROM ACCOUNT;

-- 50. 口座テーブルから、種別が「普通」以外、残高が100万円以上、更新日が2021年以前のデータ件数を求める。
SELECT COUNT(ACCOUNT_CODE) AS データ件数
FROM ACCOUNT
WHERE TYPE <> '1' AND BALANCE >= 1000000 AND UPDATE_AT >= 2021-01-01;

-- 51. 口座テーブルから、更新日が登録されていないデータ件数を求める。ただし、条件式は用いないこと。
SELECT COUNT(*) - COUNT(UPDATE_AT) AS 更新日が登録されていないデータの件数
FROM ACCOUNT;

-- 52. 口座テーブルから、名義の最大値と最小値を求める。
SELECT MAX(ACCOUNT_NAME) AS 名義の最大値, MIN(ACCOUNT_NAME) AS 名義の最小値
FROM ACCOUNT;

-- 53. 口座テーブルから、最も新しい更新日と最も古い更新日を求める。
SELECT MAX(UPDATE_AT) AS 最も新しい更新日, MIN(UPDATE_AT) AS 最も古い更新日
FROM ACCOUNT;

-- 54. 口座テーブルから、種別ごとの残高の合計、最大、最小、平均、および登録されているデータ件数を求める。
SELECT 
TYPE AS 種別,
SUM(BALANCE) AS 残高合計,
MAX(BALANCE) AS 残高最大,
MIN(BALANCE) AS 残高最小,
AVG(BALANCE) AS 残高平均,
COUNT(TYPE) AS データ件数
FROM ACCOUNT
GROUP BY TYPE ASC;

-- 55. 口座テーブルから、口座番号の下1桁目が同じ数字であるものを同じグループとし、それぞれのデータ件数を求める。
--     ただし、件数の多い順に並べること。
SELECT SUBSTRING(ACCOUNT_CODE, LENGTH(ACCOUNT_CODE), 1) AS LAST_NUM, COUNT(ACCOUNT_CODE) AS SUCH_DATA_COUNT
FROM ACCOUNT
GROUP BY LAST_NUM
ORDER BY COUNT(ACCOUNT_CODE) DESC;

-- 56. 口座テーブルから、更新日の年ごとの残高の合計、最大、最小、平均、登録データ件数を求める。
--     ただし、更新日の登録がないデータは、「XXXX年」として集計する。
SELECT 
CASE WHEN CONCAT(SUBSTRING(UPDATE_AT, 1, 4), '年') IS NULL THEN 'XXXX年'
     ELSE CONCAT(SUBSTRING(UPDATE_AT, 1, 4), '年')
END AS UPDATE_AT_YEAR,
SUM(BALANCE) AS BALANCE_SUM,
MAX(BALANCE) AS BALANCE_MAX,
MIN(BALANCE) AS BALANCE_MIN,
AVG(BALANCE) AS BALANCE_AVG,
COUNT(ACCOUNT_CODE) AS ACCOUNT_COUNTS
FROM ACCOUNT
GROUP BY UPDATE_AT_YEAR
ORDER BY UPDATE_AT_YEAR ASC;

-- 57. 口座テーブルから、種別ごとの残高の合計とデータ件数を求める。ただし、合計が300万円以下のものは
--     一覧から取り除く。
SELECT 
    CASE 
        WHEN TYPE = 1 THEN '普通'
        WHEN TYPE = 2 THEN '当座'
        WHEN TYPE = 3 THEN '別段'
    END AS TYPE,
SUM(BALANCE) AS BALANCE_SUM, COUNT(ACCOUNT_CODE) AS ACCOUNT_CODE_COUNTS
FROM ACCOUNT
GROUP BY TYPE
HAVING BALANCE_SUM > 3000000;

-- 58. 口座テーブルから、名義の1文字が同じグループごとに、データ件数と名義文字数の
--     平均を求める。ただし、件数が10件以上、または文字数の平均が5文字より多いもの
--     を抽出の対象とする。なお、名義の全角スペースは文字数に含めない。

SELECT SUBSTRING(ACCOUNT_NAME, 1, 1) AS ACCOUNT_NAME_INI,
COUNT(ACCOUNT_CODE) AS ACCOUNT_CODE_COUNTS,
AVG(LENGTH(REPLACE(ACCOUNT_NAME, '　', ''))) AS ACCOUNT_NAME_LENGTH_AVG
FROM ACCOUNT
GROUP BY ACCOUNT_NAME_INI
HAVING ACCOUNT_CODE_COUNTS >= 10 OR ACCOUNT_NAME_LENGTH_AVG > 5;