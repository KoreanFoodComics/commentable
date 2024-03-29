require 'spec_helper'

feature 'Commenting on a resource' do
  background do
    create(:user)
    visit news_path create(:news)
  end

  scenario 'Commenting with valid data and non-js' do
    fill_in 'Comment', :with => 'Test Comment'
    click_button 'Submit'
    page.should have_content 'Test Comment'
    page.should have_content 'Test User'
  end

  scenario 'Commenting with valid data and js', :js => true do
    fill_in 'Comment', :with => 'Test Comment'
    click_button 'Submit'
    page.should have_content 'Test Comment'
    page.should have_content 'Test User'
    comment_form.should be_empty
  end

  scenario 'Commenting with invalid data and non-js' do
    click_button 'Submit'
    page.should have_content 'You did not make a comment'
  end

  scenario 'Commenting with invalid data and js', :js => true do
    click_button 'Submit'
    page.should have_content 'You did not make a comment'
  end

  def comment_form
    find('form#new_comment textarea').value
  end
end

feature 'Viewing the comments for a resource' do
  background do
    user_1     = create(:user)
    user_2     = create(:user, :name => 'Other User')
    @news_1    = create(:news)
    @news_2    = create(:news)
    @comment_1 = create(:comment, :commentable => @news_1, :commenter => user_1)
    @comment_2 = create(:comment, :commentable => @news_1, :commenter => user_2, :body => 'Another comment')
    @comment_3 = create(:comment, :commentable => @news_2, :commenter => user_2, :body => 'Bad comment')
  end

  scenario 'authenticated' do
    visit news_path(@news_1)
    page.should     have_comment(@comment_1)
    page.should     have_comment(@comment_2)
    page.should_not have_comment(@comment_3)
    page.should     have_selector('form#new_comment')
  end

  scenario 'not authenticated' do
    NewsController.any_instance.stubs(:current_user).returns(nil)
    visit news_path(@news_1)
    page.should     have_comment(@comment_1)
    page.should     have_comment(@comment_2)
    page.should_not have_comment(@comment_3)
    page.should_not have_selector('form#new_comment')
  end
end
