# Baïkal Docker Image

Docker image for [Baïkal][1] based on [Alpine][2], [Nginx][3], [PHP][4], and [Supervisor][5].

## Usage

Execute the following command to run this image:

```shell
docker run --publish 80:80 --volume /var/opt/baikal:/var/www/baikal/Specific jsshandle/baikal
```

## License

[The MIT License](LICENSE)

[1]: http://sabre.io/baikal/
[2]: https://github.com/gliderlabs/docker-alpine
[3]: https://www.nginx.com/
[4]: http://php.net/
[5]: http://supervisord.org/
