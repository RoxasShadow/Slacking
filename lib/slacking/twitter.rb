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
require 'twitter'

class TwitterSender
	def initialize(consumer_key, consumer_secret, oauth_token, oauth_token_secret)
		Twitter.configure do |config|
			config.consumer_key = consumer_key
			config.consumer_secret = consumer_secret
			config.oauth_token = oauth_token
			config.oauth_token_secret = oauth_token_secret
		end
	end
	
	def tweet(msg)
		Twitter.update(msg)
	end
end
