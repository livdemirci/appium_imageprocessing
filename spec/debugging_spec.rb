# Special test that use Desktop session.
# Then you can try commands directly against the app, without the need to restart from the beginning.

load File.dirname(__FILE__) + '/../test_helper.rb'

describe 'DEBUG' do
  include TestHelper

  before(:all) do
    use_destkop_session
    # @driver is set to the desktop session

    # suggest find the main app window first
    @main_win = @driver.find_element(:name, '%WIN_TITLE%')
  end

  attr_reader :main_win

  it 'Debugging' do
    Menu_page = MenuPage.new(driver)
    Menu_page.oyunsec('3x3')
  end
end
