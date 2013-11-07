class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Dir["lib/*.rb"].each do |path|
  	require_dependency path
  end 
end
