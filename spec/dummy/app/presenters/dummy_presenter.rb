class DummyPresenter < BasePresenter
  presents :dummy

  def name
    dummy.name.upcase
  end
end
