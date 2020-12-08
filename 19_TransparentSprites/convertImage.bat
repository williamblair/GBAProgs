:: -gB8 = bit depth of 8 bits per pixel (1,2,4,8,16 supported)
:: -Mw8 = tile width of the sprite (4 tiles * 8 pixels/tile = 32 pixels wide)
:: -Mh8 = tile height of the sprite (4 tiles * 8 pixels/tile = 32 pixels tall)
:: the above to -M are for meta-tiling, where tiles are 1D mapped consecutively
..\17_BasicSprite\grit-0.8.6\grit\grit.exe basketball.bmp -gB8 -Mw4 -Mh4