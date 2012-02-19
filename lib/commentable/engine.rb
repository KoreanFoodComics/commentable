module Commentable
  class Engine < ::Rails::Engine
    isolate_namespace Commentable

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    def self.app_path
      File.expand_path('../../app', called_from)
    end

    %w{controller helper mailer model}.each do |resource|
      class_eval <<-RUBY
        def self.#{resource}_path(name)
          File.expand_path("#{resource.pluralize}/\#{parent.name.underscore}/\#{name}.rb", app_path)
        end
      RUBY
    end
  end
end
