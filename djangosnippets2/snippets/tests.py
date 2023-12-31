from django.http import HttpRequest
from django.test import TestCase
from snippets.views import top # これから実装するビュー関数（今はまだ存在しません）

from django.urls import resolve

from snippets.views import top, snippet_new, snippet_edit, snippet_detail

# Create your tests here.
class TopPageViewTest(TestCase):
    def test_top_returns_200(self):
        response = self.client.get("/")
        self.assertEqual(response.status_code, 200)

    def test_top_returns_expected_content(self):
        response = self.client.get("/")
        self.assertEqual(response.content, b"Hello World")

class CreateSnippetTest(TestCase):
   def test_should_resolve_snippet_new(self):
       found = resolve("/snippets/new/")
       self.assertEqual(sni)
