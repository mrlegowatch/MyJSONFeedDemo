# MyJSONFeedDemo
An example JSON feed demo written in Swift 4 using Codable on a USGS GeoJSON data feed.

The interesting bits are:
* `USGSEarthquakeData` in USGSEarthquakeData.swift - Nested struct uses Codable without requiring any customization
* `fetch()` in USGSEarthquakeData.swift - Fetches the data from the USGS web site
* `viewDidLoad()` in MasterViewController.swift - Triggers the fetch

I developed this demo while writing these medium.com articles:
* [A brief encounter with UISCrollView](https://medium.com/@mrlegowatch/a-brief-encounter-with-uiscrollview-bf8891613ba5)
* [OMG Codable is so frickin' awesome](https://medium.com/@mrlegowatch/omg-codable-is-so-frickin-awesome-bb9ff33139da)
