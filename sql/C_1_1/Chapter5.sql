-- 33. 口座テーブルと廃止口座テーブルに登録されている口座番号と名義の一覧を取得する。一覧は名義の昇順にし、その口座の状況がわかるように、有効な口座には「○」を、廃止した口座には「×」を一覧に付記すること。
SELECT ACCOUNT.ACCOUNT_CODE, ACCOUNT.ACCOUNT_NAME, 
CASE WHEN ABOLISHMENT_ACCOUNT.ACCOUNT_CODE IS NULL THEN '×'
     WHEN ABOLISHMENT_ACCOUNT.ACCOUNT_CODE IS NOT NULL THEN '○'
END AS EXIST
FROM ACCOUNT
LEFT JOIN ABOLISHMENT_ACCOUNT
ON ACCOUNT.ACCOUNT_CODE = ABOLISHMENT_ACCOUNT.ACCOUNT_CODE 
ORDER BY ACCOUNT_NAME ASC;

-- 34. 口座テーブルから、残高が100万円以上の口座番号と残高を抽出する。ただし、残高は千円単位で表記し、見出しを「千円単位の残高」とする。
SELECT ACCOUNT_CODE, BALANCE / 1000 AS '千円単位の残高' FROM ACCOUNT WHERE BALANCE >= 1000000;

-- 35. 口座テーブルに次の3つのデータを1回の実行ごとに1つずつ登録する。ただし、キャンペーンにより登録時に残高を3000円プラスする。
INSERT INTO ACCOUNT(ACCOUNT_CODE, ACCOUNT_NAME, TYPE, BALANCE, UPDATE_AT)
    VALUES('0652281', 'タカギ　ノブオ', '1', 100000 + 3000, '2022-04-01');
INSERT INTO ACCOUNT(ACCOUNT_CODE, ACCOUNT_NAME, TYPE, BALANCE, UPDATE_AT)
    VALUES('1026413', 'マツモト　サワコ', '1', 300000 + 3000, '2022-04-03');
INSERT INTO ACCOUNT(ACCOUNT_CODE, ACCOUNT_NAME, TYPE, BALANCE, UPDATE_AT)
    VALUES('2239710', 'ササキ　シゲノリ', '1', 1000000 + 3000, '2022-04-03');

-- 36. 35の問題で登録したデータについて、キャンペーンの価格が間違っていたことが判明した。該当するデータの
--     残高それぞれから3000円を差し引き、あらためて残高の0.3%を上乗せした金額になるよう更新する。
UPDATE ACCOUNT
SET BALANCE = ((BALANCE - 3000) * (1 + 0.3 / 100))
WHERE ACCOUNT_CODE IN ('0652281','1026413','2239710');

-- 37. 口座テーブルから、更新日が2020年以前のデータを対象に、口座番号、更新日、通帳期限日を抽出する。通帳期限日は、
--     更新日の180日後とする。
SELECT ACCOUNT_CODE, UPDATE_AT, DATEDIFF(UPDATE_AT, CURRENT_DATE) AS '通帳期限日'
FROM ACCOUNT
WHERE (CURRENT_DATE - UPDATE_AT) >= 180;

-- 38. 口座テーブルから、種別が「別段」のデータについて、口座番号と名義を抽出する。
--     ただし、名義の前に「カ)」を付記すること。
SELECT ACCOUNT_CODE, CONCAT('カ', ACCOUNT_NAME) AS ACCOUNT_NAME
FROM ACCOUNT
WHERE TYPE = '3';

-- 39. 口座テーブルから、登録されている種別の一覧を取得する。見出しは「種別コード」と「種別名」とし、
--     種別名には日本語名を表記する。
SELECT TYPE AS '種別コード', 
CASE WHEN TYPE = '1' THEN '普通'
     WHEN TYPE = '2' THEN '当座'
     WHEN TYPE = '3' THEN '別段'
END AS '種別名'
FROM ACCOUNT;

