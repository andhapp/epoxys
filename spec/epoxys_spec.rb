%w{epoxys spec spec/interop/test rack/test}.each {|x| require x}

set :environment, :test

describe 'App' do
	include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

	it "should pick the spec files for autotest and display error messages with snarl" do
		get '/'
		last_response.should be_ok
		last_response.body.should eql('It works!!!')
	end

	it "should paste the code supplied and pass the url back" do 
		post '/paste/create', :code => 'This is the nth test @ 08:01', :syntax => 'ruby', :author => 'andHapp', :description => 'This is an API test for the ubiquity at 08:00 in the morning.', :is_private => false, :password => '', :secret_key => ''
		last_response.should be_ok
		last_response.body.should match(/^(.*)([0-9]+)(.*)/)
	end

end