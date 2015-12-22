require_relative "../../../models/post"

class Post::Create < Trailblazer::Operation
  contract do
    property :title
    property :url_slug
    property :content

    include Reform::Form::Dry::Validations

    validation :default do
      key(:title, &:filled?)
      key(:url_slug) { |slug| slug.format?(/^[\w-]+$/) & slug.unique? }

      def unique?(value)
        form.model.class[url_slug: value].nil?
      end

      configure { |config|
        config.messages_file = 'concepts/post/operation/dry_error_messages.yml'
      }
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
