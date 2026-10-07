from fastapi.testclient import TestClient

from main import app

client = TestClient(app)


def test_health():
    assert client.get("/health").json() == {"status": "ok"}


def test_add():
    assert client.get("/add?a=2&b=3").json() == {"result": 5}


def test_subtract():
    assert client.get("/subtract?a=10&b=4").json() == {"result": 6}


def test_multiply():
    assert client.get("/multiply?a=6&b=7").json() == {"result": 42}


def test_divide():
    assert client.get("/divide?a=9&b=3").json() == {"result": 3}


def test_divide_by_zero():
    res = client.get("/divide?a=1&b=0")
    assert res.status_code == 400
