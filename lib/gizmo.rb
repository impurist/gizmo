require 'active_support/core_ext'
require 'nokogiri'
require 'tilt'
require 'term/ansicolor'
require "gizmo/version"
require 'pry'

module Gizmo
  autoload :PageObject, "gizmo/page_object"
  autoload :Helpers,    "gizmo/helpers"
  autoload :PageMixin,  "gizmo/page_mixin"
  autoload :Templates,  "gizmo/templates"

  GizmoError = Class.new(StandardError)
  MixinNotValidError = Class.new(GizmoError)
  MixinNotFoundError = Class.new(GizmoError)
  NilResponseError = Class.new(GizmoError)
  NoBlockGivenError = Class.new(GizmoError)
end

require "gizmo/configuration"