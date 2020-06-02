# release-version

## Usage

```yaml
name: Update .version
on:
  issue_comment:
    types: [created]

jobs:
  release_version:
    runs-on: ubuntu-latest

    steps:
      - if: contains(github.event.comment.body, '/version') && contains(github.event.comment.html_url, '/pull')
        uses: actions/checkout@v1
      - if: contains(github.event.comment.body, '/version') && contains(github.event.comment.html_url, '/pull')
        uses: bluerabbit/actions/bin/release-version@v0.5
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GIT_AUTHOR_NAME: your_github_account
          GIT_AUTHOR_EMAIL: your_github_account@users.noreply.github.com
          GIT_COMMITTER_NAME: your_github_account
          GIT_COMMITTER_EMAIL: your_github_account@users.noreply.github.com
```
