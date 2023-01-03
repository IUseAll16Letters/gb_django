__all__ = ('TestCaseSelenium', )

import time

from django.test import LiveServerTestCase

from config import selenium_test_config

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class TestCaseSelenium(LiveServerTestCase):
    fixtures = (
        'authapp/fixtures/001_admin_user.json',
        'mainapp/fixtures/001_news.json',
    )

    menu_items_ru = ("Новости", "Курсы", "Профиль", "Контакты", )
    menu_items_eng = ("News", "Courses", "Profile", "Contacts")

    def setUp(self) -> None:
        self.driver = webdriver.Chrome()
        self.driver.get(selenium_test_config.SELENIUM_TEST_URL)
        self.driver.implicitly_wait(10)

        # Log in by clicking
        self.menu_items = self.driver.find_elements(By.CSS_SELECTOR, '.nav-link')
        for item in self.menu_items:
            if item.text == 'Войти' or item.text == 'Enter':
                item.click()
                break
        self.driver.find_element(By.CSS_SELECTOR, "#djHideToolBarButton").click()

        WebDriverWait(self.driver, 5).until(EC.visibility_of_element_located((By.ID, "id_username")))

        self.driver.find_element(By.CSS_SELECTOR, "#id_username").send_keys("admin@admin.ru")
        self.driver.find_element(By.CSS_SELECTOR, "#id_password").send_keys("admin")
        self.driver.find_element(By.CSS_SELECTOR, "button.btn.btn-primary").click()

    def tearDown(self) -> None:
        self.driver.quit()

    def test_full_site(self):
        # 'Menu localization test part'
        eng = self.driver.find_element(By.XPATH, "//form/input[@value='en']/following-sibling::button")
        eng.click()
        english_menu_items = self.driver.find_elements(By.CSS_SELECTOR, '.nav-link')
        english_menu_items = [i.text in self.menu_items_eng for i in english_menu_items]

        rus = self.driver.find_element(By.XPATH, "//form/input[@value='ru']/following-sibling::button")
        rus.click()
        russian_menu_items = self.driver.find_elements(By.CSS_SELECTOR, '.nav-link')
        russian_menu_items = [i.text in self.menu_items_ru for i in russian_menu_items]

        self.assertTrue(all((english_menu_items, russian_menu_items)))

        # Start news CRUD test
        self.driver.find_element(By.XPATH, "//a[@class='nav-link'][text()='Новости']").click()
        news = self.driver.find_elements(By.CSS_SELECTOR, '.card-title')
        self.assertEqual(len(news), 5, msg=f'News must be 5, got {len(news)} instead')

        # Create news
        self.driver.find_element(By.XPATH, "//a[text()='Добавить новость']").click()

        WebDriverWait(self.driver, 5).until(EC.visibility_of_element_located((By.ID, "id_title")))
        self.driver.find_element(By.ID, "id_title").send_keys('Article001')
        self.driver.find_element(By.ID, "id_description").send_keys('Article001Description')
        self.driver.find_element(By.ID, "id_content").send_keys('Article001Content')

        self.driver.find_element(By.CSS_SELECTOR, ".btn.btn-primary.btn-block").click()

        # News created
        WebDriverWait(self.driver, 5).until(EC.visibility_of_element_located((By.CSS_SELECTOR, ".card-title")))
        title = self.driver.find_element(By.CSS_SELECTOR, '.card-title a').text
        description = self.driver.find_element(By.CSS_SELECTOR, '.row p.card-text').text

        self.assertTrue(all([title == 'Article001', description == 'Article001Description']))
