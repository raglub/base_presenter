require 'spec_helper'

describe ApplicationHelper do

  let(:dummy_model) { DummyModel.new }

  describe "for DummyModel object" do
    it "should initialize presenter with properly template" do
      helper.present(dummy_model).get_template.should be_an(ActionView::Base)
    end

    it "should initialize presenter with properly object model" do
      present(dummy_model).get_object.should eq dummy_model
    end

    it "should valid presenter method using block without variable" do
      result = ""
      present(dummy_model) do
        result += dummy_name
      end
      result.should eq "DUMMY"
    end

    it "should valid presenter method using block with variable" do
      result = ""
      present(dummy_model) do |dummy_presenter|
        result += dummy_presenter.dummy_name
      end
      result.should eq "DUMMY"
    end
  end

  describe "for DummyModel class" do
    it "should initialize presenter with properly template" do
      helper.present(DummyModel).get_template.should be_an(ActionView::Base)
    end

    it "should initialize presenter with properly object model" do
      present(DummyModel).get_object.should eq DummyModel
    end

    it "should valid presenter method using block" do
      expect do
        helper.present(DummyModel) do |dummy_presenter|

        end
      end.to_not raise_error
    end

  end
end
