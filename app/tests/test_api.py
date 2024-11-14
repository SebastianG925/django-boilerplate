import pytest
from django.test import Client
from app.api import api

@pytest.mark.django_db
def test_health_check():
    client = Client()
    response = client.get("/api/health")
    
    assert response.status_code == 200
    assert response.json() == {
        "status": "healthy",
        "message": "Healthy Instance"
    }