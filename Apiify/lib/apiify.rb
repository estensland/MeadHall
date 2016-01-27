require '~/coding/MeadHall/Apiify/lib/rails_generate_helpers.rb'

class Apiify
  include "rails_generate_helpers"

  attr_accessor :start_directory, :api_nest, :model_name, :plural_name, :class_name, :attrs, :stringed_attrs

  def initialize(opts = {})
    @start_directory = opts[:start_directory]
    @api_nest        = opts[:api_nest]
    @model_name      = opts[:model_name]
    @plural_name     = @model_name.pluralize
    @class_name      = @model_name.classify
    @attrs           = opts[:attrs]
    @safe_params     = opts[:safe_params] || @attrs
    @stringed_attrs  = stringify_attrs(@attrs)
    @routes          = opts[:routes]
    @create_factory  = opts[:create_factory]
    @create_tests    = opts[:create_tests]
  end


  def stringify_attrs(attr_input)
    attr_input.to_a.map{|attrib| attrib.join(':')}.join(' ')
  end
end
