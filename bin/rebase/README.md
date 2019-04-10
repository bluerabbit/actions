# rebase

## Usage

```workflow
workflow "Auto Rebase" {
  on = "issue_comment"
  resolves = "Rebase"
}

action "Rebase" {
  uses    = "bluerabbit/actions/bin/rebase@master"
  secrets = ["GITHUB_TOKEN"]
}
```

## Example Output

```
...
```
