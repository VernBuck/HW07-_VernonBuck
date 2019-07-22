
//{{BLOCK(titlescreen)

//======================================================================
//
//	titlescreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 436 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13952 + 2048 = 16512
//
//	Time-stamp: 2017-03-09, 13:53:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TITLESCREEN_H
#define GRIT_TITLESCREEN_H

#define titlescreenTilesLen 13952
extern const unsigned short titlescreenTiles[6976];

#define titlescreenMapLen 2048
extern const unsigned short titlescreenMap[1024];

#define titlescreenPalLen 512
extern const unsigned short titlescreenPal[256];

#endif // GRIT_TITLESCREEN_H

//}}BLOCK(titlescreen)
