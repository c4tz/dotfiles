import requests

# credit: https://github.com/worksonmymachine-de/weather
mapping = {
    0: "Klarer Himmel",
    1: "Größtenteils klar",
    2: "Teilweise wolkig",
    3: "Bedeckt",
    45: "Nebel",
    48: "Reifnebel",
    51: "Leichter Nieselregen",
    53: "Mäßiger Nieselregen",
    55: "Starker Nieselregen",
    56: "Leichter eisiger Nieselregen",
    57: "Starker eisiger Nieselregen",
    61: "Leichter Regen",
    63: "Mäßiger Regen",
    65: "Starker Regen",
    66: "Leichter gefrierender Regen",
    67: "Gefrierender Regen",
    71: "Leichter Schneefall",
    73: "Mäßiger Schneefall",
    75: "Starker Schneefall",
    77: "Schneegraupel",
    80: "Leichte Regenschauer",
    81: "Mäßige Regenschauer",
    82: "Starke Regenschauer",
    85: "Leichte Schneeschauer",
    86: "Starke Schneeschauer",
    95: "Gewitter",
    96: "Gewitter mit leichtem Hagel",
    99: "Gewitter mit starkem Hagel",
    99999: "Unbekannt",
}

r = requests.get(
    "https://api.open-meteo.com/v1/forecast?latitude=53.07&longitude=8.82&current=temperature_2m,weather_code&timezone=Europe%2FBerlin"
).json()["current"]

print(str(r["temperature_2m"]) + "°C, " + mapping[r["weather_code"]], end="")
