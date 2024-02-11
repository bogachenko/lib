function FindProxyForURL(url, host) {
    if (
        host == "yt3.ggpht.com" ||
        host == "www.instagram.com" ||
        host == "cdninstagram.com" ||
        host == "static.cdninstagram.com"
        ) 
    {
        return "HTTPS proxy-ssl.antizapret.prostovpn.org:3143; PROXY proxy-nossl.antizapret.prostovpn.org:29976; DIRECT";
    }
    return "DIRECT";
}