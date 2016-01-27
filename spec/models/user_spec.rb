require 'rails_helper'

describe User do

  # 160127 homewok

  context "admin user" do
    it"can create a admin user" do
      user = create(:admin)
      expect(user.role).to eq "admin"
    end
  end
end