-- 40. 口座テーブルから、口座番号、名義、残高ランクを抽出する。残高ランクは、残高が
--     10万円未満を「C」、10万円以上100万円未満を「B」、それ以外を「A」とする。
SELECT ACCOUNT_CODE, ACCOUNT_NAME, 
CASE WHEN BALANCE < 100000 THEN 'C'
     WHEN BALANCE >= 100000 AND BALANCE < 1000000 THEN 'B'
     ELSE 'A'
END AS '残高ランク'
FROM ACCOUNT;

-- 41. 口座テーブルから、口座番号、名義、残高の文字数を抽出する。ただし、名義の姓名の間の全角スペースは
--     除外すること。
SELECT LENGTH(ACCOUNT_CODE) AS 'ACCOUNT_CODEの文字数', REPLACE(ACCOUNT_NAME, '　', '') AS ACCOUNT_NAME, LENGTH(BALANCE) AS 'ACCOUNT_NAMEの', BALANCE
FROM ACCOUNT;

-- 42. 口座テーブルから、名義の1〜5文字目に「カワ」が含まれるデータを抽出する。
SELECT *
FROM ACCOUNT
WHERE SUBSTRING(ACCOUNT_NAME, 1, 5) LIKE '%カワ%';

-- 43. 口座テーブルから、残高の桁数が4桁以上で、1,000円未満の端数がないデータを抽出する。
--     ただし、どちらの条件も文字数を求める関数を使って判定すること。
SELECT *
FROM ACCOUNT
WHERE LENGTH(BALANCE) >= 4 AND SUBSTRING(BALANCE, LENGTH(BALANCE) - 2, LENGTH(BALANCE)) = 000;

-- 44. 口座テーブルから、口座番号、残高、利息を残高の降順に抽出する。利息は、残高に普通預金
--     利息0.02%を掛けて求め、1円未満を切り捨てること。
SELECT ACCOUNT_CODE, BALANCE, TRUNCATE((BALANCE * 0.02 / 100), 0) AS 利息
FROM ACCOUNT
ORDER BY 利息 DESC;

-- 45. 口座テーブルから、口座番号、残高、残高別利息を抽出する。残高別利息は、残高が50万円円未満を
--     0.01%、50万円以上200万円未満を0.02%、200万円以上を0.03%として計算し、1円未満を切り捨てる。
--     一覧は、残高別利息の降順、口座番号の列順に並べること。
SELECT ACCOUNT_CODE, BALANCE, 
CASE WHEN BALANCE < 500000 THEN TRUNCATE(BALANCE * 0.01 / 100, 0)
     WHEN BALANCE >= 500000 AND BALANCE < 2000000 THEN TRUNCATE(BALANCE * 0.02 / 100, 0)
     ELSE TRUNCATE(BALANCE * 0.03 / 100, 0)
END AS 残高別利息
FROM ACCOUNT;

-- 46. 口座テーブルに以下にある3つのデータを1回の実行ごとに1つずつ登録する。ただし、
--     更新日は現在の日付を求める関数を利用して指定すること。
INSERT INTO ACCOUNT
    VALUES('0351262', 'イトカワ　ダイ', '2', 635110, CURRENT_DATE);
INSERT INTO ACCOUNT
    VALUES('1015513', 'アキツ　ジュンジ', '1', 88463, CURRENT_DATE);
INSERT INTO ACCOUNT
    VALUES('1739298', 'ホシノ　サトミ', '1', 704610, CURRENT_DATE);

-- 47. 口座テーブルから更新日が2022年以降のデータを抽出する。
--     その際、更新日は「2022年01月01日」のような形式で抽出すること。
SELECT CONCAT(SUBSTRING(UPDATE_AT, 1, 4), '年', SUBSTRING(UPDATE_AT, 6, 2), '月',SUBSTRING(UPDATE_AT, 9, 2), '日') AS UPDATE_AT
FROM ACCOUNT
WHERE UPDATE_AT >= 2022-01-01;

-- 48. 口座テーブルから更新日を抽出する。更新日が登録されていない場合は、「設定なし」と表記すること。
SELECT CASE 
    WHEN UPDATE_AT IS NOT NULL THEN UPDATE_AT
    WHEN UPDATE_AT IS NULL THEN '設定なし'
END AS UPDATE_AT 
FROM ACCOUNT;

