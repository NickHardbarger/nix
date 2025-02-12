from selenium import webdriver

driver = webdriver.Firefox()

driver.get("https://www.selenium.dev/selenium/web/web-form.html")
#driver.get("https://www.selenium.dev")

title = driver.title

driver.implicitly_wait(0.5)

text_box = driver.find_element(by=By.NAME, value="my-text")
submit_button = driver.find_element(by=By.CSS_SELECTOR, value="button")

text_box.send_keys("Selenium")
submit_button.click()

text = message.text

driver.quit()
