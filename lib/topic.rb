require 'yaml'

module Khayyam
  class Topic
    attr_reader :name
    
    def initialize name, facts={}
      @name = name
      @facts = facts
    end
    
    def categories
      @facts.keys
    end
    
    def regarding category
      @facts[category] ||= {}
      yield @facts[category]
    end
    
    def export
      output = YAML.dump_stream({'topic' => @name, 'categories' => @facts})
      output[5..output.length]
    end
    
    def self.import string
      data = YAML.load "--- \n#{string}"
      khayyam = Khayyam::Topic.new data["topic"], data["categories"]
    end
  end
end
