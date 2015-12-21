require_relative "../../../models/post"

class Post::Create < Trailblazer::Operation
  contract do
    property :title
    property :content

    include Reform::Form::Dry::Validations
    validation :default do

    end
  end
end