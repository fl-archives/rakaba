# Load the rails application
require File.expand_path('../application', __FILE__)

VERSION = "0.1-dev"
Haml::Template.options[:format] = :xhtml
Haml::Template.options[:ugly] 	= true
# Initialize the rails application
Rakaba::Application.initialize!
