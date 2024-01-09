# Repository of my course project in PNU
## Романів Юрій ІПЗ-23

### Тема
Тестування знань
### Середовище
- MySql

## приклад використання у вебсайтом
[https://github.com/Yurii-Romaniv/Nlearn](https://github.com/Yurii-Romaniv/Nlearn)


## Діаграма

#### діаграма
![image](img.png)

#### знімок діаграми (з phpMyAdmin)
![image](schemaScreen.png)

## Експорт бази (повністю згенеровано [моїм java застосунком](https://github.com/Yurii-Romaniv/Nlearn))
[NlearnM4.sql](NlearnM4.sql)

## Примітка
привязку тесту до групи(`students_group`) я таки залишив, натомість зробивши відношення між групами і користувачами ManyToMany. На мою думку, завдяки цьому використання бд у вебпроекті сильно спрощується, а також економиться память. Ефективніше створити кілька додаткових груп навіть для нестандартних ситуацій чим при створенні кожного тесту зберігати список усіх користувачів які його проходитимуть 

## Приклади запитів

1)	Показати результати та час проходження тестування  для кожного студента для якого відкритий цей тест.
~~~
SELECT user.name, mark.value, mark.passing_duration_minutes
FROM `user`
         JOIN group_user ON group_user.user_id = user.id
         LEFT JOIN mark ON mark.test_id = 1 AND mark.user_id = user.id
WHERE (SELECT students_group_id FROM `test` WHERE id = 1) = group_user.students_group_id
~~~



2)	Вивести усіх студентів що не мають оцінки з певного тесту.
~~~
SELECT user.name FROM `user`
         JOIN group_user ON group_user.user_id = user.id
         LEFT JOIN mark ON mark.test_id = 1 AND mark.user_id = user.id
WHERE mark.id IS NULL
  AND (SELECT students_group_id FROM `test` WHERE id = 1) = group_user.students_group_id
 ~~~



3)	Відобразити усі тести що були відкриті для студента та оцінки з них.
~~~
SELECT test.name, mark.value FROM `test`
         JOIN group_user ON group_user.user_id = 38
         LEFT JOIN mark ON mark.test_id = test.id AND mark.user_id = 38
WHERE test.students_group_id = group_user.students_group_id 
~~~


4)	Вивести усіх учасників певної групи (результати на рисунку 3.5 ). 
~~~
SELECT user.name, user.email FROM `user`
         INNER JOIN group_user ON group_user.user_id = user.id AND group_user.students_group_id = 1;
 
~~~

5)	Показати до яких груп відноситься студент.
~~~
SELECT group_user.user_id, students_group.name
FROM `students_group`
         INNER JOIN group_user ON group_user.user_id = 38 AND group_user.students_group_id = students_group.id;
~~~



6)	Показати усі варіанти відповіді на запитання тесту які студент обрав хибно.
~~~
SELECT answer_variant.answer_text FROM `answer_variant`
         JOIN mark_detail
              ON mark_detail.selected_answer_variant_id = answer_variant.id AND
                 mark_detail.mark_id = 21
WHERE answer_variant.is_correct = 0;
~~~

7)	Видалити тестування. Завдяки Обмеженням ON DELETE CASCADE  та ON DELETE SET NULL у зовнішніх ключах на тест у таблицях question, test_session_info та mark (а також завдяки таким ж обмеженням на зовнішніх ключах на question) операція видалення тестування спрощується до видалення об’єкту таблиці test. Запитання, варіанти відповіді, оцінки та деталі проходження даного тестування будуть видалені автоматично. Ось приклад такого запиту: 
~~~
DELETE FROM test WHERE test.id = 4;
~~~
8)	Переглянути коротку інформацію про кожен тест автором якого є певний користувач.
~~~  
SELECT test.name, test.end_time, test.duration, students_group.name AS "group name"
FROM `test`
         JOIN students_group ON students_group.id = test.students_group_id
         JOIN user ON test.author_id = user.id
WHERE user.id = 1;
~~~
