
//{{BLOCK(winscreen)

//======================================================================
//
//	winscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 81 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2592 + 2048 = 5152
//
//	Time-stamp: 2017-03-09, 21:08:47
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define winscreenTilesLen 2592
extern const unsigned short winscreenTiles[1296];

#define winscreenMapLen 2048
extern const unsigned short winscreenMap[1024];

#define winscreenPalLen 512
extern const unsigned short winscreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(winscreen)
