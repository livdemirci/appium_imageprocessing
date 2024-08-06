load File.dirname(__FILE__) + '/../test_helper.rb'
require_relative '../pages/Menu_page'
require 'pry'
# Test senaryosu
describe 'tictactoe' do
  include TestHelper

  before(:all) do
    caps = {
      caps: {
        platformName: 'Android',
        deviceName: 'emulator-5554',
        appPackage: 'com.chisw.TicTacXO',
        appActivity: 'com.example.tic_tac_toe.MainActivity',
        automationName: 'UiAutomator2'

      },
      appium_lib: {
        server_url: 'http://127.0.0.1:4723',
        wait_timeout: 1000
      }
    }

    @driver = Appium::Driver.new(caps, true).start_driver
    Appium.promote_appium_methods Object
  end

  after(:all) do
    # @driver.quit
  end

  it 'plays a game of TicTacToe' do
    menu_page = Menu_page.new(@driver)
    sleep 0.1
    menu_page.ucluktahtayatikla
    sleep 0.1
    menu_page.single_playertikla
    contexts = @driver.available_contexts
    puts contexts
    x = 400
    y = 1400
    binding.pry

    menu_page.carpiyatiklat(x, y)

    sleep 500
  end
end
