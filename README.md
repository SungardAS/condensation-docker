# docker-condensation

Have docker installed and in $PATH

```
alias condensation="docker run -v \`pwd\`:/particles --rm sungardas/condensation"

condensation create project particles-MYPROJECT

cd particles-MYPROJECT

condensation run build
```
