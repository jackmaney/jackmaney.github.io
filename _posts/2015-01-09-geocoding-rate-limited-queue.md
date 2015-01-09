---
title: Geocoding and A Rate Limited Queue
layout: post
tags: code, geocoding
---

For a recent project at work, I had to [geocode](http://en.wikipedia.org/wiki/Geocoding) lots of addresses. 
Thankfully, [geopy](https://github.com/geopy/geopy) makes this relatively painless: just grab 
[a class representing the geocoding API that you want](http://geopy.readthedocs.org/en/latest/#module-geopy.geocoders) 
and go to town.

However, many of these APIs have rate limits--and even for the ones that don't, it's probably unwise to risk annoying 
them or thinking that you're mounting a DoS attack. So, I built a simple wrapper class that would enforce a per-second limit 
for geocoding:

<script src="https://gist.github.com/jackmaney/4a98cfdfef61e1d5a097.js"></script>

Then, I got to thinking that it might be worth abstracting this a bit into a rate-limited queue that can obey 
one or more rate limits. [So, I did](https://github.com/jackmaney/rate-limited-queue). You can install the library
via pip:

```
[sudo] pip install rate_limited_queue
```

I also used this project as an excuse to familiarize myself a bit with [Sphinx](http://sphinx-doc.org/). 
My resulting documentation for the `rate_limited_queue` package can be found [here](http://rate-limited-queue.readthedocs.org/en/latest/). The code to use this queue for rate-limited geocoding 
would look something like this:

```

import geopy

from rate_limited_queue import RateLimitedQueue, RateLimit

addresses = open("some_file_of_addresses.txt").read().splitlines()

# No more than ten addresses geocoded per second
rate_limit = RateLimit(duration=1, max_per_interval=10)

geocoder = geopy.geocoder.OpenMapQuest()

q = RateLimitedQueue(
                    addresses,
                    processing_function = geocoder.geocode,
                    rate_limits = [rate_limit])

# Grabs the geocoded locations, but doesn't process
# more than ten per second
geocoded_locations = q.process()
```

It's still a bit rough around the edges, but it's a start.
