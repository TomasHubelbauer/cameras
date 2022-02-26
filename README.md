# Cameras with clean HDMI output, unlimited runtime and UVC-card compatibility

I am looking to buy a camera with clean HDMI output (no UI), unlimited runtime
(no automatic power-off timer, seems to require a dummy battery in all cases)
and compatibility with UVC capture cards.

I found a list of cameras with the clean HDMI output and unlimited runtime on a
dummy battery attributes provided on the Elgato Cam Link camera check site:

https://www.elgato.com/en/gaming/cam-link/camera-check

The source file with JSON data is available directly at this URL:

https://www.elgato.com/sites/default/files/cameras.json

I have written a script to filter down the list based on the above requirements.

---

It seems that there is no camera which has unlimited runtime on USB power only.

There is a single camera with `power == "DCPowerAdapter"` and unlimited runtime,
Canon EOS M6, but its notes say it requires Compact Power Adapter CA-PS700A DC
Coupler DR-E17 for contant power - this is just another way to say it requires a
dummy battery, so the data is mislabeled for this camera.

There is also `power == "USB"` Sony RX100 IV, but its notes say it requires a
dummy battery too, so again, this is a mislabeled camera record in the data.

I do not see a way to submit a correction to the data on the camera check page,
so I will not be contributing these corrections back to the community / Elgato.

---

If I settle for a dummy battery option, there is a bit wider choice of results.

Good:

Canon EOS M50 seems good. It is 14k on Alza:

https://www.alza.cz/canon-eos-m50

A YouTube video I found says it does not have a clean HDMI output. Overlays are
removable using the Info button except for the auto-focus indicator which is
only removable by disabling auto-focus. It also names SparkoCam as a software
solution to using this and other Canon cameras as webcams, but it makes it
sound as though SparkoCam restarts the Live View to keep the camera alive. This
is counter to what the Elgato database says: that it is possible to disable
Eco Mode and Auto Power-Off in settings. I am not clear on whether this is an
oversight in the video and SparkoCam is not needed, or if the Elgato database
has this wrong. It also mentions the auto-focus thing the video talks about,
too. It seems as though SparkoCam works directly through the USB Canon protocol
and maybe a capture card and an HDMI port is not even needed? The video makes
it seems like there are two options: no auto-focus + capture card or auto-focus
plus SparkoCam for a feed with no overlays. The latter is presumably higher
quality.

https://www.youtube.com/watch?v=w25dRpbM08w

https://www.youtube.com/watch?v=TOpsG_jlEbU

https://sparkosoft.com/sparkocam

SparkoCam costs 100 USD for a lifetime license with updates.

The DC coupler (dummy battery) for this is Canon DR-E12 and the AC charger is
Canon ACK-E12. This shop seems to have it and the photo makes it appear as if
both the charger and the coupler were included in the package (non-original):

https://www.profotak.cz/Neoriginalni-adapter-pro-Canon-ACK-E12-d1766.htm

I shot them a message asking about the exact contents of the package and I was
told it does include both the charger and the coupler.

Otherwise it is not available in the Czech Republic as far as I can see, but it
is available on Amazon.

Bad:

- Canon EOS 5D Mark III: shuts off - mislabeled unlimited runtime
- Canon EOS M6: no longer being sold
- Nikon D3300: no longer being sold
- Nikon D5100: no longer being sold
- Nikon D5300: no longer being sold
- Nikon D750: no longer being sold
- Sony RX100 IV: no longer being sold

## Canon ESO M50

- https://www.youtube.com/watch?v=CJ9HLexTg5I
- https://www.youtube.com/watch?v=0nl9oErMm-c
- https://magiclantern.fm/
- https://www.usa.canon.com/internet/portal/us/home/support/self-help-center/eos-webcam-utility
- https://www.youtube.com/watch?v=rt_0Ve9Ajo0
