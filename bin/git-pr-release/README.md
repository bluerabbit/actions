# git-pr-release

## Usage

```workflow
workflow "git-pr-release flow" {
  resolves = ["git-pr-release"]
  on       = "issues"
}

action "git-pr-release" {
  uses    = "bluerabbit/actions/bin/git-pr-release@master"
  secrets = ["GITHUB_TOKEN"]
  env     = {
    GIT_AUTHOR_NAME  = "your_name"
    GIT_AUTHOR_EMAIL = "your_email"
  }
}
```

## Example Output

```
...
```
