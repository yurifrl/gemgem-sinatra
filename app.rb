require "sinatra"
require_relative "config/init"

require "trailblazer/operation"
require "reform/form/dry"
require "cells"
require "cells-slim"

# TODO: use trailblazer-loader.
require_relative "concepts/post/operation/create.rb"
require_relative "concepts/post/cell/new.rb"


get "/" do
  op = Post::Create.present({})
  op.inspect

  Post::Cell::New.(op).()
end