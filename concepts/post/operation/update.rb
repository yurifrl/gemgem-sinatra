require_relative "create"

class Post::Update < Post::Create
  def model!(params)
    Post[params[:id]]
  end
end