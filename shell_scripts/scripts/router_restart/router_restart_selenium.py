from selenium.webdriver import Firefox, Keys
import socket

from selenium.webdriver.firefox import webdriver


def is_connected():
    try:
        socket.create_connection(("1.1.1.1", 53))
        return True
    except OSError:
        pass
    return False



def main():
    # fp = webdriver.FirefoxProfile('/home/torsho/.mozilla/firefox/9zlcmhio.default-release/')
    # browser = Firefox(firefox_profile=fp)
    browser = Firefox()

    # if is_connected():
    #     print("Internet connection established")
    #     browser.close()
    # else:
    browser.get('http://tplinkwifi.net/')
    browser.switch_to.alert.send_keys('admin')
    browser.switch_to.alert.send_keys(Keys.TAB)
    browser.switch_to.alert.send_keys('admin')
    browser.switch_to.alert.send_keys(Keys.ENTER)


if __name__ == '__main__':
    main()
