#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'



def get_db
	db = SQLite3::Database.new 'barbershop.db'
end

configure do
	db = get_db
	puts db
end