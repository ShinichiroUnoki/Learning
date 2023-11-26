-- 9. 口座テーブルから、口座番号が「0037651」のデータを抽出する
SELECT * FORM ACCOUNT WHERE ACCOUNT_CODE = '0037651';

-- 10. 口座テーブルから、残高が0より大きいデータを抽出する。
SELECT * FROM ACCOUNT WHERE BALANCE > 0;

-- 11. 口座テーブルから、口座番号が「1000000」番より前のデータを抽出する。
SELECT * FROM ACCOUNT WHERE ACCOUNT_CODE < '1000000';

-- 12 口座テーブルから、更新日が2021年以前のデータを抽出する。
SELECT * FROM ACCOUNT WHERE UPDATE_AT < '2021-01-01';

-- 13. 口座テーブルから残高が100万円以上のデータを抽出する。
SELECT * FROM ACCOUNT WHERE BALANCE >= 1000000;

-- 14. 口座テーブルから、種別が「普通」ではないデータを抽出する。
SELECT * FROM ACCOUNT WHERE TYPE <> '1';

-- 15. 口座テーブルから、更新日が登録されていないデータを抽出する。
SELECT * FROM ACCOUNT WHERE UPDATE_AT IS NULL;

-- 16. 口座テーブルから、「ハシ」を含む名義のデータを抽出する。
SELECT * FROM ACCOUNT WHERE ACCOUNT_NAME LIKE '%ハシ%';

-- 17. 口座テーブルから、更新日が2022年１月の日付であるデータを抽出する。ただし、記述する条件式は1つであること。
SELECT * FROM ACCOUNT WHERE UPDATE_AT BETWEEN '2022-01-01' AND '2022-01-31';

-- 18. 口座テーブルから、種別が「当座」または「別段」のデータを抽出する。ただし、記述する条件式は1つであること
SELECT * FROM ACCOUNT WHERE TYPE IN('2', '3');

-- 19. 口座テーブルから、名義が「サカタ　リョウヘイ」「マツモト　ミワコ」「ハマダ　サトシ」のデータを抽出する。
SELECT * FROM ACCOUNT WHERE ACCOUNT_NAME IN('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ');

-- 20. 口座テーブルから、更新日が2021年12月30日から2022年1月4日であるデータを抽出する。
SELECT * FROM ACCOUNT WHERE UPDATE_AT BETWEEN '2021-12-30' AND '2022-01-04';

-- 21. 口座テーブルから、残高が1万円未満で、更新日が登録されているデータを抽出する。
SELECT * FROM ACCOUNT WHERE BALANCE < 10000 AND BALANCE IS NOT NULL;

-- 22. 口座テーブルから、次の条件のいずれかに当てはまるデータを抽出する。
    -- ・口座番号が「2000000」番台
    -- ・名義の姓が「エ」から始まる３文字で、名が「コ」で終わる
SELECT * FROM ACCOUNT WHERE ACCOUNT_CODE BETWEEN '2000000' AND '2999999' OR ACCOUNT_NAME LIKE 'エ__　%コ';

-- 23. 口座テーブル、取引テーブル、取引事由テーブルにおいて主キーの役割を果たしている別名を日本語で解答する。
SELECT TRAIDING_CODE AS '取引番号' FROM TRAIDING;
SELECT ID AS '取引事由ID' FROM TRAIDING_DETAIL;
SELECT ACCOUNT_CODE AS '口座番号' FROM ACCOUNT;