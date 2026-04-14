# tests/test_main.py
from main import get_greeting


def test_greeting_returns_correct_string():
    expected = "Hello world"
    assert get_greeting() == expected
