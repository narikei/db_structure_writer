module DbStructureWriter
  module Generate

    attr_accessor :tables

    class << self

      def html
        str = Template.generate(table_list)
        file_put(str)
      end

      private
      def table_list
        @tables ||= ActiveRecord::Base.connection.tables
      end

      def file_put(str)
        puts 'file put'
        file_path = "./db/#{Rails.application.class.parent_name}_db_tables.html".downcase
        f = File.open(file_path, 'w')
        f.puts str
        f.close
        p "generated #{file_path}"
      end
    end

  end
end
