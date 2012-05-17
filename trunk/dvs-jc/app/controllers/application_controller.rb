# -*- coding: undecided -*-

require 'dvs-password'
# Make sure dvs-password.rb exists, with a secure password, e.g.:
# 
#     module DvsPassword
#       def self.password
#         return "p@$$w0rD" # choose a different password than this :)
#       end
#     end

class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => "dvs", :password => DvsPassword.password

  protect_from_forgery
end
