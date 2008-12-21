require 'yaml'

module Khayyam
  class Topic
    attr_reader :topic, :categories
    
    def initialize topic
      @topic = topic
      @categories = {}
    end
    
    def regarding category
      @categories[category] ||= {}
      yield @categories[category]
    end
    
    def export
      output = YAML.dump_stream({'topic' => @topic, 'categories' => @categories})
      output[5..output.length]
    end
  end
end
