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

module Slacking
class Nerdz
	def initialize
		@cookies = {}
	end
	
	def login(username, password)
		res = request('login', "username=#{username}&password=#{password}")
		[ res['error'] == 0, res['error'] ]
	end
	
	def get_id(username)
		res = request('get_id', "username=#{username}")
		[ res['id'].to_i > 0, res['error'], res['id'] ]
	end
	
	def post(message, to)
		res = request('nerdz_it', "message=#{message}&to=#{to}")
		[ res['error'] == 0, res['error'] ]
	end
	
	def request(action, post)
		Net::HTTP.start('www.nerdz.eu') { |http|
			res = http.post("/api.php?action=#{action}", post, @cookies)
			@cookies['Cookie'] = res['Set-Cookie'] if res['Set-Cookie'].is_a? String
			JSON::Stream::Parser.parse(res.body)
		}
	end		
end
end
