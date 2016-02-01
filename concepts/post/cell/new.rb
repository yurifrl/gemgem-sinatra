require "formular"

module Post::Cell
  class New < Trailblazer::Cell
    include Formular::Helper
    Formular::Helper.frontend :bootstrap3

  private
    def url
      options[:url] || raise("no action URL!")
    end
  end
end
