require 'db_structure_writer'
require 'rails'

module DbStructureWriter
  class Railtie < Rails::Railtie
    rake_tasks do
      load "db_structure_writer/tasks.rake"
    end
  end
end
