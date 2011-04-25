# -*- encoding: utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

VERSION = "0.2-dev"
INITIAL_BOARDS = [
	{alias: :b,		name: 'Бред', 								level: 0},
	{alias: :cr,	name: 'Творчество', 					level: 0},
	{alias: :d,		name: 'Обсуждение', 					level: 0},

	{alias: :bb,	name: 'Бред+', 								level: 1},
	{alias: :mu,	name: 'Музыка', 							level: 1},
	{alias: :bo,	name: 'Книги', 								level: 1},
	{alias: :s,		name: 'Программы', 						level: 1},
	{alias: :vg,	name: 'Видеоигры', 						level: 1},
	{alias: :tv,	name: 'Кино и ТВ', 						level: 1},
	{alias: :zen,	name: 'Дзен', 								level: 1},
]
$registration = true

Haml::Template.options[:format] = :xhtml
Haml::Template.options[:ugly] 	= true


# Initialize the rails application
Rakaba::Application.initialize!
