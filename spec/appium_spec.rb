load File.dirname(__FILE__) + '/../test_helper.rb'

describe 'ApiDemos-debug.apk Test Suite' do
  include TestHelper

  before(:all) do # rubocop:disable Metrics/BlockLength
    def get_wsl_ip
      os = RbConfig::CONFIG['host_os']
      puts os
      # Komutu belirle
      command = if os =~ /mingw|mswin|cygwin/
                  # Windows ortamında ipconfig komutunu çalıştır
                  'ipconfig'
                else
                  # Linux ortamında WSL aracılığıyla ipconfig komutunu çalıştır
                  '/mnt/c/Windows/System32/cmd.exe /c ipconfig'
                end

      # Komutu çalıştır
      ipconfig_output = `#{command}`

      # WSL (Hyper-V firewall) ile ilgili satırı bul
      ip_line = ipconfig_output.lines.find { |line| line.include?('vEthernet (WSL (Hyper-V firewall))') }

      # IP adresinin bulunduğu satırın indeksini al
      ip_line_index = ipconfig_output.lines.index(ip_line)

      # IP adresi genellikle 2 satır sonra bulunur
      ip_address_line = ipconfig_output.lines[ip_line_index + 4]

      # IP adresini almak için ':' ile ayır ve temizle
      ip_address = ip_address_line.split(':').last.strip

      # IP adresinin IPv4 formatında olup olmadığını kontrol et
      ip_address if ip_address.match(/\A\d{1,3}(\.\d{1,3}){3}\z/)
    end

    wsl_ip = get_wsl_ip

    if wsl_ip
      puts "WSL IP Address: #{wsl_ip}"
    else
      puts 'WSL IP Address not found or incorrect format.'
    end

    caps = {
      caps: {
        platformName: 'Android',
        deviceName: 'emulator-5554',
        appPackage: 'io.appium.android.apis',
        appActivity: 'io.appium.android.apis.ApiDemos',
        automationName: 'UiAutomator2'

      },
      appium_lib: {
        server_url: "http://#{wsl_ip}:4723",
        wait_timeout: 300_000_000
      }
    }
    @driver = Appium::Driver.new(caps, true).start_driver
    Appium.promote_appium_methods Object
  end

  after(:all) do
    @driver.quit
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
  # dumpsys window displays | grep -E 'mCurrentFocus'
end
