class PasteBin

	attr_reader :url, :post_method, :code, :syntax, :author, :description, :is_private, :password, :secret_key, :api_key
	
	def initialize(url='', post_method='', code='', syntax='ruby', author='', description='', is_private=false, password='', secret_key='', api_key=3)
		@url = url
		@post_method = post_method
		@code = code
		@syntax = syntax
		@author = author
		@description = description
		@is_private = is_private
		@password = password
		@secret_key = secret_key
		@api_key = api_key
	end
	
end