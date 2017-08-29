require 'sqlite3'

db = SQLite3::Database.new	'barbershop.db'

db.execute 'select * from Users' do |row|
	puts "#{row[1]} - записался на приём #{row[2]}"
	puts '===='
end