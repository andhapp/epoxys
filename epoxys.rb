$LOAD_PATH.unshift File.dirname(__FILE__) + '/../sinatra/lib'

%w{rubygems sinatra}.each {|x| require x}
require File.join(File.dirname(__FILE__), 'lib', 'paste_bin_api')

get '/' do
	'It works!!!'
end

post '/paste/create' do
	request_url = 'http://openpaste.org/api/xml-rpc/'
	post_method = 'Openpaste.addPost'
	is_private = params[:is_private].eql?("false") ? false : true # the parameters are converted to strings
	PasteBinApi.paste_create_new(request_url, post_method, params[:code], params[:syntax], params[:author], params[:description], is_private, params[:password], params[:secret_key])
	PasteBinApi.paste_url
end