require 'spec_helper'
class DummyModelPresenter < BasePresenter
  presents :dummy

  def name
    dummy.name.upcase
  end

  def self.name
    "Class name"
  end
end

describe ApplicationHelper do
  let(:dummy_model) { DummyModel.new }

  let(:dummy_presenter) do
    helper.present(dummy_model)
  end

  it "should initialize presenter" do
    dummy_presenter
  end

  it "#presents" do
    dummy_presenter.dummy.should eq dummy_model
  end

  it "should show formated name" do
    dummy_presenter.name.should eq("EXAMPLE NAME")
  end

  it "#handle_none with not blank of value" do
    value = "no empty"
    dummy_presenter.handle_none(value) {value}.should eq(value)
  end

  it "#handle_none with not blank of value" do
    value = nil
    dummy_presenter.handle_none(value) {value}.should match('<span class')
  end

  it ".template" do
    helper.present(DummyModel).template.should_not be_nil
  end

  it "should show class name" do
    helper.present(DummyModel).name.should eq("Class name")
  end

end
