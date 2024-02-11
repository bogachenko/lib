// Proxy Auto-Configuration Parser ru_RU
// Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
// https://raw.githubusercontent.com/bogachenko/lib/master/scripts/pacparser-ru_RU.pac

var hasOwnProperty = Object.hasOwnProperty;
function FindProxyForURL(url, host) {
    var proxy = 'SOCKS 127.0.0.1:9050; DIRECT;';
    var domains = {
        "torproject.org": 1,
        "facebook.com": 1,
        "twimg.com": 1,
        "twitter.com": 1,
        "cdninstagram.com": 1,
        "instagram.com": 1,
        "ggpht.com": 1,
        "navalny.com": 1,
        "newtimes.ru": 1,
        "kasparov.ru": 1,
        "tvrain.tv": 1,
        "meduza.io": 1,
        "bellingcat.com": 1,
        "voanews.com": 1,
        "dw.com": 1,
        "sakhalin.info": 1,
        "tvfreedom.io": 1,
        "unian.ua": 1,
        "doxa.team": 1,
        "rutracker.org": 1,
        "rutor.org": 1,
        "bobfilm.org": 1,
        "kinozal.tv": 1,
        "seedoff.net": 1,
        "thepiratebay.org": 1,
        "1337x.to": 1,
        "btdig.com": 1,
        "myrotvorets.center": 1,
        "intel.com": 1,
        "spotify.com": 1,
        "prostovpn.org": 1,
        "hdkinoteatr.com": 1,
        "myzuka.club": 1,
        "archive.is": 1,
        "t.co": 1,
        "fbcdn.net": 1,
        "facebook.net": 1,
        "x.com": 1,
        "adguard.com": 1,
        "adguard-vpn.com": 1,
        "sakh.com": 1
    };
    if (dnsDomainIs(host, ".onion"))
        return "SOCKS5 localhost:9050";
    if (dnsDomainIs(host, ".i2p"))
        return "PROXY localhost:4444; SOCKS localhost:4447";
    var suffix;
    var pos = host.lastIndexOf('.');
    pos = host.lastIndexOf('.', pos - 1);
    while (1) {
        if (pos <= 0) {
            if (hasOwnProperty.call(domains, host)) {
                return proxy;
            } else {
                return DIRECT;
            }
        }
        suffix = host.substring(pos + 1);
        if (hasOwnProperty.call(domains, suffix)) {
            return proxy;
        }
        pos = host.lastIndexOf('.', pos - 1);
    }
}