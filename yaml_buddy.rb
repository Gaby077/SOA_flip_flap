# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  attr_accessor :data

  NEWLINE = "\n"
  TAB = "\t"

  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
    @data
  end

  def to_yaml
    @data = @data.to_yaml
    @data
  end
end
