require 'docker'

class Provision

	def initialize() 
		puts 'Docker.url: ' + Docker.url
		puts 'Docker.info: ' + Docker.info.to_s
	end

end


provision = Provision.new()
