# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Taskprogect::Application.initialize!

Time::DATE_FORMATS[:due_time] = "%B"
