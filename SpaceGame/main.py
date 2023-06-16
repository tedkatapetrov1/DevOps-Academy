import requests

base_url = "127.0.0.1:5000"
def get_url(endpoint):
    req = requests.get('http://'+base_url+endpoint)
    return req.json()

def travel(x,y):
    req = requests.post('http://' + base_url + "/travel", json={
        "x":x,
        "y":y
    })
    return req.json()

def mine(x,y,z):
    req = requests.post('http://' + base_url + "/mine", json={
        "planet_id": x,
        "resource1": y,
        "resource2": z
    })
    return req.json()

def upgrade(x):
    req = requests.post('http://' + base_url + "/upgrade", json={
        "part_name": x,
    })
    return req.json()

if __name__ == '__main__':
    info = get_url("/info")
    position = info["position"]
    travel(4,10)
    # upgrade("Fuel Tank")

    scan_info = get_url("/scan")
    for system in scan_info:
        if system["position"] == position:
            for planet in system["celestial_bodies"]:
                print(planet)
                if "alians" in planet:
                    print("Hello")

    # print(mine('57beb012-0947-4df5-a6df-f8cd81b23828', 'Dark Matter', 'Plasma'))
    info = get_url("/info")

    print(scan_info)
    print(info)