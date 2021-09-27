
# geocheatcode

## Map All the Things

I love maps.

Several of my projects involve mapping things at scale.

When you want to map a few things,
you type your searches into Google Maps
and get addresses and/or latitudes and longitudes
quickly and reliably.

But what if you would like to map 90,000 things
whose locations you don't yet know?

Google and OpenStreetMap, 
as well as others,
provide mapping services
you can call programmatically from your software.
You send in some query, 
such as "VUMC Internal Medicine,"
and they return information
relevant to that query,
such as street address and 
latitude and longitude.

I've used these services to make large maps,
and they work pretty well.

*Pretty* well.

## But Mapping is Hard

The main issues I ran into with these services were:

1. they expected well-formed and reasonable queries
2. if they didn't know the answer, the guesses were often pretty wildly off, or they would refuse to guess at all

If I'm mapping 90,000 things,
I am going to write some code 
to go through each of those 90,000 things
and ask the mapping services 
to kindly tell me what I want to know for each one.
Though I write sanitation code to clean up the 90,000 things
before sending each request,
I'm not going to quality check each of those 90,000 things.
Sometimes things among the 90,000 things are kinda nuts
(misspelled, inclusive of extraneous data, oddly formatted),
in idiosyncratic ways that are impossible to completely cover,
no matter how much code I write to catch the weird cases.

I would like my solution to be fairly tolerant of weirdnesses,
and to make good guesses.

## Google is Really Good at search

I noticed that when I manually typed things 
into the Google Maps search bar,
it forgave a myriad of sins
and did a great job centering the map on its best guess.
When I copied and pasted some of the weird things among the 90,000
into the Google Maps search bar
(the same things that made the 
official mapping services - including Google's - 
go all Poltergeist),
*voila!*, the right answer appeared,
success rates nearing 100%.

I thought there must be a way to repeat this process with code,
in a scalable way.

Turns out there is, and it's pretty easy.

## `geocheatcode.py`

```python

from requests_html import HTMLSession

session = HTMLSession()


def google_lat_lon(query: str):

    url = "https://www.google.com/maps/search/?api=1"
    params = {}
    params["query"] = query

    r = session.get(url, params=params)

    reg = "APP_INITIALIZATION_STATE=[[[{}]"
    res = r.html.search(reg)[0]
    lat = res.split(",")[2]
    lon = res.split(",")[1]

    return lat, lon


extraneous = "something whose latitude and longitude you would like to know, maybe"
relevant = "VUMC Internal Medicine"

query = extraneous + relevant

lat, lon = google_lat_lon(query)

print(
       "Hello."
       "My name is Google."
       "I am really good at guessing what you meant to search for."
      f"Your query was {query}."
       "Here are the coordinates you probably wanted me to retrieve."
      f"The latitude is {lat}, and the longitude is {lon}."
)

```

Despite having all that extra junk in the query,
this returns the right answer. 
Because Google is many things good and evil,
but of these one is certain: 
Google is *really* good at search.

## How does the code work?

If you inspect the HTML on the Google Maps website 
after you search for something 
and it centers the map on its best guess, and you scroll way on down,
you'll find `APP_INITIALIZATION_STATE`, which contains
latitude and longitude for the place the map centered on.
(For some reason it puts it in "longitude, latitude" order
instead of "latitude, longitude," but that's easily overcome.)

I use the lovely `requests-html` library
to send the query to Google,
receive the response,
and search through the response for the part I want to extract.
Then I use a little bit of standard Python 
to parse the extracted part and save the important bits.

PSA: don't go crazy with this. 
If you need real-time mapping of many things,
you don't want this solution.
Use the actual APIs, 
and work instead on formatting the queries properly
before sending them to Google/OSM.
This trick is good for going leisurely,
but automatically,
through a list of things you scraped from somewhere.

Also, if you try to map too many things too quickly,
Google will shut you out after a little while.
Put a few seconds of delay between each request 
and run it overnight and/or in automated batches.

## Know a better way?

I'd love to know. Drop me a line.
