require 'slim-rails'
require 'devise'
require 'active_decorator'
require 'redcarpet'

module NippoCore
  class Engine < ::Rails::Engine
    isolate_namespace NippoCore
  end
end
