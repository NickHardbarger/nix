from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Firefox()
driver.get("https://www.gasbuddy.com/station/30734")
driver.implicitly_wait(0.5)

price = driver.find_element(By.CLASS_NAME, "text__xl___2MXGo.text__bold___1C6Z_.text__left___1iOw3.FuelTypePriceDisplay-module__price___3iizb").text
time = driver.find_element(By.CLASS_NAME, "text__sm___1q2rU.text__left___1iOw3.FuelTypePriceDisplay-module__reportedTime___1Zinr.FuelTypePriceDisplay-module__reportedGrey___g8pgI").text
driver.quit()

address = "1919 Mount Vernon Rd"

print("The price of gas at", address, "was", price, time)
