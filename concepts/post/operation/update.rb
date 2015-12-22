require_relative "create"

class Post::Update < Post::Create
  contract do
    property :url_slug, readonly: true
  end

  def model!(params)
    Post[params[:id]]
  end
end
