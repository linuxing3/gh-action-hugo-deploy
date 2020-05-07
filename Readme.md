# Hugo发布行动

这是一个简单的Github行动 [GitHub Action](https://github.com/actions)，主要是将[Hugo](https://gohugo.io)站点发布到组织、个人的Github源中的Master，自动生成Github Pages

条件:

1. 拥有个人/组织源仓库 
   You have a GitHub organization site repository like `linuxing3/linuxing3.github.io`.
1. hugo的源文件部署在source分支 
   You have a branch `source` holding the hugo source files.
1. 静态网站文件自动部署在master分支 
   You want to automate the build and publish process to `master` branch.

## 使用方法 Usage

添加一个行动工作流配置文件，内容如下
Add a `.github/workflows/main.yml` file with content like the following:

```yaml
steps:
  - uses: actions/checkout@master
    with:
      submodules: true
      ref: source

  - uses: linuxing3/gh-action-hugo-deploy@master
    with:
      destination_repo: linuxing3/linuxing3.github.io
      destination_token: ${{ secrets.Deploy_Token }}
      build_dir: "public"
```

将秘钥[secret][secret]添加到，命名为`Deploy_Token`。该秘钥应该是GitHub [access token][token]，拥有"repo"
操作许可，可以发布到`.github.io`仓库。

检查 [`action.yml`](/action.yml)，可以看到更多的配置信息

[秘钥 secret]: https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables
[托证 token]: https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line
