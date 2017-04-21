require 'slim-rails'
require 'devise'
require 'active_decorator'
require 'redcarpet'
require 'pundit'

module NippoCore
  class Engine < ::Rails::Engine
    isolate_namespace NippoCore
  end
end
