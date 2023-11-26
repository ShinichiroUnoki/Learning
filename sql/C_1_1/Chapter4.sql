-- 24. 口座テーブルから、口座番号順に全てのデータを抽出する。ただし、並び替えには列名を指定し、昇順にすること。
SELECT * FROM ACCOUNT ORDER BY ACCOUNT_CODE ASC;

-- 25. 口座テーブルから、名義の一覧を取得する。データの重複を除外し、名義の昇順にすること。
SELECT DISTINCT ACCOUNT_NAME FROM ACCOUNT ORDER BY ACCOUNT_NAME ASC;

-- 26. 口座テーブルから、残高の大きい順に全てのデータを抽出する。残高が同額の場合には口座番号の昇順にし、並び替えには列番号を指定すること。
SELECT * FROM ACCOUNT ORDER BY 4 DESC, 1;

-- 27. 口座テーブルから、更新日を過去の日付順に10件抽出する。ただし、更新日の設定がないデータは除くこと。
SELECT UPDATE_AT FROM ACCOUNT WHERE UPDATE_AT IS NOT NULL ORDER BY UPDATE_AT ASC;

-- 28. 口座テーブルから、更新日と残高を、残高の小さい順に11〜20件目のみを抽出する。ただし、残高が0円または更新日の設定が
--     ないデータは除外し、残高が同額の場合には更新日の新しい順（降順）とする。
SELECT UPDATE_AT, BALANCE FROM ACCOUNT 
WHERE BALANCE <> 0 OR UPDATE_AT IS NOT NULL 
ORDER BY UPDATE_AT DESC 
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 29. 口座テーブルと廃止口座テーブルに登録されている口座番号を昇順に抽出する
SELECT ACCOUNT_CODE FROM ACCOUNT UNION SELECT ACCOUNT_CODE FROM ABOLISHMENT_ACCOUNT;

-- 30. 口座テーブルに登録されている名義のうち、廃止口座テーブルには存在しない名義を抽出する。重複したデータは除き、降順で並べること。
SELECT ACCOUNT_NAME FROM ACCOUNT EXCEPT SELECT ACCOUNT_NAME FROM ABOLISHMENT_ACCOUNT ORDER BY ACCOUNT_NAME DESC;

-- 31. 口座テーブルと廃止口座テーブルの両方に登録されている名義を昇順に抽出する。
SELECT ACCOUNT_NAME FROM ACCOUNT INTERSECT SELECT ACCOUNT_NAME FROM ABOLISHMENT_ACCOUNT ORDER BY ACCOUNT_NAME ASC;

-- 32. 口座テーブルと廃止口座テーブルに登録されている口座番号と残高の一覧を取得する。ただし、口座テーブルは残高が0のもの、廃止口座テーブルは解約時残高が0でないものを抽出対象とする。一覧は口座番号順とする。
SELECT ACCOUNT_CODE, BALANCE FROM ACCOUNT WHERE BALANCE <> 0 UNION SELECT ACCOUNT_CODE, BALANCE_AT_ABOLISHMENT FROM ABOLISHMENT_ACCOUNT WHERE BALANCE_AT_ABOLISHMENT <> 0 ORDER BY ACCOUNT_CODE ASC;