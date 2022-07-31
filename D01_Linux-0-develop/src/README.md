## Part 1. Установка ОС

Скачал версию убы с оф сайта https://releases.ubuntu.com/20.04/. Это версия LTS, если интересно, то переводится, как, версия ядра с расширенной поддержкой.

Вообще существуют  и другие версии ядра, например: mainline(ЭТО ОСНОВА, ЭТО БАЗА, ну ты понял...); rt(пропатченное ядро, для поддержки исполнения в режиме риал тайма); zen и hardened etc(тоже патченные но для определенных целей, защита, производительность и тд); libre(чистое ядро, для любителей быть НЕ ТАКИМИ КАК ВСЕ и тех кто плюеться от удобства уже имеющехся драйверов и расширений); есть еще экзотика Debian GNU/Hurd(но це не GNU/Linux уже).

Итак, перейдем к заданиям. Установка линукса. Если все прошло успешно то ты обязательно встретишь такое окошко

![]([https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%83%D1%81%D0%BF%D0%B5%D1%88%D0%BD%D0%B0%D1%8F%20%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0.png](https://github.com/13themis/linux-part1-3/blob/main/D01_Linux-0-develop/src/1-6/%D1%83%D1%81%D0%BF%D0%B5%D1%88%D0%BD%D0%B0%D1%8F%20%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0.png))

Дальше перезагружаем ОС и уже заходим под userом, которого создали при установке. И проверим что там наустанавливал.


    cat /etc/issue

![]([https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F%20%D1%83%D0%B1%D1%8B%20.png](https://github.com/13themis/linux-part1-3/blob/main/D01_Linux-0-develop/src/1-6/%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F%20%D1%83%D0%B1%D1%8B%20.png))

Для того чтобы дальше не вводить монотонно sudo и не беситься от того, что я не могу редактировать какой либо из конфигов без рут подтверждения, то сразу зайду под рутом.

![]([https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%80%D1%83%D1%82%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D0%BD%D0%B5%20%D0%B2%D0%B2%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%81%D1%83%D0%B4%D0%BE.png](https://github.com/13themis/linux-part1-3/blob/main/D01_Linux-0-develop/src/1-6/%D1%80%D1%83%D1%82%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D0%BD%D0%B5%20%D0%B2%D0%B2%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%81%D1%83%D0%B4%D0%BE.png))


## Part 2. Создание пользователя

Для чего вообще может это пригодиться, если только не для создания челов на компе? На самом деле, это одно из базовых правил безопасности рабты за коплюктерами вашими. НИКОГДА НЕ ДЕЛАТЬ НИЧЕГО ИЗ ПОД РУТА ЕСЛИ НЕТ УВЕРЕННОСТИ В ДЕЙСТВИЯХ. Когда идет работа под правами супер пользователя, мы работаем почти на самом ядре, соответственно, ряд системных вызовов, пару файликов, апликейшенов и странных драйверов установленных из под рута упокоют ваше ядро на веки вечные, а может быть и получат доступы к вашим данным или еще чего плохое. Для этого и стоит создавать сразу еще одного пользака, и сразу его определить в группу приблеженных к супервользователю.

    adduser <name_user>

После чего, система создаст пользака, домашнюю директорию, предложит создать пароль пользователя, ну и потом кучу необязательной инфы.

Касаемо пассов. В линуксе нельзя создать пользователя без пасса, это обязательный критерий создания.

После создания пользователя, желательно его закинуть в какую нибудь группу, мы же не просто так его создали, верно :)

 блягодаря группам, намного удобнее администрировать большое количество пользователей, понимать что происходит в системе, кто мог что то сделать не так, и кто не смог закрыть Vim(очень глупая и надоевшая всем  шутка).

    usermod -aG sudo <name_user>

не буду пояснять за флаги тут, думаю каждый может открыть ман и прочитать про них, за флагами идет название группы, а дальше все понятно. Давай чекним, что вышло из всего этого? Посмотри файлик /**passwd**.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%81%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%20%D0%B8%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D0%B3%D1%80%D1%83%D0%BF%D0%BF%D1%83%20%D1%81%D1%83%D0%B4%D0%BE.png)

## Part 3. Настройка сети ОС

Для начала разберемся с некоторыми моментами. Что такое **DHCP**, **IP**, **MAC**, **сетевые тырфейсы** и тд.

**DHCP** - это протокол динамической настройки хоста. Это прикладной протик(прикладной, значит что робит на 4лвле модели оси, значит транспортный). Сделан для того, чтобы когда ты приносишь домой новый компуктер или там консоль, телефон, после включения и конекта к сети, и твой комп работал, он должен получить адрес. **IP** - это адрес, который получает устройство от днс сервера. И ты спросишь, чел, а как он получает, когда он вообще без адреса и делает запрос, как сервер понимает, что это моему компу нужен ip?

Чееел, все просто, для этого есть **МАС** адрес устройства. МАС это такой же адрес и игдификатор устройства в сети.

Ну и как вообще все выглядит. Комп отсылает пакет на сервер с запросом на получение ip. Сервер кидает ему офер, и комп опять кидает серверу пакет, что он все получил. Сервер реервирует этот ip на какое то время, и когда аренда этого ip закончится, вся эта цепочка повторится снова.

Теперь про **сетевые тырфейсы**. Их не так много, они делятся на проводные и беспроводные. Например, все что начинается с enp - то Ethernet, но так будет если дистр использует *systemd*, иначе будет eth. А беспроводные это wlp или wlx (*systemd*). БЕЗ(*systemd*) wlan.

Ну а остальные, это виртуальные.  и один из таких это **lo**. Через него апликанты общаються с компутером.
Отлично теперь можно и на картинки посмотреть.

Давай установим нашу тайм зону! Она конфигурируеться в файле тайм зоны, а потом просто устанавливаеться системными вызовами.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%84%D0%B0%D0%B9%D0%BB%20%D1%82%D0%B0%D0%B9%D0%BC%D0%B7%D0%BE%D0%BD%D1%8B.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%82%D0%B0%D0%B9%D0%BC%20%D0%B7%D0%BE%D0%BD%D1%8B.png)

Теперь выведим сетевый интерфейсы. Есть много разных способов вывода и интерфесов, и другой сетевой информации(на своих скринах показываю разные варианты), но в рамках задания мы используем *ip*

    ip addr show

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%82%D1%8B%D1%80%D1%84%D0%B5%D1%81%D1%8B%20%D0%B8%20%D0%B8%D0%BF.png)

Дальше найдем наш шлюз акей маршрутизатор. Кстати, я так же покажу еще варианты вывести и шлюз и сразу карту с адресами.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%B0%D0%B4%D1%80%D0%B5%D1%81%D1%81%20%D1%88%D0%BB%D1%8E%D0%B7%D0%B0.png)

### Окей, погнали делать статику и прописывать ДНСы

Для чего вообще нужна статика? Ну например сделать твою машину целевой. Вот захотел ты свой сайт или сервер передачи файлов, в народе ftp, ну и согласись, что было бы странным, говорить всем, каждый день что твой сайт теперь на другом адресе. Или другой пример, захотел ты сделать из своего старого компудахтера сетевое хранилище с медиа площадкой, и хочешь подключаться из любой точки мира, то тебе понадобится статика.

для того чтобы это сделать, нужно настроить конфиги, начнем с нетплана он находиться /etc/netplan/00..(огромное название, табнешь).

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%20%D0%BD%D0%B5%D1%82%D0%BF%D0%BB%D0%B0%D0%BD%D0%B0.png)

далее нужно подтвердить все настройки, если все окей, то никаких сообщений об ошибке не вылезет. Ну и сразу пинганем днс сервера, которые мы написали, все работает или нет? А ну и еще, я приведу пример, как кинуть определенное количество пакетов в сервер, чтобы это не шло бесконечно и не пришлось жать Ctrl+C. НО иногда нужно и бесконечная проверка:)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%BF%D0%BE%D0%B4%D1%82%D0%B2%D0%B5%D1%80%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BD%D0%B5%D1%82%D0%BF%D0%BB%D0%B0%D0%BD%D0%B0%20%D0%B8%20%D0%BF%D0%B8%D0%BD%D0%B3%D0%B8%20%D0%B4%D0%BE%20%D0%B4%D0%BD%D1%81.png)

## Part 4. Обновление ОС

Тут долго не будем и обьяснять для чего нужны апдейты системы не буду)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%B0%D0%BF%D0%B4%D0%B5%D0%B9%D1%82%20&%20%D0%B0%D0%BF%D0%B3%D1%80%D0%B5%D0%B9%D0%B4.png)

просто запмни

    update - обновление списка пакетов

    upgrade - обновление системы

ну и потом если ты введешь повторный апгрейд, увидишь, что все круто и ос не нуждаеться в обновления

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BE%D1%82%D1%81%D1%83%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%82.png)

## Part 5.  Использование команды sudo

**SUDO** - это по сути попросить рута дать погонять свои права. А вообще это разрешение рута на выполнение каких то ответственных вещей, те же обновления, установка чего то, удаление или изменения конфигов, в самом начале я говорил, что лучше все делать не из под рута :)

**SU** - команда авторизации. все!

Изначально, как и можно было заметить, система называлась tux, но на всякий слуай вставлю скриншот
![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%85%D0%BE%D1%81%D1%82%D0%BD%D0%B5%D0%B9%D0%BC%20%D0%B5%D0%B2%D0%B0.png)

теперь меняем

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%81%D1%83%D0%B4%D0%BE%20%D0%B5%D0%B2%D0%B0%201.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%81%D1%83%D0%B4%D0%BE%20%D0%B5%D0%B2%D0%B0.png)

все изменения вступят в силу после ребута, пока его не делал, потому чо заданий достаточно много, где потребовалось ребуттать машину, а я решил свести это к минимуму, конфигурируем все и только после ребут.

## Part 6. Установка и настройка службы времени

Да, мы уже вроде бы настроили время но не синхронизировались с ядреными часами по очередному протоколу **NTP**.

давай чекним, чтобы быть уверенными, что все таки не синхронисированны

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/timedate%20%D0%B4%D0%BE%20%D0%BD%D1%82%D0%BF.png)

окей, теперь установим нтп. Сразу установим небольшой сервис, который дает постоянную синхронизацию и мониторинг  ntpdate.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%BD%D1%82%D0%BF.png)

теперь добавим в пул пару серверов и чекним, где же это все находится

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%BD%D1%82%D0%BF%20%D0%B4%D0%B0%D1%82%D0%B0%20+%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D0%B0.png)

добавим в пул еще один сервер ntp.org, но только теперь в конфиге.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D1%82%D0%BF%20+%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D0%B0.png)

ну а теперь чекним демона нтп и синхронизацию

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/1-6/%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D0%B4%D0%B5%D0%BC%D0%BE%D0%BD%D0%B0%20%D0%BD%D1%82%D0%BF%20%D0%B8%20%D1%81%D0%B8%D0%BD%D1%85%D1%80%D0%BE%D0%BD%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8E.png)

## Part 7. Установка и использование текстовых редакторов.

На сегодняшний день, у убунты из коробки уже есть 2 самых популярных и главнх редактора, а именно: Vim и nano. Но даже если их нет, это не беда, накатываются они за секунду.

    sudo apt-get install vim && nano

чтобы проверить есть ли вим или нано, достаточно просто написать **vim** // **nano**. Они откроются в приветственном формате.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%B2%D0%B8%D0%BC.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BD%D0%B0%D0%BD%D0%BE.png)

Теперь давай создадим несколько файлов в названиях укажем имена редакторов и откроем один из них с помощью вима.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D1%81%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%20%D0%B8%20%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B5%20%D1%80%D0%B5%D0%B4%D0%B0%D0%BA%D1%82%D0%BE%D1%80%D0%BE%D0%BC.png)

напишу свой ник, сохраню и закрою вим. Сделаю конечно НЕ специально ошибку:)

гайды по виму писать не буду, думаю все тут уже знают, что это.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C%20%D0%B2%20%D0%B2%D0%B8%D0%BC%D0%B5.png)

тоже самое сделаю в нано, но напишу правильно свой ник. гайдов не будет.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C%20%D0%B2%20%D0%BD%D0%B0%D0%BD%D0%BE.png)

теперь посмотрим, все ли записалось в файлах?

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B8.png)

теперь давай сделаем запись без сохранения.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%B2%D0%B8%D0%BC%20%D0%B1%D0%B5%D0%B7%20%D1%81%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BD%D0%B0%D0%BD%D0%BE%20%D0%B1%D0%B5%D0%B7%20%D1%81%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F.png)

а теперь, давай отредактируем файлы с поиском слова по файлу и его заменой.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BF%D0%BE%D0%B8%D1%81%D0%BA:%D0%B7%D0%B0%D0%BC%D0%B5%D0%BD%D0%B0%20%D0%B2%D0%B8%D0%BC.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BF%D0%BE%D0%B8%D1%81%D0%BA:%D0%B7%D0%B0%D0%BC%D0%B5%D0%BD%D0%B0%20%D0%BD%D0%B0%D0%BD%D0%BE.png)

ну и еще раз проверим, что мы там назаменяли

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D1%80%D0%B8%D0%B4%D0%B5%D1%80%D0%BE%D0%B23.png)

## Part 8. Установка и базовая настройка сервиса SSHD

Перейдем к более взрослым вещам. Давай настроем подключение через терминал к **убе**, с которым будет более удобнее работать, потому то он уже сгонфигурирован под меня.

Для такой штуки на понадобится *openSSH-server*, устанавливаеться как и все остальное через **apt install**. Как установили, пора добавить сам ssh в автозагрзку, активировать демона короче. Делаем системный вызов и все.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D0%BC%20%20%D1%81%D1%81%D1%85%20%D0%B2%20%D0%B0%D0%B2%D1%82%D0%BE%D0%B7%D0%B0%D0%B3%D1%80%D1%83%D0%B7%D0%BA%D1%83.png)

проверим, все ли работает

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BE%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BD%D0%BE%D1%81%D1%82%D0%B8.png)

отлично, а теперь пора сделать конфигурацию ssh и подключения.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%20%D1%81%D1%81%D1%85.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D1%84%D0%B0%D0%B9%D0%BB%20%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D0%B8.png)

чтобы функции работали, их нужно раскомитить. Поменяем порт, но порты с двойками пробивают боты, так что лучше на такой порт не менять. Помима порт, сделаем запрет подключения, как рут, резрешим публичные ssh ключи, вход с паролем и сохраним. Но вообще, вход по пассам не хорошая практика, как правило, истинные борадатые системные админы, удаляют строку подключения по паролю и создают рса ключи.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%84%D0%B0%D0%B9%D0%BB%20%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D0%B8.png)

чтобы конфиг подхватился и заробил, нужно сделать перезапуск службы. Заодно сразу активируем фаервол и кинем ему в правила порты и подключение по ssh. И посмотрим окей или не окей все.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D1%84%D0%B0%D0%B5%D1%80%D0%B2%D0%BE%D0%BB.png)

теперь посмотри что покажет

    netstat -tan
флаги t - а - показывают состояние сокетов n - показывает сетевые адреса, как числа.

этой кмандой мы решили посмотреть состояние портов, если все хорошо, то они должны слушаться, но вобще для более крутого подхода и защите, они настраиваються так, чтобы они находились в статусе нефильрованных(то есть чтобы не было понятно, слушаеться он или нет).

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BD%D0%B5%D1%82%D1%81%D1%82%D0%B0%D1%82.png)

ну и теперь просто подключимся по ssh к виртуальной тачке.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/7-8/%D0%BF%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BF%D0%BE%20%D1%81%D1%81%D1%85.png)

## Part 9. Установка и использование утилит top, htop

Утилиты top && htop идут так же из коробки. Вообще это системные утилиты мониторинга процессов, акей диспетчер задач в форточнике.

запустим топ, для этого просто в консоли нужно написать

    top || htop

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/top.png)

немного наведем красоты, это можно сделать с помощью выбора цветовой гамы Z. Но это не совсем для этого, а для того чтобы можно было отличать несколько окон. Да можно сделать несколько виртуальных окон нажав на А.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/%D1%82%D0%BE%D0%BF%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%B8%D0%B9.png)

теперь разберемся по выводу. В верхнем левом углу показанно текущее время, следом идет **UP** кторый показывает время работы системы( если нужно просто узнать время работы, просто напишите команду в консль *uptime*).

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/uptime.png)

Дальше идет количество авторизованных пользователей. load acerage это средняя загрузка системы.

Таски - это количество текущих запущенных процессов, run работающие прямо сейчас, sleeping - думаю название говорит само за себя.

У каждого процесса есть свой id || PID, он появляеться при каждом запуске процесса, PID 1 это работа ОС. Столб пользователей показывает, кому принадлежит процесс. **RT** - приоритет задачи.
**NI** - nice, если положительны, то низкий приоритет, если отрицательный, значит высокий приоритет. **VIRT** - общее количество используемой виртуальной памяти. **RES** - используемая оперативная память, является подмножеством *VIRT*. **SHR** - размер соместимой памяти, подмножество *RES*. **S** - статус процесса(D - бесперебойный сон, I - простой, R - запущен, S - спит, T - остановлен сигналом).

Все, с обьяснениями закончили, а теперь к делу. Выведем процесс занимающий больше всего памяти

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/%D0%BF%D0%B8%D0%B4%20%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%81%D0%B0%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%B0%D1%8E%D1%89%D0%B5%D0%B3%D0%BE%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%B2%D1%81%D0%B5%D0%B3%D0%BE%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8.png)

вообще, это статичный вывод, фильровать можно по любому столбу и службе

    <NAME_FIELD>=<name_proc>

теперь откроем htop. На вид он красивше, и внизу написан чо можно делать, но на самом деле это все тот же топ, просто немного упрощеннее и графически понятнее.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/htop.png)

давайте отсортируем по PID

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%20%D1%85%D1%82%D0%BE%D0%BF.png)

как можно увидеть, что слева есть такая же сортировка, как и в top но более наглядная, она так же проходит по столбам.

## Part 10. Использование утилиты fdisk

fdisk расскажет на сколько разделов и как разделен диск, помимо этого, расскажет чо по памяти и сколько занимает каждый раздел.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/fdisk%20-l.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/type%20sectors%20fdisk.png)

fdisk выдал нам информацию о 3х разделах, в 1 хранится BIOS, во 2 свап и ядро, и 3 раздел наш, это файловая система. Размер свапа можно не сложно посчитать. Если сама система весит 1.3, то все остальное это свап 200мб.

Кстати, у этой программы есть и интерактивный режим! Тут мы можем посмотреть типы файловой системы и даже применить некоторые.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/fdisk%20interective.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/all%20type%20sectors%20fdisk.png)

## Part 11. использование df

Если нужно узнать сколько свободного места на диске то это df.

    df <опция> устройство

На самом деле можно и без флага, но тогда будет не в особо читаемом виде)
Веведу для примера юез флагов, а после более читаемо с флагом -h -i.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/df%20:.png)

а теперь выведем инфу в читаемом виде и с типами

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/df%20-Th%20:.png)

## Part 12. Использование утилиты du

du расскажет сколько занимает места какой либо файл или директория

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/du.png)

Да, сейчас не особо все понятно, только что вес всей дирректории 88. Переведем ээто в более читаемый вид и откроем логи.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/du%20:var.png)


![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/du%20:var:log.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/9-12/du%20:home.png)

## Part 13. Установка и использование утилиты ncdu

Думаю рассказывать как устанавливать что то уже не требуется, поэтому просто покажу.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/ncdu.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/ncdu%20varlog.png)

## Part 14. Работа с системными журналами.

Теперь перейдем к системным журналам. Давай откроем и посмотрим время последней успешной авторизиции и кто вошел в систему.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/:var:log:auth.png)

А теперь перезапустим ssh  и посмотрим, как это отобразится в логах

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/restart%20ssh.png)

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/%20:var:log:syslog1.png)

А теперь перезапустим систему и опять посмотрим логи

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/%20:var:log:syslog2.png)

## Part 15. Использование планировщика заданий CRON

Теперь с планировщиком, чтобы создать свой конфиг задачи

    crontab -e

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/cron%20file.png)

открылся конфиг, который рассказывает, как и что в нем делать. И да, я знаю, что можно было бы сделать 0/2, но я русский, у меня свой путь, как говорится. А вообще, я задал диапозон с интервалом в 2 минуты от 0 минуты до 58, то есть последние 2 минуты в часе, учитываться не будут.

Теперь посмотрим в логах, все ли отработало.

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/cron%20logs.png)

замечательно! Думаю, как удалять задачи, вопросов не должно возникнуть, но потребовалось вставить скрин, оке)) P.S можно было бы и удалить файлы крона

![](https://repos.21-school.ru/students/D01_Linux.ID_356272/kareypib_student.21_school.ru/D01_Linux-0/-/raw/develop/src/13-15/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202022-06-28%20%D0%B2%209.49.50%20PM.png)

Дорогой пир, спасибо, что ты дошел до конца!
