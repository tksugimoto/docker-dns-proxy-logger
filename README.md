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
    1. 設定ファイルを作成: `.env.example` を `.env` にコピー
        ```sh
        cp .env.example .env
        ```
    1. 設定ファイル `.env` を必要に応じて編集
        - ※ 同名の環境変数が定義されていると、 `.env` での定義より環境変数が優先される
             - ただし、Windowsの場合、小文字が含まれる環境変数は `.env` が優先される可能性がある
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
    - ※ 【プロキシ環境下】初回起動（ビルド）時に失敗した場合、外部からpackageをインストールするため、プロキシ情報を環境変数 or `.env` に定義する
1. ログを閲覧
    ```sh
    docker-compose logs -f
    ```
