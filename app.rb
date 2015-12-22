require "sinatra"
require_relative "config/init"

require "trailblazer/operation"
require "reform/form/dry"
require "trailblazer/cells"
require "cells-slim"

Trailblazer::Cell.class_eval do
  include Cell::Slim
  self.view_paths = ["concepts"] # DISCUSS: is that the right place?
end

# TODO: use trailblazer-loader.
require_relative "concepts/post/operation/create.rb"
require_relative "concepts/post/operation/update.rb"
require_relative "concepts/post/cell/new.rb"
require_relative "concepts/post/cell/show.rb"

require_relative "gemgem/cell/layout.rb"

get "/posts/new" do
  op = Post::Create.present({})
  Post::Cell::New.(op, url: "/posts", layout: Gemgem::Cell::Layout).()
end

post "/posts" do
  op = Post::Create.run(params) do |op|
    redirect "/posts/#{op.model.id}"
  end

  Post::Cell::New.(op, url: "/posts", layout: Gemgem::Cell::Layout).()
end

get "/posts/:id" do
  op = Post::Update.present(params)

  Post::Cell::Show.(op.model, url: "/posts", layout: Gemgem::Cell::Layout).()
end

get "/posts/:id/edit" do
  op = Post::Update.present(params)
  Post::Cell::New.(op, url: "/posts/#{op.model.id}", layout: Gemgem::Cell::Layout).()
end

post "/posts/:id" do
  op = Post::Update.run(params) do |op|
    redirect "/posts/#{op.model.id}"
  end

  Post::Cell::Show.(op.model, layout: Gemgem::Cell::Layout).()
end
