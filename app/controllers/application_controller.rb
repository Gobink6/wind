class ApplicationController < ActionController::Base
 protect_from_forgery
end

class FooController < ApplicationController
  protect_from_forgery except: :index
end
