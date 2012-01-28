##########################################################################
#    Giovanni Capuano <webmaster@giovannicapuano.net>
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##########################################################################
require 'net/http'
require 'json/stream'

#class User
#	attr_accessor :id, :username
#	
#	def initialize(id, username)
#		@id = id
#		@username = username
#	end
#end

class NerdzSender
	def initialize
		@cookies = {}
	end
	
	def login(username, password)
		request('login', "username=#{username}&password=#{password}")['error'] == 0
	end
	
	def get_id(username)
		request('get_id', "username=#{username}")['id'].to_i >= 0
	end
	
	def nerdz_it(message, to)
		request('nerdz_it', "message=#{message}&to=#{to}")['error'] == 0
	end
	
	def request(action, post)
		Net::HTTP.start('www.nerdz.eu') { |http|
			res = http.post("/api.php?action=#{action}", post, @cookies)
			@cookies['Cookie'] = res['Set-Cookie'] if res['Set-Cookie'].is_a? String
			JSON::Stream::Parser.parse(res.body)
		}
	end		
end
