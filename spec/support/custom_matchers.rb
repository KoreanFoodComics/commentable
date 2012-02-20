RSpec::Matchers.define :have_comment do |comment|
  match do |page|
    page.should have_content comment.commenter_name
    page.should have_content comment.body
  end
end

RSpec::Matchers.define :have_new_comment_form do
  match do |page|
    page.should have_selector('form#new_comment')
  end
end
