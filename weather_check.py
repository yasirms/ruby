
import requests
import json

API_KEY = "2b97c0623d52e5ead6c7ec5a0944561e"

print("Welcome to Weather Check")
print("=======================")
print("")
another_check = "y"

while another_check == "y":
    city = input("Enter City")
    url = "https://api.openweathermap.org/data/2.5/weather?q=%s&appid=%s&units=metric" % (city,API_KEY)

    response = requests.get(url)
    data = json.loads(response.text)

    temp = float(data['main']['temp'])



    print(f"The real temperature of the {city} is {temp}")

    if temp > 20:
        temp = temp - 1
        print(f"The updated temperature of {city} after environment protection is {temp}")
    else:
        print(f"The Ttmperature of the {city} is {temp}")

    another_check = input("do you want to perform another Temperature check? y or n")

    if another_check != "y":
        return
