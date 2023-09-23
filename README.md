# plex api tooling

this is just a quick and dirty thing to start making API calls to plex through the commandline.

## quickstart

first, create a `config.bash` file that assigns 2 variables:

* `product` -- the name of your project
* `client_id` -- a made up secret that you'll use to identify your application to plex.

> normally, there's some sort of developer portal where you can register your application and be assigned a client ID and secret, but Plex just lets app developers make up their own ID, so choose something unique.

### example config.bash:

```bash
product="Plexipoo"
client_id="a0a9728e6be791b67e8b04a2fad119d3"
```

Next, run `./get-token` which will take you through the oauth dance in your browser, making you approve the application. you should see your `product` name that you defined in the config show up in the browser window.

This will also write out the token to a file named `token` in this directory. This `token` will contain the API token for making calls using the `plex-api` tool.

In the `plex-api` tool, it will take whatever arguments you type and run them, so look at the source to figure out what you wanna do. here's some examples:

* `./plex-api get-user` -- dump information about yourself.
* `./plex-api get-resources` -- dump information about folks who share with you + any devices that you've approved
* `./plex-api get-media-servers` -- dumps only media servers from the resources
* `./plex-api get-media-servers | jq 'select(.name="minustirith")' | ./plex-api get-libraries` -- list all media libraries from a server named `miniustirith`.

> protip: the output from the above commands can/should be piped into `jq` to better format it and make it more readable for a human. you could also output to `gron` if there's massive amounts of data and you'd like to better understand the structure.

## other notes

There's still a lot of work to be done here, and there's some limitations to what's been implemented. for example, some plex servers that get listed may not respond or may provide an empty response. this is probably because of a misconfiguration on the server's side. There's another method to get media info from other servers, but that's not part of this, yet.
