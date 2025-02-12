from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Firefox()

driver.get("https://www.gasbuddy.com/station/30734")

title = driver.title

driver.implicitly_wait(0.5)

text = driver.find_element(By.CLASS_NAME, "text__xl___2MXGo.text__bold___1C6Z_.text__left___1iOw3.FuelTypePriceDisplay-module__price___3iizb").text

driver.quit()

print("The price of gas is:", text)
