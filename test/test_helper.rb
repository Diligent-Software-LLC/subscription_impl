$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require_relative "../lib/subscription_impl"
require 'diagram_factory_int'
require 'diagram_factory_impl'
require "minitest/autorun"
