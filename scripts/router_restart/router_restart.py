from datetime import datetime
from time import sleep

import requests
import socket

from urllib3.exceptions import NewConnectionError


def is_connected():
    try:
        socket.create_connection(("1.1.1.1", 53), timeout=3)
        print(" "*25, "Socket connection timeout")
        return True
    except OSError:
        pass
    except NewConnectionError:
        pass
    return False


def restart():
    s = requests.Session()

    s.headers.update(
        {
            "Host": "192.168.0.1",
            "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:93.0) Gecko/20100101 Firefox/93.0",
            "Accept-Language": "en-US,en;q=0.5",
            "Accept-Encoding": "gzip, deflate",
            "Authorization": "Basic YWRtaW46VmV2U2Fkb2w=",
            "Connection": "keep-alive",
            "Upgrade-Insecure-Requests": "1",
        }
    )

    r = s.get(
        "http://192.168.0.1/userRpm/DateTimeCfgRpm.htm",
        headers={
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
            "Referer": "http://192.168.0.1/userRpm/MenuRpm.htm",
        },
    )


    # These variables probably come from the result of the request above
    Referer_1 = "http://192.168.0.1/dynaform/css_main.css"


    s.headers.update({"Upgrade-Insecure-Requests": None})

    r = s.get(
        "http://192.168.0.1/dynaform/css_main.css",
        headers={
            "Accept": "text/css,*/*;q=0.1",
            "Referer": "http://192.168.0.1/userRpm/DateTimeCfgRpm.htm",
        },
    )


    r = s.get(
        "http://192.168.0.1/dynaform/common.js",
        headers={
            "Accept": "*/*",
            "Referer": "http://192.168.0.1/userRpm/DateTimeCfgRpm.htm",
        },
    )


    r = s.get(
        "http://192.168.0.1/dynaform/custom.js",
        headers={
            "Accept": "*/*",
            "Referer": "http://192.168.0.1/userRpm/DateTimeCfgRpm.htm",
        },
    )


    r = s.get(
        "http://192.168.0.1/localiztion/char_set.js",
        headers={
            "Accept": "*/*",
            "Referer": "http://192.168.0.1/userRpm/DateTimeCfgRpm.htm",
        },
    )


    r = s.get(
        "http://192.168.0.1/images/blue.jpg",
        headers={"Accept": "image/avif,image/webp,*/*", "Referer": Referer_1},
    )


    s.headers.update({"Upgrade-Insecure-Requests": "1"})

    r = s.get(
        "http://192.168.0.1/help/DateTimeCfgHelpRpm.htm",
        headers={
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
            "Referer": "http://192.168.0.1/userRpm/DateTimeCfgRpm.htm",
        },
    )


    s.headers.update({"Upgrade-Insecure-Requests": None})

    r = s.get(
        "http://192.168.0.1/dynaform/css_help.css",
        headers={
            "Accept": "text/css,*/*;q=0.1",
            "Referer": "http://192.168.0.1/help/DateTimeCfgHelpRpm.htm",
        },
    )


    s.headers.update({"Upgrade-Insecure-Requests": "1"})

    r = s.get(
        "http://192.168.0.1/userRpm/SysRebootRpm.htm",
        headers={
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
            "Referer": "http://192.168.0.1/userRpm/MenuRpm.htm",
        },
    )


    # These variables probably come from the result of the request above
    Referer_2 = "http://192.168.0.1/userRpm/SysRebootRpm.htm"


    s.headers.update({"Upgrade-Insecure-Requests": None})

    r = s.get(
        "http://192.168.0.1/dynaform/css_main.css",
        headers={"Accept": "text/css,*/*;q=0.1", "Referer": Referer_2},
    )


    r = s.get(
        "http://192.168.0.1/dynaform/common.js",
        headers={"Accept": "*/*", "Referer": Referer_2},
    )


    r = s.get(
        "http://192.168.0.1/images/blue.jpg",
        headers={"Accept": "image/avif,image/webp,*/*", "Referer": Referer_1},
    )


    s.headers.update({"Upgrade-Insecure-Requests": "1"})

    r = s.get(
        "http://192.168.0.1/help/SysRebootHelpRpm.htm",
        headers={
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
            "Referer": Referer_2,
        },
    )


    s.headers.update({"Upgrade-Insecure-Requests": None})

    r = s.get(
        "http://192.168.0.1/dynaform/css_help.css",
        headers={
            "Accept": "text/css,*/*;q=0.1",
            "Referer": "http://192.168.0.1/help/SysRebootHelpRpm.htm",
        },
    )


    r = s.get(
        "http://192.168.0.1/userRpm/SysRebootRpm.htm",
        headers={
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
            "Referer": Referer_2,
        },
    )


    r = s.get(
        "http://192.168.0.1/userRpm/SysRebootRpm.htm",
        params={"Reboot": "Reboot"},
        headers={
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
            "Referer": Referer_2,
            "Upgrade-Insecure-Requests": "1",
        },
    )


    s.headers.update(
        {"Referer": "http://192.168.0.1/userRpm/SysRebootRpm.htm?Reboot=Reboot"}
    )

    r = s.get(
        "http://192.168.0.1/dynaform/css_main.css",
        headers={"Accept": "text/css,*/*;q=0.1"},
    )


    r = s.get(
        "http://192.168.0.1/dynaform/common.js",
        headers={"Accept": "*/*"},
    )


    r = s.get(
        "http://192.168.0.1/images/blue.jpg",
        headers={"Accept": "image/avif,image/webp,*/*", "Referer": Referer_1},
    )


if __name__ == '__main__':
    print(" "*25, "Script is starting")
    while not is_connected():
        print("* "*20, "Trying to connect", " *"*20)
        print("* "*20, datetime.now().strftime("%H:%M:%S"), " *"*20)
        try:
            restart()
        except (ConnectionError and requests.exceptions.ConnectionError):
            pass
        sleep(20)
    else:
        print("* "*20, " *"*20)
        print("# "*20, " #"*20)
        print("* "*20, " *"*20)
        print(" "*25, "Internet connection established")
        print("* " * 20, " *" * 20)
        print("# " * 20, " #" * 20)
        print("* " * 20, " *" * 20)
        exit(0)
