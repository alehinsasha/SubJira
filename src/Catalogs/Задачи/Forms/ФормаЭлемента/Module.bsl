
&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)

	
	ТекущийОбъект.ДополнительныеСвойства.Вставить("Описание", Описание);	
	ТекущийОбъект.ДополнительныеСвойства.Вставить("РедакторОписания", РедакторОписания);	


КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ОписанияПоОбъектам.Описание,
		|	ОписанияВХранилищах.Хранилище,
		|	ОписанияВФайлах.РасположениеФайла
		|ИЗ
		|	РегистрСведений.ОписанияПоОбъектам КАК ОписанияПоОбъектам
		|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.ОписанияВФайлах КАК ОписанияВФайлах
		|		ПО ОписанияПоОбъектам.Описание = ОписанияВФайлах.Описание
		|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.ОписанияВХранилищах КАК ОписанияВХранилищах
		|		ПО ОписанияПоОбъектам.Описание = ОписанияВХранилищах.Описание
		|ГДЕ
		|	ОписанияПоОбъектам.Объект = &Объект";
	
	Запрос.УстановитьПараметр("Объект", ТекущийОбъект.Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	ВыборкаДетальныеЗаписи.Следующий();

	Описание = ВыборкаДетальныеЗаписи.Описание;
	РедакторОписания = ВыборкаДетальныеЗаписи.Хранилище.Получить();



КонецПроцедуры
