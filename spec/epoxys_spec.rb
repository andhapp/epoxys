require File.expand_path(File.dirname(__FILE__) << '/spec_helper.rb')

describe 'Epoxys Application' do
  
	it "should pick the spec files for autotest" do
		get '/'
		follow_redirect!
		last_request.url.should == 'http://epoxy.andhapp.com/'
	end

	it "should paste the code supplied and pass the url back" do 
		post '/paste/create', :code => 'This is the nth test @ 08:01', :syntax => 'ruby', :author => 'andHapp', :description => 'This is an API test for the ubiquity at 08:00 in the morning.', :is_private => false, :password => '', :secret_key => ''
		last_response.should be_ok
		last_response.body.should match(/^(.*)([0-9]+)(.*)/)
	end

end