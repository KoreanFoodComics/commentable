RSpec::Matchers.define :have_comment do |comment|
  match do |page|
    page.should have_content comment.commenter_name
    page.should have_content comment.body
  end
end
