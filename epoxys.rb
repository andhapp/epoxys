$LOAD_PATH.unshift File.join(File.dirname(__FILE__) + 'vendor', 'sinatra', 'lib')

%w{rubygems sinatra}.each {|x| require x}
require File.join(File.dirname(__FILE__), 'lib', 'paste_bin_api')

get '/' do
	'It works!!!'
end

post '/paste/create' do
	request_url = 'http://openpaste.org/api/xml-rpc/'
	post_method = 'Openpaste.addPost'
	is_private = false #leave it false for default as the user is not allowed to enter the password and one cannot have a private paste without a password ;)
	PasteBinApi.paste_create_new(request_url, post_method, params[:code], params[:syntax], params[:author], params[:description], is_private, params[:password], params[:secret_key])
	PasteBinApi.paste_url
end