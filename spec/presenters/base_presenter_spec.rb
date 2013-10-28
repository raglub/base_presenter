require 'spec_helper'

describe ApplicationHelper do
  let(:dummy_model) { DummyModel.new }

  let(:template) { ActionView::Base.new }

  let(:dummy_presenter) { DummyModelPresenter.new(dummy_model, template) }

  describe "without block" do

    it "#presents" do
      dummy_presenter.dummy.should eq dummy_model
    end

    it "should show formated name" do
      dummy_presenter.name.should eq("EXAMPLE NAME")
    end

    it "should show id of dummy using delegation" do
      dummy_presenter.id.should eq(123)
    end

    it "#handle_none with not blank of value" do
      value = "no empty"
      dummy_presenter.show_value(value).should eq(value)
    end

    it "#handle_none with not blank of value" do
      value = nil
      dummy_presenter.show_value(value).should match('<span class')
    end
  end
end
