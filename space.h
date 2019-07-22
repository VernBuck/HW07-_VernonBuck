
//{{BLOCK(space)

//======================================================================
//
//	space, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 3274 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 104768 + 8192 = 113472
//
//	Time-stamp: 2017-03-09, 10:56:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPACE_H
#define GRIT_SPACE_H

#define spaceTilesLen 104768
extern const unsigned short spaceTiles[52384];

#define spaceMapLen 8192
extern const unsigned short spaceMap[4096];

#define spacePalLen 512
extern const unsigned short spacePal[256];

#endif // GRIT_SPACE_H

//}}BLOCK(space)
