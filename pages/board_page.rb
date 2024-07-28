require File.join(File.dirname(__FILE__), 'abstract_page.rb')



class Board_page < AbstractWindow
  def initialize(driver, title = '')
    super(driver, title)
    @kutular = load_kutu_koordinatlari
  end

  # Koordinatları bir dosyadan veya başka bir kaynaktan oku
  def load_kutu_koordinatlari
    require 'json'
    file_content = File.read('kutu_koordinatlari.json')
    JSON.parse(file_content, symbolize_names: true) # symbolize_names: true, JSON anahtarlarını sembollere dönüştürür
  end

  def kutuya_dokun(kutu_adi)
    kutu = @kutular[kutu_adi.to_sym]
    action_builder = driver.action
    action_builder.move_to_location(kutu[:x], kutu[:y]).click.perform
  end
end
