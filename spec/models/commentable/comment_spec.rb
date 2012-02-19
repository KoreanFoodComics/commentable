require 'spec_helper'

describe Commentable::Comment do
  it { should     have_valid(:body).when('Test Body') }
  it { should_not have_valid(:body).when(nil, '') }
  
  describe '#commenter_name' do
    let(:user)    { build(:user) }
    let(:comment) { build(:comment, :commenter => user) }
    it 'delegates to the commenter' do
      comment.commenter_name.should eq user.commenter_name
    end
  end
end
