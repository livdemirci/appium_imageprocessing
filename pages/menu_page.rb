require File.join(File.dirname(__FILE__), 'abstract_page.rb')

class Menu_page < AbstractWindow
  def initialize(driver, title = '')
    super(driver, title) # <= WIN TITLE
  end

  def ucluktahtayatikla
    driver.find_element(accessibility_id: '3x3').click
  end

  def besliktahtayatikla
    driver.find_element(accessibility_id: '5x5').click
  end

  def single_player_tikla
    driver.find_element(accessibility_id: 'Single Player').click
  end

  def carpiyatiklat(x, y)
    # Koordinatlara dokunma işlemi
    action_builder = driver.action
    action_builder.move_to_location(x, y).click.perform
  end

  def startgame_tiklat(x, y)
    action_builder = driver.action
    action_builder.move_to_location(x, y).click.perform
  end
end
