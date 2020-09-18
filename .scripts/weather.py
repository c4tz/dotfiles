import requests

r = requests.get(
    "http://api.openweathermap.org/data/2.5/weather?q=Bremen,de&units=metric&lang=de&appid=4c00129fcf3631b2cff32116a3ce1fb4"
)

temp = round(r.json()["main"]["temp"])
weather = r.json()["weather"][0]["description"]

print(str(temp) + "°C, " + weather)
