# DNS Proxy and Logger

## 機能
* 名前解決リクエストを別のDNSサーバーへ転送する
    * レスポンスは対応するリクエスト元に返却する
* 名前解決ログを出力する
    * ドメイン
    * 名前解決されたIP

## 使い方
1. [docker, docker-compose をインストール](https://docs.docker.com/install/#supported-platforms)
1. 設定
    1. 設定ファイルを作成: `.env.sample` を `.env` にコピー
        ```sh
        cp .env.sample .env
        ```
    1. 設定ファイル `.env` を必要に応じて編集
        - ※ Docker Machine を使っている場合は、`DNS_PROXY_LOGGER_BIND_IP` には `127.0.0.0/8` のIPではなく、 `docker-machine ip` で得られるIPを設定する必要がある
            ```sh
            # コンテナ内の DNS Server のbindをhost側につなげる際のhost側の待ち受けIP
            DNS_PROXY_LOGGER_BIND_IP=127.0.0.1
            ```
            ```
            $ docker-machine ip
            192.168.99.100
            ```

1. DNSサーバーを起動
    ```sh
    docker-compose up -d
    ```
1. ログを閲覧
    ```sh
    docker-compose logs -f
    ```
