
# geocheatcode

Here is background and code
for a trick I use to get
Google to give me best-in-class guesses 
for latitude and longitude,
despite goofy and/or downright bad location searches.

## Map all the things

I love maps.

Several of my projects involve mapping things at scale.

When you want to map a few things,
you type searches into Google Maps
and get addresses and/or latitudes and longitudes
quickly and reliably.

But what if you'd like to map 90,000 things
whose locations you don't yet know?

[Google](https://developers.google.com/maps) 
and 
[OpenStreetMap](https://www.openstreetmap.org/), 
as well as others,
provide mapping services
you can call programmatically from your software.
You send in some query, 
such as "VUMC Internal Medicine,"
and they return information
relevant to that query,
such as street address and 
latitude and longitude.
Up to a certain number of queries per day or hour, 
the services are free, 
and since my work is academic,
rather than real-time mapping for some
for-profit app, 
I am happy to send in small batches
to stay under the limits in the free tier.

I've used these services to make large maps,
and they work pretty well. 

*Pretty* well.

## But mapping is hard

Problems with these services:

1. they expected well-formed and reasonable queries
2. if they didn't know the answer, the guesses were often wildly off, or they would refuse to guess at all

If I'm mapping 90,000 things,
I'm going to write some code 
to go through each of those 90,000 things
and ask the mapping services 
to kindly tell me what I want to know.
Though I write sanitation code to clean up the 90,000 things,
I'm not going to quality check each of those 90,000 things.
Sometimes things among the 90,000 things are kinda nuts
(misspelled, inclusive of extraneous data, oddly formatted),
in idiosyncratic ways that are impossible to completely cover,
no matter how much code I write to catch the weird cases.

I would like a solution that is fairly tolerant of weirdnesses,
and makes good guesses.

## Google is really good at search

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

Turns out there is, and it's easy.

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


extraneous = """ something something
                 the earth is banana shaped
                 latitude and longitude 
                 wouldn't you like to know, maybe """

relevant = """ Vanderbilt University Medical Center 
               Internal Medicine """

query = extraneous + relevant

lat, lon = google_lat_lon(query)

print( 
       "Hello. "
       "My name is Google. "
       "I am really good at guessing what you meant. "
      f"Your query was '{query}'. "
       "Here are the coordinates you probably wanted. "
      f"The latitude is {lat}, and the longitude is {lon}. "
       "Don't believe me? "
       "Here it is again, "
       "in a format you can paste into the search bar: \n"
      f"{lat}, {lon} \n"
       "Told ya. "
)

```

Despite having all that extra junk in the query,
this returns the right answer. 
Because Google is many things good and evil,
but of these one is certain: 
Google is *really* good at search.

## How does the code work?

If you inspect the source HTML
on the Google Maps website 
after you search for something
and it centers the map on its best guess, 
and you scroll way on down (or Ctrl-F search for it)
you'll find `APP_INITIALIZATION_STATE`, which contains
latitude and longitude for the place the map centered on.

- [example search](https://www.google.com/maps?q=something+whose+latitude+and+longitude+you+would+like+to+know,+maybe+VUMC+Internal+Medicine)
- [example source](view-source:https://www.google.com/maps/search/something+whose+latitude+and+longitude+you+would+like+to+know,+maybe+VUMC+Internal+Medicine/) (you have to copy and paste this link into a new tab manually, clicking won't work)

I use the lovely 
[`requests-html`](https://docs.python-requests.org/projects/requests-html/en/latest/) 
Python library
to send the query to Google,
receive the response,
and search through the response for the part I want to extract.
Then I use a little standard Python 
to parse the extracted part and save the important bits.

## With great power...

Don't go crazy with this. 

The trick is good for 
leisurely automation 
of location retrieval
when you have squirrelly queries.

If you need real-time mapping of many things,
you don't want this solution.
Use the actual APIs, 
and work instead on formatting the queries properly
before sending them to Google/OSM.

Also, if you try to query too much/too quickly,
Google will shut you out after a little while.
Put a few seconds of delay between each request 
and run it overnight and/or in automated batches.

## Know a better way?

I'd love to know. Drop me a line.
