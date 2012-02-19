require 'spec_helper'

describe Commentable::Engine do
  before { Commentable::Engine.stubs(:called_from).returns('/lib/commentable') }

  describe '.app_path' do
    it 'returns the path to the engine app directory' do
      Commentable::Engine.app_path.should eq '/app'
    end
  end

  describe 'controller_path' do
    it 'returns the path to the named engine controller' do
      Commentable::Engine.controller_path(:test_controller).should eq '/app/controllers/commentable/test_controller.rb'
    end
  end

  describe 'helper_path' do
    it 'returns the path to the named engine helper' do
      Commentable::Engine.helper_path(:test_helper).should eq '/app/helpers/commentable/test_helper.rb'
    end
  end

  describe 'mailer_path' do
    it 'returns the path to the named engine mailer' do
      Commentable::Engine.mailer_path(:test_mailer).should eq '/app/mailers/commentable/test_mailer.rb'
    end
  end

  describe 'model_path' do
    it 'returns the path to the named engine model' do
      Commentable::Engine.model_path(:test_model).should eq '/app/models/commentable/test_model.rb'
    end
  end
end

