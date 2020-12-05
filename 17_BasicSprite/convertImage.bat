:: -gB8 = bit depth of 8 bits per pixel (1,2,4,8,16 supported)
:: -Mw8 = tile width of the sprite (8 tiles * 8 pixels/tile = 64 pixels wide)
:: -Mh8 = tile height of the sprite (8 tiles * 8 pixels/tile = 64 pixels tall)
:: the above to -M are for meta-tiling, where tiles are 1D mapped consecutively
grit test.bmp -gB8 -Mw8 -Mh8