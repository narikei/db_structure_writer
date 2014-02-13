module DbStructureWriter
  module Template

    class << self
      def generate(table_list)
        str  = '<html><body>'

        str += "<h1>#{Rails.application.class.parent_name} DB tables</h1>"
        str += disp_nav(table_list)

        puts "total #{table_list.count} tables"
        table_list.each do |table|
          str += disp_table(table)
        end

        str += '</body></html>'
        str
      end

      private
      def disp_nav(table_list)
        str  = '<ul>'
        table_list.each do |table|
          str += "<li><a href=\"\##{table}\">#{table}</a></li>"
        end
        str += '</ul>'
        str
      end

      def disp_table(table)
        str  = "<div id=#{table}>"
        str += "<h2>#{table}</h2>"
        begin
          columns = Module.const_get(table.classify).columns

          str += '<table border="1">'
          str += table_head

          columns.each do |column|
            str += table_row(column)
          end

          str += "</table>"

          puts "    #{table} ok"
        rescue
          str += "<p>model not found</p>"
          puts "    #{table} ng"
        end
        str += '</div>'
        str
      end

      def table_head
        str  = '<tr>'
        str += '<th>name</th>'
        str += '<th>primary</th>'
        str += '<th>sql_type</th>'
        str += '<th>type</th>'
        str += '<th>limit</th>'
        str += '<th>null</th>'
        str += '<th>default</th>'
        str += '</tr>'
        str
      end

      def table_row(column)
        str  = '<tr>'
        str += "<td>#{column.name}</td>"
        str += "<td>#{'◯' if column.primary}</td>"
        str += "<td>#{column.sql_type}</td>"
        str += "<td>#{column.type}</td>"
        str += "<td>#{column.limit}</td>"
        str += "<td>#{'◯' if column.null}</td>"
        str += "<td>#{column.default}</td>"
        str += '</tr>'
      end
    end

  end
end
