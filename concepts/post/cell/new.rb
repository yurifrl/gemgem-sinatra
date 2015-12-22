module Post::Cell
  class New < Trailblazer::Cell
  private
    def url
      options[:url] || raise("no action URL!")
    end
  end
end
