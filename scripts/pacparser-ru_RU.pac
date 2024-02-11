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
    "tvrain.ru": 1,
    "meduza.io": 1,
    "bellingcat.com": 1,
    "voanews.com": 1,
    "dw.com": 1
  };
    if (dnsDomainIs(host, ".onion"))
    return "SOCKS5 localhost:9050";
  if (dnsDomainIs(host, ".i2p"))
    return "PROXY localhost:4444; SOCKS localhost:4447";
    var suffix;
    var pos = host.lastIndexOf('.');
    pos = host.lastIndexOf('.', pos - 1);
    while(1) {
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