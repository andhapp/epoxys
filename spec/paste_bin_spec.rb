require "spec"
require "spec/interop/test"
require File.join(File.dirname(__FILE__), "..", 'lib', 'paste_bin')

describe 'Paste Bin' do 

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

		@paste_bin_object = PasteBin.new(@url, @post_method, @code, @syntax, @author, @description, @is_private, @password, @secret_key, @api_key)
	end
	
	it "should create a paste bin object" do 
		@paste_bin_object.should_not be_nil
	end

	it "should have correct url" do 
		@paste_bin_object.url.should eql(@url)
	end

	it "should have correct post method" do 
		@paste_bin_object.post_method.should eql(@post_method)
	end
	
	it "should have correct code" do 
		@paste_bin_object.code.should eql(@code)
	end

	it "should have correct syntax type" do 
		@paste_bin_object.syntax.should eql(@syntax)
	end

	it "should have correct author" do 
		@paste_bin_object.author.should eql(@author)
	end

	it "should have correct description" do 
		@paste_bin_object.description.should eql(@description)
	end

	it "should have correct accessibility status" do 
		@paste_bin_object.is_private.should eql(@is_private)
	end

	it "should have correct password if any" do 
		@paste_bin_object.password.should eql(@password)
	end

	it "should have correct secret key" do 
		@paste_bin_object.secret_key.should eql(@secret_key)
	end

	it "should have correct api key" do 
		@paste_bin_object.api_key.should eql(@api_key)
	end

end