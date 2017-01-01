# US Weather

Fetches the weather from the US National Weather Service

The given location should be a 4 digit code from one of the state lists, e.g.
"PADK" would lookup the weather for Adak Island, Adak Airport

See http://w1.weather.gov/xml/current_obs/seek.php for a list of all locations

usage:

```bash
$ us_weather <location>
```

Build with

```bash
$ mix escript.build
```
