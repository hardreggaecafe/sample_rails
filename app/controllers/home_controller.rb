class HomeController < ApplicationController
  def index
    @text = "<h1>Hello World</h1>"
    @posts = Post.all
  end
end
