var proxy = 'SOCKS 127.0.0.1:9050; DIRECT;';

var domains = {
  "torproject.org": 1,
  "facebook.com": 1,
  "twimg.com": 1,
  "twitter.com": 1,
  "cdninstagram.com": 1,
  "instagram.com": 1,
  "ggpht.com": 1
};

var direct = 'DIRECT;';

var hasOwnProperty = Object.hasOwnProperty;

function FindProxyForURL(url, host) {
    var suffix;
    var pos = host.lastIndexOf('.');
    pos = host.lastIndexOf('.', pos - 1);
    while(1) {
        if (pos <= 0) {
            if (hasOwnProperty.call(domains, host)) {
                return proxy;
            } else {
                return direct;
            }
        }
        suffix = host.substring(pos + 1);
        if (hasOwnProperty.call(domains, suffix)) {
            return proxy;
        }
        pos = host.lastIndexOf('.', pos - 1);
    }
}
