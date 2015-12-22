module Gemgem
  module Cell
    class Layout < Trailblazer::Cell
      self.view_paths = ["."]

      def content
        @options[:content]
      end
    end
  end
end
