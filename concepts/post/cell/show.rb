module Post::Cell
  class Show < ::Cell::Concept
    # self.view_paths = ["concepts/post/view"]
    property :title
    property :content

    include Cell::Slim

    def show
      render view: :show, prefixes: ["concepts/post/view"]
    end
  end
end