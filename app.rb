require "sinatra"
require_relative "config/init"

require "trailblazer/operation"
require "reform/form/dry"
require "cells"
require "cells-slim"

# TODO: use trailblazer-loader.
require_relative "concepts/post/operation/create.rb"
require_relative "concepts/post/operation/update.rb"
require_relative "concepts/post/cell/new.rb"
require_relative "concepts/post/cell/show.rb"


get "/posts/new" do
  op = Post::Create.present({})
  Post::Cell::New.(op).()
end

post "/posts" do
  op = Post::Create.run(params) do |op|
    redirect "/posts/#{op.model.id}"
  end

  Post::Cell::New.(op).()
end

get "/posts/:id" do
  op = Post::Update.present(params)

  Post::Cell::Show.(op.model).()
end