# Weather Command Line Tool

As a programmer, do you ever get bothered by having to leave your terminal to
check the weather report? I certainly have, and thus the reason for this tool.

This command-line tool allows you to get the current weather conditions for your
location right in the command line.

Just run `./weather KPDX` or whatever your location code is and it will return a nicely
formatted list of the key weather conditions in your current location:

```
Location: Portland, Portland International Airport, OR
Observation Time: Last Updated on Jan 16 2016, 12:53 pm PST
Weather: Light Rain Fog/Mist
Temperature: 50.0 F (10.0 C)
Humidity: 93
Wind: South at 16.1 MPH (14 KT)
Wind-chill: 44 F (7 C)
```

Since this is a personal command line customization and not a dependency you would
have in your app most likely, I didn't create a hex package for it.

## Installation

First off, you must have erlang installed to run this script.

There are two options when it comes to installation:

  1. Download the `weather` folder in the root directory and put it where ever you want
  on your local machine.

  2. Generate the script yourself, by cloning this repo and running `mix escript.build`
