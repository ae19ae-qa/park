
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытий
Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	
	// 2. Определяем условие, при котором нужно удаление проверяемого реквизита
	Если ВидНоменклатуры <> Перечисления.ВидыНоменклатуры.ПосещениеАттракциона Тогда
	
		// 1. Находим индекс того реквизита, заполнение которого нужно проверить
		ИндексРеквизита = ПроверяемыеРеквизиты.Найти("КоличествоПосещений");
		// Если индекс существует, то удаляем реквизит из массива обязательных к заполнению
		Если ИндексРеквизита <> Неопределено Тогда
			ПроверяемыеРеквизиты.Удалить(ИндексРеквизита);		
		КонецЕсли;
		
	КонецЕсли;	
	
КонецПроцедуры
#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций

#КонецОбласти

#Область Инициализация

#КонецОбласти

#КонецЕсли
