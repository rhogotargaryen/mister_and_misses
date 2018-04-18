require './config/environment'

use Rack::Static, :urls => ['/bootstrap', '/css', '/js', '/img'], :root => 'public'
use EventController
use StoryController
use RegController
use PostController
run ApplicationController