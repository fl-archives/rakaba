# -*- encoding: utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

VERSION = "0.1-dev"
INITIAL_BOARDS = {
	b: 		'Бред',
	d: 		'Обсуждение',
	c: 		'Программирование',
	s: 		'Софт',
	a: 		'Анимеговно',
	bb: 	'Бред+'
}

Haml::Template.options[:format] = :xhtml
Haml::Template.options[:ugly] 	= true
# Initialize the rails application
Rakaba::Application.initialize!
