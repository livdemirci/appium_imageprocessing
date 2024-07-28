load File.dirname(__FILE__) + '/../test_helper.rb'

describe 'ApiDemos-debug.apk Test Suite' do
  include TestHelper

  before(:all) do
    caps = {
      caps: {
        platformName: 'Android',
        deviceName: 'emulator-5554',
        app: File.join(File.dirname(__FILE__), '../../app/ApiDemos-debug.apk'), # Dosya yolunu düzenledik
        automationName: 'UiAutomator2'
        # Diðer gerekli capability'leri buraya ekleyebilirsiniz
      },
      appium_lib: {
        server_url: 'http://127.0.0.1:4723',
        wait_timeout: 30
        # appium_lib konfigürasyonunu buraya ekleyebilirsiniz
      }
    }

    @driver = Appium::Driver.new(caps, true).start_driver
    Appium.promote_appium_methods Object
  end

  after(:all) do
    @driver.quit unless debugging?
  end

  it 'Apidemos_wifi_checkbox_tiklama ve isim alma' do
    # Buraya test senaryonuzu yazabilirsiniz
    # Örnek:
    driver.find_element(:accessibility_id, 'Preference').click

    driver.find_element(:accessibility_id, '3. Preference dependencies').click
    driver.find_element(:id, 'android:id/checkbox').click
    wifi_settings_element = driver.find_element(:uiautomator, 'new UiSelector().text("WiFi settings")')
    expect(wifi_settings_element.text).to eq('WiFi settings')
  end

  it 'baska bir test' do
    # dumpsys window displays | grep -E 'mCurrentFocus'
  end
end
