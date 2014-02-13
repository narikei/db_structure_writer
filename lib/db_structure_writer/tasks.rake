require 'db_structure_writer'

namespace :db_structure_writer do

  task :generate do
    puts "html generate"
    Rake::Task[:environment].invoke
    DbStructureWriter::Generate.html
    puts "Done!"
  end

end

desc "DB html file generate"
task :db_structure_writer => "db_structure_writer:generate"
