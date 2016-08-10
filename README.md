# docker-condensation

## Create an alias for condensation

The following example create an alias that will:

* bind mount the host user aws credentials file to the container
* expose any AWS environment variables that are set on the host for
  authentication
* bind mount the current directory on the host to `/particles` in the
  container

```
alias condensation="docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -v \"$HOME\"/.aws/credentials:/home/condensation/.aws/credentials -v \`pwd\`:/particles --rm sungardas/condensation"
```


## Run condensation

```
condensation create project particles-MYPROJECT

cd particles-MYPROJECT

condensation run build
```

### create

A wrapper for [generator-condensation][generator-condensation-url].

Appends arguments to `yo condensation:` within the container

### run

A wrapper for [condensation gulp tasks][condensation-tasks-url].

Appends arguments to `/particles/node_modules/.bin/gulp` within the
container.


## License

Apache-2.0 ©

## Sungard Availability Services | Labs
[![Sungard Availability Services | Labs][labs-logo]][labs-github-url]

This project is maintained by the Labs team at [Sungard Availability
Services](http://sungardas.com)

GitHub: [https://sungardas.github.io](https://sungardas.github.io)

Blog: [http://blog.sungardas.com/CTOLabs/](http://blog.sungardas.com/CTOLabs/)

[labs-github-url]: https://sungardas.github.io
[labs-logo]: https://raw.githubusercontent.com/SungardAS/repo-assets/master/images/logos/sungardas-labs-logo-small.png
[condensation-image]: https://raw.githubusercontent.com/SungardAS/condensation/master/docs/images/condensation_logo.png
[condensation-url]: https://github.com/SungardAS/condensation
[condensation-tasks-url]: https://github.com/SungardAS/condensation#tasks
[generator-condensation-url]: https://github.com/SungardAS/generator-condensation
