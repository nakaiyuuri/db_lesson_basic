Q1

CREATE TABLE departments (
  department_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

Q3
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
('吉田ただし', 'yoshida@gizumo.jp', 1, 26, 1),
('佐野よしこ', 'sano@gizumo.jp', 1, 34, 2),
('小島けん', 'kojima@gizumo.jp', 5, 22, 1),
('横山しんじ', 'yokoyama@gizumo.jp', 1, 43, 1),
('永井たつや', 'nagai@gizumo.jp', 2, 53, 1),
('大政あや', 'omasa@gizumo.jp', 2, 44 ,2),
('米田すすむ', 'yoneda@gizumo.jp', 2, 34, 1),
('亀田ゆうじ', 'kameda@gizumo.jp', 3, 25, 1),
('木下じゅん', 'kinoshita@gizumo.jp', 4, 35, 1),
('大津まりあ', 'otsu@gizumo.jp', 2, 23, 2);

INSERT INTO reports (person_id, content)
VALUES
(10, '今日は実際にユーザーのところに訪問に行きました。'),
(14, '今日は全部署一斉で非常時の対応について確認しました。'),
(7, '今日はユーザーアンケートを採りに行きました。'),
(8, '今日はユーザーアンケートの集計を行いました。'),
(12, '今日はユーザーアンケートの分析を行いました。'),
(2, '今日はアンケートの結果に基づき、これからの方針について会議をしました。'),
(5, '今日はユーザーの意見を実際に聞きに行きました。'),
(7, '今日は支給物品の在庫の管理を行いました。'),
(4, '今日は社長も含めての全体会議を行いました。'),
(8, '今日はユーザーからのクレームの対応を行いました。');

Q4
UPDATE people SET department_id=2 WHERE person_id=1;
UPDATE people SET department_id=3 WHERE person_id=2;
UPDATE people SET department_id=4 WHERE person_id=3;
UPDATE people SET department_id=2 WHERE person_id=4;
UPDATE people SET department_id=2 WHERE person_id=5;
UPDATE people SET department_id=2 WHERE person_id=6;

Q5
SELECT age, name FROM people WHERE gender=1 ORDER BY age DESC;

Q6
テーブル `people` から、
カラム'department_id'の値が１の人の、
レコードの名前、e-mail、年齢を
カラム`created_at`の値の昇順で取得しなさい。

Q7
SELECT name FROM people WHERE (gender=2 AND age BETWEEN 20 AND 29) OR (gender=1 AND age BETWEEN 40 AND 49);

Q8
SELECT name FROM people WHERE department_id=1 ORDER BY age;

Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id=2 AND gender=2;

Q10
SELECT p.name, d.name, r.content FROM people p JOIN departments d USING (department_id)
JOIN reports r USING (person_id);

Q11
SELECT p.name FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE r.content IS NULL;