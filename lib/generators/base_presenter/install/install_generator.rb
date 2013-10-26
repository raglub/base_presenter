class BasePresenter
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :model_name, :type => :string, :default => "example"
      def generate_install
        copy_file "application_presenter.rb", "app/presenters/application_presenter.rb"
        create_file "app/presenters/#{model_name.underscore}_presenter.rb", <<-FILE
class #{model_name.classify}Presenter < ApplicationPresenter
  presents :#{model_name.underscore.split("/").last}

  # delegete :name
end
FILE
      end
    end
  end
end
