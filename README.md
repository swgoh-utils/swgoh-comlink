# SWGoH Comlink

SWGoH Comlink is a service provided as a binary executable that makes calls to the read-only, unauthenticated game APIs for the mobile game Star Wars: Galaxy of Heroes. When the service is run, a web server is exposed on the port specified by the user. Users are responsible for hosting their own copy of the comlink service to provide for the game data needs of the tools/services they develop and/or provide.

Capital Games ultimately controls what data is accessible in the APIs Comlink connects to. Those APIs currently only include the following information:
- game data including metadata, localization bundles, and enum values referenced throughout the data
- player profile data

The list of endpoints provided by the service, their parameters, and the response formats are bundled directly with the service in an OpenAPI specification that can be viewed and downloaded with the included Redoc UI interface on the web server.  The gitlab wiki has additional details about the entity relationships of the response data for the [game data](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/Game-Data) and [player data](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/Player-Data).

Vist the [Getting Started](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/Getting-Started) page for additional information and instructions on setup.

### Limitations
Comlink is only able to return the data accessible from the game APIs. It has no way to log into an account to perform actions or retrieve information about a player's account beyond what can be seen in the game when clicking on other players. This means unequipped mods, mats, and gear will not be accessible.

The data returned from the APIs is provided as-is and unmodified, with the exception of the localization bundle, which is provided either in base64 encoded string format, or unzipped into a json object based on your request parameters. Users will need to do their own formatting and modifications to the data, some examples can be found in the [gitlab wiki](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/home). Updates to the game that bring access to new data within the game APIs will be provided on a best effort basis, but aren't guaranteed.

Rate limits are controlled entirely by Capital Games' policies.  From observation, CG limits the total request/responses per public IP per second to ~20. The `/player` and `/playerArena` endpoints may have a more generous limit of 100 /second. These limits can change at any time at Captial Games' discretion and the users of Comlink are responsible for the consequences of abuse that may be brought on by their tools/services.

### Useful Links
[SWGoH Comlink Discord &#8599;](https://discord.gg/zs3DwRrXQP)\
[API Client Libraries](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/API-Client-Libraries)\
[FAQ](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/FAQ)\
[Troubleshooting](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/Troubleshooting)\
[Game Data](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/Game-Data)\
[Player Data](https://gitlab.com/swgoh-tools/swgoh-comlink/-/wikis/Player-Data)

# Disclaimer

SWGoH Comlink is provided as-is and a person's use of it shall not create any expressed or implied warranty or guarantee of any kind. Furthermore, the developers and contributors for SWGoH Comlink are not liable for any damages and/or actions brought upon a user by their use of this tool. It is the user's responsibility to ensure that their usage of SWGoH Comlink complies with the [terms of service for the game &#8599;](https://www.ea.com/legal/user-agreement#rules-of-conduct).
