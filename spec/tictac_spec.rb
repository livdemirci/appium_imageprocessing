load File.dirname(__FILE__) + '/../test_helper.rb'
require_relative '../pages/Menu_page'
require 'pry'
require 'fileutils'
require 'appium_lib'
require 'base64'
require 'chunky_png'
require 'selenium-webdriver'
require 'rmagick'
require 'json'

describe 'tictactoe' do
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
        wait_timeout: 300_000_000
      }
    }

    @driver = Appium::Driver.new(caps, true).start_driver
    File.write('session_id.txt', @driver.session_id)
    puts @driver.session_id
    Appium.promote_appium_methods Object
  end

  after(:all) do
    # @driver.quit unless debugging?
  end

  def is_blank_cell(img)
    height = img.dimension.height
    width = img.dimension.width
    color_codes = Set.new

    height.times do |i|
      width.times do |j|
        color = ChunkyPNG::Color.to_hex(img[j, i], false)
        color_codes.add(color)
        return false if color_codes.size >= 1000
      end
    end

    color_codes.size < 1000
  end

  def capture_and_get_empty_cells
    png_base64 = @driver.screenshot_as(:base64)
    png_data = Base64.decode64(png_base64)

    File.open('screenshot.png', 'wb') do |file|
      file.write(png_data)
    end

    first_image = Magick::Image.read('screenshot.png').first
    x = 92
    y = 960
    width_first = 1160
    height_first = 1140
    first_image_cropped = first_image.crop(x, y, width_first, height_first)
    first_image_cropped.write('screenshot.png')

    before = Magick::Image.read('screenshot.png').first
    blob = before.to_blob
    after = Magick::Image.from_blob(blob)
    after[0].write('to_blob.jpeg')

    jpeg_img = Magick::Image.read('to_blob.jpeg').first

    width = jpeg_img.columns / 3
    height = jpeg_img.rows / 3

    dir_path = File.join(File.dirname(__FILE__), '..', 'cropped_images')
    FileUtils.mkdir_p(dir_path)

    3.times do |row|
      3.times do |col|
        x = col * width
        y = row * height
        cropped = jpeg_img.crop(x, y, width, height)
        file_path = File.join(dir_path, "output_#{row}_#{col}.png")
        cropped.write(file_path)
        puts "Cropped image saved at: #{file_path}"
      end
    end

    empty_cells = []

    json_file_path = File.join(File.dirname(__FILE__), '..', 'kutu_koordinatlari.json')
    json_data = JSON.parse(File.read(json_file_path))

    Dir.glob("#{dir_path}/*.png").each_with_index do |file_path, i|
      img = ChunkyPNG::Image.from_file(file_path)
      key = json_data.keys[i] # JSON anahtarını al
      if is_blank_cell(img)
        empty_cells << key # Boşsa anahtar adını ekle
      end
    end

    empty_cells
  end

  it 'plays a game of TicTacToe' do
    menu_page = Menu_page.new(@driver)
    sleep 2
    menu_page.ucluktahtayatikla
    sleep 1
    menu_page.single_player_tikla
    contexts = @driver.available_contexts
    puts contexts

    menu_page.carpiyatiklat(370, 1400)
    menu_page.startgame_tiklat(650, 2215)

    @board_page = Board_page.new(@driver)
    @board_page.kutuya_dokun('dorduncu_kutu')
    sleep 3

    # Boş hücreleri başlangıçta al
    empty_cells = capture_and_get_empty_cells

    # 'Player 1' elementinin görüntülendiği sürece döngü devam etsin
    loop do
      # Eğer 'Player 1' elementi görüntüleniyorsa döngüye devam et
      break unless @driver.find_element(accessibility_id: 'Player 1').displayed?

      # Rastgele bir boş hücre seç
      empty_cell = empty_cells.sample
      puts "Next move: empty cell selected: #{empty_cell}"

      # Seçilen hücreye dokun
      @board_page.kutuya_dokun(empty_cell)
      sleep 3

      # Boş hücreleri güncelle
      empty_cells = capture_and_get_empty_cells

      # Boş hücre kalmadıysa döngüden çık
      break if empty_cells.empty?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      # 'Player 1' elementi bulunamazsa döngüyü sessizce sonlandır
      break
    end

    puts 'No more empty cells left or reached 8 moves.'

    # 'Play again' butonunun görüntülenip görüntülenmediğini kontrol et
    play_again_button = @driver.find_element(accessibility_id: 'Play again')
    expect(play_again_button.displayed?).to be true
  end
end
