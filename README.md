# docker-condensation

Have docker installed and in $PATH

```
alias condensation="docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -v \`pwd\`:/particles --rm sungardas/condensation"

condensation create project particles-MYPROJECT

cd particles-MYPROJECT

condensation run build
```
