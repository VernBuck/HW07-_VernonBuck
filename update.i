# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
# 1 "main.h" 1




void hideSprites();

typedef struct
{
 int row;
 int col;
 int width;
    int height;
    int currFrame;
    int active;
} BULLET;

typedef struct
{
 int row;
 int col;
 int width;
    int height;
    int currFrame;
} PLAYER;

typedef struct
{
 int row;
 int col;
 int width;
    int height;
    int rightTravel;
    int currFrame;
    int dead;
    int animation;
} ENEMY;

typedef struct
{
    int row;
    int col;
} LIVES;
# 2 "update.c" 2
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 72 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 82 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 208 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 265 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 3 "update.c" 2
# 1 "update.h" 1
void updatePlayer(PLAYER* p);
void updateBullet(BULLET* b, PLAYER* p);
void updateAlien(ENEMY* p);
void updateBulletEnemy(BULLET* b, int d, int c);
void fireBullet2(ENEMY* p);
int playerCollision(BULLET* b, PLAYER* p);
# 4 "update.c" 2
# 16 "update.c"
int collisionCheckObstacleTarget(BULLET* b, ENEMY* p)
{
 if (p -> dead != 1) {
  if(b->col <= p->col + p->width && b->col + b->width >= p->col && b->row + b->height >= p->row && b->row <= p ->row + p-> height) {
   p -> dead = 1;
   b -> active = !(b -> active);
   return 1;
  }
 }
 return 0;
}

int playerCollision(BULLET* b, PLAYER* p)
{
 if(b->col <= p->col + p->width && b->col + b->width >= p->col && b->row + b->height >= p->row && b->row <= p ->row + p-> height) {
  b -> active = !(b -> active);
  return 1;
 }
 return 0;
}



void updatePlayer(PLAYER* p) {
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
  if (p -> col < 240 - p -> width) {
   p->col++;
  }
 }
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
  if (p -> col > 0) {
   p->col--;
  }
 }
}


void updateBullet(BULLET* b, PLAYER* p) {
 if(b->active) {
  b->row = b->row - 1;
  if(b->row < 0) {
   b -> active = !(b -> active);

   b -> row = p -> row - 10;
   b -> col = p -> col;
  }
 }
 if(!b -> active) {
  b -> row = p -> row - 10;
  b -> col = p -> col;
 }
}


void updateBulletEnemy(BULLET* b, int d, int c) {
 if(b->active) {
  b->row = b->row + 1;
  if(b->row > 240) {
   b -> active = !(b -> active);

   b -> row = c;
   b -> col = d;
  }
 }
}



void updateAlien(ENEMY* p) {
 if (p -> rightTravel == 1) {
  if (p -> col < 240 - p -> width) {
   p -> animation = !(p -> animation);
   p->col++;
  }
  if(p -> col == 240 - p -> width) {
   p -> row += p -> height;
   p -> rightTravel = 0;
  }
 }
 if(p -> rightTravel == 0) {
  if (p -> col > 0) {
   p -> animation = !(p -> animation);
   p->col--;
  }
  if(p -> col == 0) {
   p -> row += p -> height;
   p -> rightTravel = 1;
  }
 }
}
