# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'


#--- begin paste from http://benwoodall.com/2011/06/rails-global-access-to-rake-dsl-methods-is-deprecated/ #
module ::YourApplicationName
  class Application
    include Rake::DSL
  end
end
 
module ::RakeFileUtils
  extend Rake::FileUtilsExt
end
#--- end paste from http://benwoodall.com/2011/06/rails-global-access-to-rake-dsl-methods-is-deprecated/ #

Mochat::Application.load_tasks
