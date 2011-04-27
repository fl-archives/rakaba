# -*- encoding: utf-8 -*-
# Load the rails application
require 'digest'
require File.expand_path('../application', __FILE__)

VERSION = "0.2-dev"
SALT = 'porole'
INITIAL_BOARDS = [
	{alias: :b,		name: 'Бред', 								level: 1},
	{alias: :cr,	name: 'Творчество', 					level: 1},
	{alias: :d,		name: 'Обсуждение', 					level: 1},

	{alias: :bb,	name: 'Бред+', 								level: 2},
	{alias: :mu,	name: 'Музыка', 							level: 2},
	{alias: :bo,	name: 'Книги', 								level: 2},
	{alias: :s,		name: 'Программы', 						level: 2},
	{alias: :vg,	name: 'Видеоигры', 						level: 2},
	{alias: :tv,	name: 'Кино и ТВ', 						level: 2},
	{alias: :zen,	name: 'Дзен', 								level: 2},
]
$registration = true

Haml::Template.options[:format] = :xhtml
Haml::Template.options[:ugly] 	= true


# Initialize the rails application
Rakaba::Application.initialize!
