require 'xmlrpc/client'
require File.join(File.dirname(__FILE__), 'paste_bin')

class PasteBinApi

	class << self # makes a singleton class

		attr_reader :post_detail

		def paste_create_new(*args)
			paste_bin = PasteBin.new(*args)
			server = XMLRPC::Client.new2(paste_bin.url)
			@post_detail = server.call2(paste_bin.post_method, paste_bin.code, paste_bin.syntax, paste_bin.author, paste_bin.description, paste_bin.is_private, paste_bin.password, paste_bin.secret_key, paste_bin.api_key)
		end

		#Post detail object is returned in this fashion that you have to use @post_detail[1] to get to the hash containing ID and URL e.g.: @post_detail[1]["ID"]
		define_method(:paste_id) { @post_detail[1]["ID"] }
		define_method(:paste_url) { @post_detail[1]["URL"] }

		# to define methods like paste_id || paste_url 
		# The first conditional deals with paste_create and the other with the other two methods
		#def method_missing(name, *args, &block)
		#	if name.to_s =~ /^(paste_)(.*)$/ and !respond_to?(name)
		#		define_method(name) do
		#			@post_detail[1]["#{$2.capitalize}"] 
		#		end
		#	end
		#end

	end

end