require_relative "../../../models/post"

class Post::Create < Trailblazer::Operation
  contract do
    property :title
    property :content

    include Reform::Form::Dry::Validations
    validation :default do
      key(:title, &:filled?)
    end
  end

  def model!(*)
    Post.new
  end

  def process(params)
    validate(params) do
      contract.save
    end
  end
end