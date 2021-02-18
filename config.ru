require_relative './config/environment'


use Rack::MethodOverride
use PostsController
run ApplicationController