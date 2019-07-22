
//{{BLOCK(pausescreen)

//======================================================================
//
//	pausescreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 91 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2912 + 2048 = 5472
//
//	Time-stamp: 2017-03-09, 14:42:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCREEN_H
#define GRIT_PAUSESCREEN_H

#define pausescreenTilesLen 2912
extern const unsigned short pausescreenTiles[1456];

#define pausescreenMapLen 2048
extern const unsigned short pausescreenMap[1024];

#define pausescreenPalLen 512
extern const unsigned short pausescreenPal[256];

#endif // GRIT_PAUSESCREEN_H

//}}BLOCK(pausescreen)
