require_relative 'contact'
require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
	#Temporary fake user id = 1000
	Contact.create("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")
	Contact.create("Yehuda", "Katz", "yehuda@example.com", "Developer")
	Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
	Contact.create("Sergey", "Brin", "sergey@google.com", "Co-Founder")

	erb :contacts

	#redirect to ('/')

end

get '/contacts/new' do
	erb :new_contact
end

get	"/contacts/:id" do
	@contact = Contact.find(params[:id].to_i)
	erb :show_contact
end

post '/contacts' do
	Contact.create(params[:first_name], params[:last_name], params[:email], params[:notes])
	redirect to ('/contacts')
end

get '/contacts' do
	erb :contacts
end
