class DummyModelPresenter < BasePresenter
  presents :dummy

  delegate :id, to: :dummy

  def show_value(value)
    handle_none(value) do
      value
    end
  end

  def name
    dummy.name.upcase
  end

  def self.name
    "Class name"
  end

  def dummy_name
    "DUMMY"
  end

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
