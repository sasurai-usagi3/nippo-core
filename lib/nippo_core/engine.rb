require 'slim-rails'

module NippoCore
  class Engine < ::Rails::Engine
    isolate_namespace NippoCore
  end
end
