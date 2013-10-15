require 'spec_helper'
class DummyModelPresenter < BasePresenter
  presents :dummy

  def get_object
    dummy
  end

  def get_template
    @template
  end

  def self.get_object
    @@object
  end

  def self.get_template
    @@template
  end
end

describe ApplicationHelper do

  let(:dummy_model) { DummyModel.new }

  describe "for DummyModel object" do
    it "should initialize presenter with properly template" do
      helper.present(dummy_model).get_template.should be_an(ActionView::Base)
    end

    it "should initialize presenter with properly object model" do
      helper.present(dummy_model).get_object.should eq dummy_model
    end
  end

  describe "for DummyModel class" do
    it "should initialize presenter with properly template" do
      helper.present(DummyModel).get_template.should be_an(ActionView::Base)
    end

    it "should initialize presenter with properly object model" do
      helper.present(DummyModel).get_object.should eq DummyModel
    end
  end
end
