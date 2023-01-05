__all__ = ('TestCaseSelenium', )

import time

from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from django.urls import reverse

from config import selenium_test_config
from mainapp.models import News

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class TestCaseSelenium(StaticLiveServerTestCase):
    fixtures = (
        'authapp/fixtures/001_admin_user.json',
        'mainapp/fixtures/001_news.json',
    )

    menu_items_ru = ("Новости", "Курсы", "Профиль", "Контакты", )
    menu_items_eng = ("News", "Courses", "Profile", "Contacts")

    def setUp(self) -> None:
        super().setUp()
        self.driver = webdriver.Chrome()
        self.driver.get(self.live_server_url)
        self.driver.implicitly_wait(10)

        # Log in by clicking
        self.menu_items = self.driver.find_elements(By.CSS_SELECTOR, '.nav-link')
        for item in self.menu_items:
            if item.text == 'Войти' or item.text == 'Enter':
                item.click()
                break

        WebDriverWait(self.driver, 5).until(EC.visibility_of_element_located((By.ID, "id_username")))

        self.driver.find_element(By.CSS_SELECTOR, "#id_username").send_keys("admin@admin.ru")
        self.driver.find_element(By.CSS_SELECTOR, "#id_password").send_keys("admin")
        self.driver.find_element(By.CSS_SELECTOR, "button.btn.btn-primary").click()

        WebDriverWait(self.driver, 5).until(EC.visibility_of_element_located((By.CLASS_NAME, "mt-auto")))

    def tearDown(self) -> None:
        self.driver.quit()
        super().tearDown()

    def test_localization(self):
        # 'Menu localization test part'
        eng = self.driver.find_element(By.XPATH, "//form/input[@value='en']/following-sibling::button")
        eng.click()
        english_menu_items = self.driver.find_elements(By.CSS_SELECTOR, '.nav-link')
        english_menu_items = [i.text in self.menu_items_eng for i in english_menu_items]

        rus = self.driver.find_element(By.XPATH, "//form/input[@value='ru']/following-sibling::button")
        rus.click()
        russian_menu_items = self.driver.find_elements(By.CSS_SELECTOR, '.nav-link')
        russian_menu_items = [i.text in self.menu_items_ru for i in russian_menu_items]
        self.assertTrue(len(russian_menu_items) == len(english_menu_items))
        self.assertTrue(all((english_menu_items, russian_menu_items)))

    def test_crud_news(self):
        # Start news CRUD test
        path = f'{self.live_server_url}{reverse("mainapp:news")}'
        self.driver.get(path)

        total_news = News.objects.count()
        news = self.driver.find_elements(By.CSS_SELECTOR, '.card-title')
        self.assertEqual(len(news), 5, msg=f'News must be 5, got {len(news)} instead')

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
        self.assertGreater(News.objects.count(), total_news)

        # News update
        updates = {
            "title": "Article001Updated",
            "description": "Article001DescriptionUpdated",
            "author": "Author001Updated"
        }
        self.driver.find_element(By.CSS_SELECTOR, "a[href='/mainapp/news/51/update']").click()

        title_input = self.driver.find_element(By.CSS_SELECTOR, "#id_title")
        title_input.clear()
        description_input = self.driver.find_element(By.CSS_SELECTOR, "#id_description")
        description_input.clear()
        author_input = self.driver.find_element(By.CSS_SELECTOR, "#id_author")
        author_input.clear()

        title_input.send_keys(updates["title"])
        description_input.send_keys(updates["description"])
        author_input.send_keys(updates["author"])

        self.driver.find_element(By.CSS_SELECTOR, ".btn.btn-primary.btn-block").click()

        new_title = self.driver.find_element(By.CSS_SELECTOR, ".row .card-title a").text
        new_description = self.driver.find_element(By.CSS_SELECTOR, ".row .card-text").text
        new_author = self.driver.find_element(By.CSS_SELECTOR, ".row .card-subtitle a").text

        self.assertTrue(all(
            (
                new_title == updates["title"],
                new_description == updates["description"],
                new_author == updates["author"]
            )
        ))

        # News delete
        self.driver.find_element(By.CSS_SELECTOR, '.col-1.text-center a[href="/mainapp/news/51/delete"]').click()
        self.driver.find_element(By.CSS_SELECTOR, ".btn.btn-danger.btn-block").click()
        last_created_obj = News.objects.latest('id')
        self.assertTrue(all(
            (last_created_obj.id == 51,
             last_created_obj.deleted)
        ))
