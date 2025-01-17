# sbcntr-resources

## リポジトリの構成

```bash
❯ tree . -d 1
.
├── cicd
├── cloudformations
├── cloud9
├── fargate-bastion
├── firelens
├── iam
└── scan
```

それぞれのディレクトリと関連付けは次の通り。

| ディレクトリ          | 対象箇所                                                    | 内容                                               |
|-----------------|------------------------------------------------------------|--------------------------------------------------|
| cicd            | 5-2 運用設計:Codeシリーズを使った CI/CD                                | CI/CD設計で利用するビルド定義やタスク定義などを格納                     |
| cloudformations | 4-2 ネットワークの構築, 4-4 コンテナレジストリの構築, 4-5 オーケストレータの構築, 付録1 | ハンズオンや付録で利用するCloudFormationを格納                      |
| cloud9          | 4-4 コンテナレジストリの構築   | resize.shを格納 |
| fargate-bastion | 5-7 運用設計:FargateによるBastion(踏み台ホスト)の構築                      | Fargate Bastionで利用するBastionコンテナの設定を格納            |
| firelens        | 5-6 運用設計 &セキュリティ設計:ログ収集基盤の構築                               | ログ収集基盤のFireLensコンテナに設定するログ設定を格納                  |
| iam             | 4章、5章全般                                                    | 4章や5章の各所で利用するIAMポリシーのJSONファイルを格納                 |
| scan            | 5-8 セキュリティ設計:  Trivy/Dockleによるセキュリティチェック                   | DevSecOpsを実現するためのCodeBuildのビルド定義を格納              |
