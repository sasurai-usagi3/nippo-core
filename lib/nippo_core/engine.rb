require 'slim-rails'
require 'devise'

module NippoCore
  class Engine < ::Rails::Engine
    isolate_namespace NippoCore
  end
end
