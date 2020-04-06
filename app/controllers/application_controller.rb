class ApplicationController < ActionController::Base
  def hello
    render html: "hello, worldz!"
  end
end
