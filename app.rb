require "sinatra"
require_relative "config/init"

require "trailblazer/operation"


# TODO: use trailblazer-loader.
require_relative "concepts/post/operation/create.rb"


get "/" do
  op = Post::Create.present({})
  op.inspect
end