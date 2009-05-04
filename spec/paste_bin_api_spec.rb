require "spec"
require "spec/interop/test"
require File.join(File.dirname(__FILE__), "..", 'lib', 'paste_bin_api')

describe 'Paste Bin API' do 

	before(:each) do 
		@url = 'http://openpaste.org/api/xml-rpc/'
		@post_method = 'Openpaste.addPost'
		@code = 'test'
		@syntax = 'ruby'
		@author = 'andHapp'
		@description = 'This is an API test for the ubiquity'
		@is_private = false
		@password = ''
		@secret_key = ''
		@api_key = 3
	end

	it "should return paste id on a successful paste" do
		PasteBinApi.paste_create_new(@url, @post_method, @code, @syntax, @author, @description, @is_private, @password, @secret_key)
		PasteBinApi.paste_id.should_not be_nil
	end

	it "should return paste url on a successful paste" do
		PasteBinApi.paste_create_new(@url, @post_method, @code, @syntax, @author, @description, @is_private, @password, @secret_key)
		PasteBinApi.paste_url.should_not be_nil
	end

end