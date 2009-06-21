require 'test_helper'

class TopicTest < Test::Unit::TestCase
  context "khayyam" do
    should "should take the topic as a string on creation" do
      topic = Khayyam::Topic.new "foo"
      assert_equal "foo", topic.name
    end

    should "should store topics and facts" do
      topic = Khayyam::Topic.new "dairy"
      topic.regarding "cheese" do |fact|
        fact["cheddar"] = "ubiquitous"
      end

      assert_equal "cheese", topic.categories[0]
      topic.regarding "cheese" do |fact|
        assert_equal "ubiquitous", fact["cheddar"]
      end
    end

    context "import export" do
      setup do
        @yaml = "topic: dairy\ncategories: \n  cheese: \n    cheddar: ubiquitous\n"
      end

      should "should export data to a YAML string" do
        topic = Khayyam::Topic.new "dairy"
        topic.regarding "cheese" do |fact|
          fact["cheddar"] = "ubiquitous"
        end

        output = topic.export
        assert_equal @yaml, output
      end

      should "should import data from a YAML string" do
        topic = Khayyam::Topic.import @yaml

        assert_equal "dairy", topic.name
      end
    end
  end
end
