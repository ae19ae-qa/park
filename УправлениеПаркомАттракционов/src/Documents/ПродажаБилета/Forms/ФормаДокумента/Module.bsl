
#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

// Расчет суммы документа при изменении скидки
&НаКлиенте
Процедура БаллыКСписаниюПриИзменении(Элемент)
	РасчетСуммыДокумента();
КонецПроцедуры

// Расчет скидки при изменении суммы документа
&НаКлиенте
Процедура СуммаДокументаПриИзменении(Элемент)
	Объект.БаллыКСписанию = Объект.ПозицииПродажи.Итог("Сумма") - Объект.СуммаДокумента;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыПозицииПродажи
	
// Автоподстановка цены
&НаКлиенте
Процедура ПозицииПродажиНоменклатураПриИзменении(Элемент)
	
	СтрокаТЧ = Элементы.ПозицииПродажи.ТекущиеДанные;
	СтрокаТЧ.Цена = ПодстановкаЦены(СтрокаТЧ.Номенклатура, Объект.Дата);
	
КонецПроцедуры

// Расчет суммы по строке
&НаКлиенте
Процедура ПозицииПродажиЦенаПриИзменении(Элемент)
	СтрокаТЧ = Элементы.ПозицииПродажи.ТекущиеДанные;
	РассчитатьСуммуСтроки(СтрокаТЧ);
КонецПроцедуры

&НаКлиенте
Процедура ПозицииПродажиКоличествоПриИзменении(Элемент)	
	СтрокаТЧ = Элементы.ПозицииПродажи.ТекущиеДанные;
	РассчитатьСуммуСтроки(СтрокаТЧ);
КонецПроцедуры

&НаКлиенте
Процедура ПозицииПродажиПриИзменении(Элемент)
	РасчетСуммыДокумента();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(СтрокаТЧ)
	СтрокаТЧ.Сумма = СтрокаТЧ.Цена * СтрокаТЧ.Количество;
КонецПроцедуры

&НаКлиенте
Процедура РасчетСуммыДокумента()
	Объект.СуммаДокумента = Объект.ПозицииПродажи.Итог("Сумма") - Объект.БаллыКСписанию;
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПодстановкаЦены(Знач Номенклатура, Знач Период)
	
	// Цену получаем из регистра сведений ЦенвНоменклатуры
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЦеныНоменклатурыСрезПоследних.Цена
		|ИЗ
		|	РегистрСведений.ЦеныНоменклатуры.СрезПоследних(&Период, Номенклатура = &Номенклатура) КАК
		|		ЦеныНоменклатурыСрезПоследних";
	
	Запрос.УстановитьПараметр("Период", Период);
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	
	Выборка = Запрос.Выполнить().Выбрать();
	
	// Если цена установлена, то
	Если Выборка.Следующий() Тогда
		Возврат Выборка.Цена;
	КонецЕсли;
	
	// Если цена не установлена, то
	Возврат 0;
		
КонецФункции
#КонецОбласти
