#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

configure do
	@db = SQLite3::Database.new 'barbershop.db'
	@db.execute 'CREATE TABLE IF NOT EXISTS 
		"Users" 
		(
			"Id" INTEGER PRIMARY KEY AUTOINCREMENT, 
			"Name" TEXT, 
			"Phone" TEXT, 
			"Data_stapm" TEXT, 
			"Barber" TEXT,
			"Color" TEXT
		)'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end
get '/about' do
	@error = 'Something wrong!'
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@user_name = params[:user_name]
	@user_phone = params[:user_phone]
	@user_time = params[:user_time]
	@barber = params[:barber]

	hh = {
		:user_name => "Введите имя",
	    :user_phone => "Введите телефон",
	    :user_time => "Введите дату и время"}

=begin	hh.each do |key, value|
		if params[key]==''
			@error=hh[key]
			return erb :visit
		end
=end

	@error = hh.select{|key,values| params[key] ==""}.values.join(", ")

	if @error != ''
		return erb :visit
	end

	erb "Данные: Имя - #{@user_name}, Телефон: #{@user_phone}, Время записи: #{@user_time}, Парикмахер: #{@barber}"

end

get '/contacts' do
	erb :contacts
end