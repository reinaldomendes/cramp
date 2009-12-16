require 'cramp/vendor/evented_mysql'
require 'eventmachine'
require 'mysqlplus'

$: << File.join(File.dirname(__FILE__), 'vendor/arel/lib')
require 'arel'

module Cramp
  module Model
    autoload :Quoting, "cramp/model/quoting"
    autoload :Engine, "cramp/model/engine"
    autoload :Column, "cramp/model/column"

    extend self

    def init(settings)
      Arel::Table.engine = Cramp::Model::Engine.new(settings)
    end

  end
end

require 'cramp/model/monkey_patches'
require 'cramp/model/emysql_ext'

