﻿# encoding: utf-8
# language: ru

@IgnoreOnCIMainBuild
@DocumentationBuild
@tree

Функционал: Инструкция по передаче параметров в подчинённый сценарий
	Как Разработчик
	Я Хочу чтобы я мог передавать в подчинённые сценарии параметры
	Чтобы я мог более эффективно применять повторное использование шагов
 
Контекст:
	Дано я убедился, что служебные файлы по фиче передаче параметров в сценарии удалены
	
Сценарий: Передача параметров во вложенный сценарий
		
	Когда я открываю текстовый редактор
	И в текстовом редакторе я выбираю подсветку языка Gherkin
	
	Теперь напишем простой feature файл по созданию элемента справочника
			И обратите внимание 'В принципе его можно накликать мышкой, но мы посмотрим как это делается кодом'
			И я пишу "@ExportScenarios"
			И я пишу "Функционал: Создание элемента справочника Товары "
			И я пишу "Как Разработчик "
			И я пишу "Я хочу чтобы у меня был сценарий для создания элемента справочника Товары "
			И я пишу "Чтобы я мог его переиспользовать в других сценариях "
			И я пишу '	Сценарий: Я создаю элемент справочника Товары с наименованием "Элемент" '
			И обратите внимание 'Обратите внимание на параметр "Элемент". Вызывая сценарий извне, мы будем менять его значение.'
			И я пишу 'Когда В панели разделов я выбираю "Основная" '
			И я пишу 'И     В панели функций я выбираю "Товары" '
			И я пишу 'И     я нажимаю на кнопку "Создать" '
			И я пишу 'И     в поле "Наименование" я ввожу текст "Элемент" '
			И я пишу 'И     Пауза 4 '
			И я пишу 'И     я нажимаю на кнопку "Записать и закрыть" '
			И обратите внимание 'Обратите внимание на тег ExportScenarios. Его нужно указать, чтобы сценарий можно было вызывать из других feature файлов.'
	И я сохраняю файл открытый в редакторе как "Support\Instructions\Temp\СозданиеОдногоЭлементаСправочникаТовары.feature"
	
	Теперь рядом создадим второй feature файл, который будет вызывать только что созданный сценарий
			И я создаю в текстовом редакторе новый файл
			И в текстовом редакторе я выбираю подсветку языка Gherkin
			И я пишу "Функционал: Создание нескольких элементов справочника Товары "
			И я пишу "Как Разработчик "
			И я пишу "Я хочу создавать элемент справочника Товары одной строкой "
			И я пишу "Чтобы я экономил своё время "
			И я пишу '	Сценарий: Создание нескольких элементов справочника Товары '
			И я пишу 'Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий '
			И я пишу 'И я прижимаю активное окно вправо '
			И обратите внимание 'Теперь мы будем вызывать подчинённый сценарий 3 раза с разными параметрами'
			И я пишу 'Когда Я создаю элемент справочника Товары с наименованием "Элемент1" '
			И я пишу 'И     Я создаю элемент справочника Товары с наименованием "Второй элемент" '
			И я пишу 'И     Я создаю элемент справочника Товары с наименованием "Другой элемент" '
			И я пишу 'И     Я закрываю сеанс TestClient '
	И я сохраняю файл открытый в редакторе как "Support\Instructions\Temp\СозданиеНесколькихЭлементовСправочникаТовары.feature"
	И я закрываю текстовый редактор
			
		
	Теперь проверим работу второго feature файла
			Когда Я запускаю сеанс TestManager в служебной базе
			И я прижимаю активное окно влево
			И     Я нажимаю на кнопку диалога выбора файлов
			И в открывшемся окне я указываю путь к обработке Vanessa-behavior.epf 
			И     Я нажимаю на кнопку Загрузить одну фичу
			Тогда в открывшемся окне я указываю путь к фиче "Support\Instructions\Temp\СозданиеНесколькихЭлементовСправочникаТовары.feature"
			И пауза 5
			И Я нажимаю на кнопку Выполнить Сценарии
			И я ожидаю окончания выполнения сценариев в сеансе служебной базы
			И обратите внимание 'Таким образом было создано три элемента справочника Товары'
			
			
	И обратите внимание 'Спасибо за внимание!'
			