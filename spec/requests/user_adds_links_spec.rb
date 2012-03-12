require 'spec_helper'

describe "UserAddsLinks" do
  describe "GET /user_adds_links" do
    it "adds a link and redirects to index" do
      get new_link_path
      response.status.should be(200)
      
    end
  end
end
