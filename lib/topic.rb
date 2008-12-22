require 'yaml'

module Khayyam
  
  #= Overview
  # Khayyam::Topic: The class for interacting with topic pairs.  
  #
  class Topic
    attr_reader :name
    
    def initialize name, facts={}
      @name = name
      @facts = facts
    end
    
    # returns an array of sub-topics
    def categories
      @facts.keys
    end
    
    # used to work with sub-topics
    def regarding category
      @facts[category] ||= {}
      yield @facts[category]
    end
    
    # Export data to a string
    # Example:
    #   topic = Khayyam::Topic.new "vi"
    #   topic.regarding "movement" do |items|
    #     items["h"] = "left"
    #     items["j"] = "up"
    #   end
    #   topic.regarding "commands" do |items|
    #     items[":q"] = "quit"
    #     items[":x"] = "save and quit"
    #   end
    #   output_string = topic.export
    def export
      output = YAML.dump_stream({'topic' => @name, 'categories' => @facts})
      output[5..output.length]
    end
    
    # Import data from a string.
    # 
    # Example:
    # topic = Khayyam::Topic.import my_data
    def self.import string
      data = YAML.load "--- \n#{string}"
      khayyam = Khayyam::Topic.new data["topic"], data["categories"]
    end
  end
end
