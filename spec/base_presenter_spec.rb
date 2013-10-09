require 'spec_helper'

describe BasePresenter do
  let(:dummy) { Dummy.new }

  let(:dummy_presenter) do
    DummyHelper.present(dummy)
  end

  it "should initialize presenter" do
    dummy_presenter
  end

  it "#presents" do
    dummy_presenter.dummy.should eq dummy
  end

  it "should show formated name" do
    dummy_presenter.name.should eq("EXAMPLE NAME")
  end

  it "#handle_none with not blank of value" do
    value = "no empty"
    dummy_presenter.handle_none(value) {value}.should eq(value)
  end

end
