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
require 'slacking/nerdz'
require 'slacking/twitter'
require 'slacking/facebook'

module Slacking; class Slacking
	def Slacking.get_config(config_file_name)
		datas = {}
		config_file = File.open(config_file_name, 'r') { |file|
			while line = file.gets
				next if line[0] == '#'
				ary = line.split('=>')
				datas[ary[0].to_sym] = ary[1].split(':').each { |elm| elm.strip! }
			end
		}
		datas
	end
end; end
