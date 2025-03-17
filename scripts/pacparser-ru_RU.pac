// Proxy Auto-Configuration Parser ru_RU
// License: MIT license <https://raw.githubusercontent.com/bogachenko/lib/master/LICENSE.md>
// Last update: March 2025
// Bitcoin (BTC) - bc1qnmderzmag45pa3a0jyaqah654x0055n6y8madh
// Bitcoin Cash (BCH) - qzptqmjr0vrj053wgcxa5yesdlejk973xq9xctmxcg
// Binance Coin (BNB) - 0xE4869C3140134522383E316d329612bC886F85E2
// Ethereum (ETH) - 0xE4869C3140134522383E316d329612bC886F85E2
// Ethereum Classic (ETC) - 0x4A11511a9C69eA1CFa8B1135c9B8A3B27c84eE55
// Tron (TRX) - TW8ocDJLPTnVFG4Karb7zctbBfjFaZfuJn
// Toncoin (TON) - UQA5s93oUhxmmkaivrZim1VOh9v-D6CI15jlk80FP6wWtYrw
// Dogecoin (DOGE) - D7BHKJ4ymU5uZKrju5BbYQpSfdENc5qtr1
// Litecoin (LTC) - ltc1q3t9hmgqyze8qlrw56rxepyw8ll44jcl7uc8z4p
// Solana (SOL) - 5fsRA5NiQKX5GLzatbmYS7UbZ9Q2LMqdCH7pBgtrXDJM
// Ripple (XRP) - rnEWArfEDm4yFJeG7xnvDCkW7GKperxf6t
// Dash (DASH) - XkQFy1UfKCCpiSw391A5YYTEYEKYvxVoxE
// Cardano (ADA) - addr1q8yjcner4yq7kgd0gleq4qf0gae2xemvvpu790nhfk7a3y8gje4zxphcq0kyg3ry5yvgtzy2huhd49l9rdwmh6khmm4se2er3a
// Zcash (ZEC) - t1N8QRJg6jFt2m92DyFkYVDEv36ZK3JnQP2

var hasOwnProperty = Object.hasOwnProperty;
function FindProxyForURL(url, host) {
    var proxy = 'PROXY proxy-nossl.antizapret.prostovpn.org:29976; DIRECT;';
    var domains = {
        "127.0.0.1": 1
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