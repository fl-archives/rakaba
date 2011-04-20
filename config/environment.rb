# Load the rails application
require File.expand_path('../application', __FILE__)
Haml::Template.options[:format] = :xhtml
Haml::Template.options[:ugly] 	= true
# Initialize the rails application
Rakaba::Application.initialize!
