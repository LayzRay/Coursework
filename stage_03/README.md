# Этап №3. Освоение разработки bash-скриптов

## Работа программ

Просто запустить в первый раз скрипт main.sh, затем вводить данные с модулей.

## Ответы на вопросы

1. *Чем именованные каналы отличаются
от неименованных и что нужно сделать,
чтобы программы encoder и keypad работали
с неименованными каналами?*

Именнованные каналы представляют собой псевдофайлы, имеющие имя, по которым можно отправлять
данные из каких-либо процессов в другие по принципу FIFO. Это позволяет контролировать
поток информации и гибко настраивать взаимодействие.

Неименнованные каналы назначаются напрямую с помощью символов ">" и "<" между двумя
процессами (или между процессом и именованным каналом). 

2. *Что будет, если при запуске bash-скрипта не будут созданы необходимые именнованные каналы?*

Скрипт выдаст ошибку и не будет выполняться, так как не будут обнаружены указанные файлы.
Если в скрипте будет использоваться утилита read, куда и должны записываться данные из канала,
то программа будет просто ждать, пока в указанную переменную ничего не придёт.

3. *Введено ли Вами ограничение на значение вводимого с клавиатуры угла приращения?*

Так точно, введённый угол не должен быть больше 360 градусов. Конечно, можно поворачивать мотор и на больший угол,
есть вероятность, что какая-либо программа будет выдавать значение, выходящее за пределы отрезка [0; 2$\pi$], но
в нашем случае это не рассматривается. Когда мотор поворачивается, он потребляет ток, отчего сильно греется, так
что ограничение имеет и техническую причину.

4. *Как будет работать bash-скрипт, если символ `*` так и не будет введён?*

Получится значение, стремящееся к бесконечно большому, которое не будет принято из-за ограничения в 360 градусов
(если пользователь не устанет набирать числа и не прервёт операцию ввода).

5. *Каким образом Вы запускаете программу на изменение угла поворота электродвигателя из bash-скрипта?*

Если введённое значение соответствует условиям, то bash-скрипт сам запускает программу поворота на заданный угол.

6. *Как влияют аргументы запуска программ `encoder` и `keypad` на время реагирования электродвигателя на изменение угла?*

Все данные из именованных каналов обрабатываются в порядке очереди.

7. *Что будет, если запустить несколько копий bash-скрипта и вводить данные на клавиатуре?*

Вот здесь произойдёт гонка данных, так как несколько процессов будут пытаться отправить данные на один мотор.

8. *Можно ли переписать скрипты, чтобы программы передавали выходные данные без именованных каналов?*

Можно путём использования неименованных каналов в главном скрипте main.sh. Есть возможность перенаправления потока вывода
во внутренние переменные скриптов.

9. *Каким образом можно копировать данные на удаленный репозиторий github?*

Сначала необходимо установить SSH-соединение с аккаунтом помощью токенов (так надёжно), затем отмеченные файлы отправить
через git push origin.

10. *Какие операторы редактора markdown Вы знаете и использовали при составлении инструкции?*

"#, **, **, ``, $$". 
