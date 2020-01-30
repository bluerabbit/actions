# release-tag

## Usage

```yaml
name: release-tag

on:
  push:
    branches:
      - master

jobs:
  release_tag:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: "git tag -a $(cat .version)"
        uses: bluerabbit/actions/bin/release-tag@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GIT_AUTHOR_NAME: your_github_account
          GIT_AUTHOR_EMAIL: your_github_account@users.noreply.github.com
          GIT_COMMITTER_NAME: your_github_account
          GIT_COMMITTER_EMAIL: your_github_account@users.noreply.github.com
```
