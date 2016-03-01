require File.dirname(__FILE__) + '/../spec_helper'

describe "Operation" do
  it "should fail invalid" do
    post = Post::Create.(title: "HELLO", url_slug: "HY").model

    post.persisted?.must_equal false
  end
end

