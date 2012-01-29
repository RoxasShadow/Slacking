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
require 'koala'

module Slacking
class Facebook
	attr_reader :fb
	
	def initialize(access_token)
		@fb = Koala::Facebook::API.new(access_token)
	end
	
	def post(msg)
		@fb.put_wall_post(msg)
	end
	
	def Facebook.get_url(app_id)
		"https://www.facebook.com/dialog/permissions.request?app_id=#{app_id}&display=page&next=https://www.facebook.com/connect/login_success.html&response_type=token&fbconnect=1&perms=publish_stream"
	end
	
	def Facebook.get_token(token)
		ary = token.split('&')
		{ :access_token => ary[0], :expires => ary[1] }
	end
end
end
