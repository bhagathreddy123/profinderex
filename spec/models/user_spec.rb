require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    let(:user) { build :user }
    let(:user1) {create(:user, state: nil)}
    let(:user2) {build(:user, email: user.email, contact_number: user.contact_number)}

    it "should be valid user with all the attributes" do
      expect(user.valid?).to eq(true)
    end

    
    it "should be save a state name as country if country doesn't have state" do
      expect(user1.state).to eq(user1.country)
    end

    it "should raise invalid record exception for dulplicate email and contact number" do 
      user.save 
      expect(user2.save).to eq(false)
      expect{user2.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'When deleting a user' do 
    let(:user) { create :user }
    let(:front_end_skill1) { create :front_end_skill }
    let(:front_end_skill2) { create :front_end_skill, name: "CSS3" }
    let(:front_end_skill3) { create :front_end_skill, name: "Bootstrap" }
    let(:front_end_skill4) { create :front_end_skill, name: "ReactJS" }


    let(:back_end_skill1) { create :back_end_skill }
    let(:back_end_skill2) { create :back_end_skill, name: "Node.JS" }
    let(:back_end_skill3) { create :back_end_skill, name: "Java" }
    let(:back_end_skill4) { create :back_end_skill, name: "Python" }

    let!(:user_skill1) { create :user_skill, user: user, skill: front_end_skill1, rating: 8 }
    let!(:user_skill2) { create :user_skill, user: user, skill: front_end_skill2, rating: 8 }
    let!(:user_skill3) { create :user_skill, user: user, skill: front_end_skill3, rating: 8 }
    let!(:user_skill4) { create :user_skill, user: user, skill: front_end_skill4, rating: 8 }
    let!(:user_skill5) { create :user_skill, user: user, skill: back_end_skill1, rating: 8 }
    let!(:user_skill6) { create :user_skill, user: user, skill: back_end_skill2, rating: 8 }
    let!(:user_skill7) { create :user_skill, user: user, skill: back_end_skill3, rating: 8 }
    let!(:user_skill8) { create :user_skill, user: user, skill: back_end_skill4, rating: 8 }

    it "should destroy all user skills" do 
      expect(user.skills.count).to eq(8)
      user.destroy
      expect(user.skills.count).to eq(0)
    end
  end
end
