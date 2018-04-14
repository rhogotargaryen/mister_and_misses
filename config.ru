require './config/environment'

use Rack::Static, :urls => ['/bootstrap', '/css', '/js', '/img'], :root => 'public'

run ApplicationController