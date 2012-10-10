#Web Compass

A browser extensions that tells you which direction your current website is coming from (and how far away)

## Make a background page that
 1. uses geolocation to find your spot
 1. responds to a tab url change: https://developer.chrome.com/extensions/webRequest.html onResponseStarted
 1. computes the direction of the server for a tab
 1. creates a canvas element with a compass pointing that direction
 1. calls setIcon to change the icon of that tab