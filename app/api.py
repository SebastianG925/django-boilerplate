from ninja import NinjaAPI

api = NinjaAPI()

@api.get("/health")
def health_check(request):
    return 200, {"status": "healthy", "message": "Healthy Instance"}
