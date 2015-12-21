module Post::Cell
  class New < ::Cell::Concept
    # self.view_paths = ["concepts/post/view"]

    include Cell::Slim

    def show
      render view: :new, prefixes: ["concepts/post/view"]
    end

  private
    def url
      options[:url]
    end
  end
end
