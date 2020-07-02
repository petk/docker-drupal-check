# Docker drupal-check

Docker wrapper for the [drupal-check](https://github.com/mglaman/drupal-check)
tool.

## Usage

```sh
docker run -it --rm -v "$PWD":/app drupal-check docroot/modules/custom
```

## Building Docker image

```sh
./run.sh build
```
