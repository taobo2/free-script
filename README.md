docker.exe build [-t imageName]  [--build-arg mode='proxy'|'server'] [--build-arg pacserver="..."] .

mode can be proxy or server. Default value is server.

pacserver can be 1. SOCKS ip:port   2. SOCKS5 ip:port   3. PROXY ip:port   4. Multiple items connected with ;
