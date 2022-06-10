# SWGoH Comlink

This service is capable of making read-only calls to SWGOH game APIs that do not require authentication.  You host your own copy of the service.  It is provided as an executable primarily via a docker image, but some binaries for common architectures are provided on a best effort basis with each release [on github](https://github.com/sw-goh-tools/swgoh-comlink/releases)

When run, a small web server is exposed on the port you specify.  You can obtain the open API spec from the web server, as well as view it in the swagger UI interface.  The spec desribes the list of the API end points, their parameters, and response formats.

The data returned from the APIs is not modified, with the exception of the localization bundle, which is provided either in base64 encoded string format, or unzipped into a json object.  The philosophy for this project is to provide as much as possible as-is in order to enable things such as data mining and minimize manual work in future game updates.

Updates with access to new data from the game APIs will be provided on a best effort basis, but aren't guaranteed.

For more detailed information, check out the [gitlab wiki](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/home).

Join the [discord server](https://discord.gg/zs3DwRrXQP) for any questions or support.

# Legal Stuff

You are responsible for ensuring that your usage of this tool complies with your agreement to swgoh's legal stuff.  We are not responsible for how you use this tool.  The software is provided as-is.

# FAQs

## **Q: Are there or will there be premium features?**

**A:** No.  There may be a way to donate in the future, but there are no plans to monetize the service.

## **Q: What are the rate limits?**

**A:** This is controlled entirely by CG's policies.  From observation, CG limits the total request/responses per public IP per second to ~20, but your mileage may vary.  You are responsible for the consequences of abuse, and if you're running this from the same network that you play the game, your traffic from your actual game client will also factor in to the total throughput you consume.

## **Q: Can I get access to the source?**

**A:** No

## **Q: Will this ever support things that require logging in?**

**A:** No

## **Q: Why isn't there a guild API?**

**A:** The guild API currently requires logging in/authenticating as a player, and this tool does not include this, even as an anonymous guest user.  We've asked if CG will allow calling the API without logging in, but don't get your hopes up.

## **Q: Why does it force me to upgrade my client?**

**A:** The client contains a failsafe to force you to update in case 2 major game releases have happened since the version of the client that you're using was published based off of.  This is to help ensure that if there are any necessary updates, you will pick them up at least every few months.  There's also the possibility that CG will ask for changes to the behavior of the client, which wouldn't be possible if they continued to function indefinitely.

# Getting started

It is assumed that you will be running the service as a container.  [Instructions on how to set up and use docker](https://docs.docker.com/engine/install/) are outside of the scope of support, but some basic examples are provided.  You should be able to deploy and run the application image anywhere that supports running containers (heroku, AWS, k8s, etc).

## Environment Variables

- APP_NAME - used to identify the name of the primary application consuming the API in the requests sent to CG's servers.  This can also be specified using the --name or -n flag at the command line, but the environment variable method is recommended.  **This value is required.**
- PORT - specifies which port to expose (more important if not running in docker).  Default is `3000`.  When running using docker, this doesn't matter- you just need to set the external port.

## Deploying with Docker

The gitlab ci/cd process automatically publishes images to the gitlab container registry.

Updated images can be pulled and deployed directly from the registry.  Existing containers should be stopped and removed using a process similar to the below.

```sh
docker pull registry.gitlab.com/swgoh-tools/swgoh-comlink:latest
docker stop swgoh-comlink
docker rm swgoh-comlink
docker run --name swgoh-comlink \
  -d \
  --restart always \
  --env APP_NAME=your-app-name-goes-here \
  -p 3200:3000 \
  registry.gitlab.com/swgoh-tools/swgoh-comlink:latest
```

If the port from the example above (3200) is already in use in your environment, you can expose the service on a different port by changing the first port number, which is the external port that the internal port maps to.

The `-d` option instructs docker to run as a daemon, and `--restart always` makes it so that the container will always start with docker / restart if it crashes.
