require 'xmlrpc/client'
require File.join(File.dirname(__FILE__), 'paste_bin')

class PasteBinApi

	class << self # makes a singleton class

		attr_reader :post_detail

		# To define methods like paste_create_new, paste_id, paste_url 
		# The first conditional deals with paste_create and the second one with paste_id, paste_url 
		def method_missing(name, *args, &block)
			if name.to_s =~ /^(paste_)(.*)$/ and !respond_to?(name)
				if $2.eql?("create_new")
					paste_bin = PasteBin.new(*args)
					server = XMLRPC::Client.new2(paste_bin.url)
					@post_detail = server.call2(paste_bin.post_method, paste_bin.code, paste_bin.syntax, paste_bin.author, paste_bin.description, paste_bin.is_private, paste_bin.password, paste_bin.secret_key, paste_bin.api_key)
				else
					@post_detail[1]["#{$2.upcase}"] # the postdetails object is supplied back like this [true, ["UEL" => "", "ID" => ""]]
				end
			end
			
		end
	end
end