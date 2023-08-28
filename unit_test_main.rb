require 'test/unit'
require_relative 'mainDriver' 

class TestMainDriver < Test::Unit::TestCase
  def setup
    @driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
    @main_driver = MainDriver.new(browser: :chrome, driver_path: @driver_path)
  end

  def teardown
    @main_driver.close
  end

  def test_visit_and_find_element
    @main_driver.visit('https://www.example.com/')
    element = @main_driver.find_element(:id, 'some-id')
    assert_not_nil(element)
  end

  def test_input_text_and_get_text
    @main_driver.visit('https://www.example.com/')
    input_element = @main_driver.find_element(:id, 'input-id')
    @main_driver.input_text(input_element, 'Test Text')
    text = @main_driver.get_text(input_element)
    assert_equal('Test Text', text)
  end

  def test_click_element
    @main_driver.visit('https://www.example.com/')
    button_element = @main_driver.find_element(:id, 'button-id')
    @main_driver.click(button_element)
    # Add assertions to verify the behavior after clicking
  end

  def test_maximize_window
    assert_nothing_raised { @main_driver.maximize_window }
    # You can't directly test window maximization, but you can test if no exceptions are raised
  end

  # Add more test methods for other functionalities
end
