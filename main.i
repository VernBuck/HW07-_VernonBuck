# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "space.h" 1
# 22 "space.h"
extern const unsigned short spaceTiles[52384];


extern const unsigned short spaceMap[4096];


extern const unsigned short spacePal[256];
# 3 "main.c" 2
# 1 "spritesheetfix.h" 1
# 21 "spritesheetfix.h"
extern const unsigned short spritesheetfixTiles[16384];


extern const unsigned short spritesheetfixPal[256];
# 4 "main.c" 2
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
# 5 "main.c" 2
# 1 "update.h" 1
void updatePlayer(PLAYER* p);
void updateBullet(BULLET* b, PLAYER* p);
void updateAlien(ENEMY* p);
void updateBulletEnemy(BULLET* b, int d, int c);
void fireBullet2(ENEMY* p);
int playerCollision(BULLET* b, PLAYER* p);
# 6 "main.c" 2
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 1 3
# 10 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 11 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/newlib.h" 1 3
# 16 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 1 3



# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 5 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 2 3
# 17 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 12 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3



# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 211 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 323 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 16 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3

# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 1 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 1 3
# 12 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 1 3






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 1 3
# 26 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;
# 36 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 8 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 2 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/lock.h" 1 3





typedef int _LOCK_T;
typedef int _LOCK_RECURSIVE_T;
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3


typedef long _off_t;







typedef int __dev_t;




typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 56 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
typedef int _ssize_t;






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 352 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 64 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 37 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 89 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 105 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 169 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                     ;
  int (* _write) (struct _reent *, void *, const char *, int)
                            ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 273 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 305 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 579 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 817 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 18 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/stdlib.h" 1 3
# 19 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 27 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 58 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
extern int __mb_cur_max;



void abort (void) __attribute__ ((noreturn));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* _compar) (const void *, const void *))



                                                         ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((noreturn));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);
long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *, const char *, size_t);
int _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *, const char *, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t wcstombs (char *, const wchar_t *, size_t);
size_t _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);
# 111 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int rand (void);
void * realloc (void * __r, size_t __size) ;



void srand (unsigned __seed);
double strtod (const char *__n, char **__end_PTR);
double _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float strtof (const char *__n, char **__end_PTR);






long strtol (const char *__n, char **__end_PTR, int __base);
long _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int system (const char *__string);
# 198 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);



extern long double strtold (const char *, char **);
extern long double wcstold (const wchar_t *, wchar_t **);



# 7 "main.c" 2
# 1 "titlescreen.h" 1
# 22 "titlescreen.h"
extern const unsigned short titlescreenTiles[6976];


extern const unsigned short titlescreenMap[1024];


extern const unsigned short titlescreenPal[256];
# 8 "main.c" 2
# 1 "pausescreen.h" 1
# 22 "pausescreen.h"
extern const unsigned short pausescreenTiles[1456];


extern const unsigned short pausescreenMap[1024];


extern const unsigned short pausescreenPal[256];
# 9 "main.c" 2
# 1 "losescreen.h" 1
# 22 "losescreen.h"
extern const unsigned short losescreenTiles[1216];


extern const unsigned short losescreenMap[1024];


extern const unsigned short losescreenPal[256];
# 10 "main.c" 2
# 1 "winscreen.h" 1
# 22 "winscreen.h"
extern const unsigned short winscreenTiles[1296];


extern const unsigned short winscreenMap[1024];


extern const unsigned short winscreenPal[256];
# 11 "main.c" 2

unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];





int bulletCount;
int num = 0;

enum {PLAYERSPRITE, BULLETSPRITE, ENEMYSPRITE = 5 + 1, ENEMYBULLET = 26, LIFE = 28, SCORE = 29};



enum { STARTSCREEN, GAMESCREEN, LOSESCREEN, WINSCREEN, PAUSESCREEN};
int state;


PLAYER pship;
BULLET pBullet[5];
ENEMY pAlien[20];
BULLET aBullet[2];
LIVES l;

int score = 0;
int lives = 3;


int anicounter;


int diffSprite;

int main()
{
 goToStart();

 while(1)
 {
  oldButtons = buttons;
        buttons = *(volatile unsigned int *)0x04000130;
  switch(state) {
         case STARTSCREEN:
          updateStart();
          break;
         case GAMESCREEN:
          updateGame();
          break;
         case PAUSESCREEN:
          updatePause();
          break;
         case LOSESCREEN:
          updateLose();
          break;
         case WINSCREEN:
          updateWin();
          break;
        }
 }

 return 0;
}

void goToStart() {
 *(unsigned short *)0x4000000 = 0|(1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 1<<14;
 *(volatile unsigned short *)0x04000012 = 0;
 *(volatile unsigned short *)0x04000010 = 0;
 loadPalette(titlescreenPal);
 DMANow(3, titlescreenTiles, &((charblock *)0x6000000)[0], 13952/2);
 DMANow(3, titlescreenMap, &((screenblock *)0x6000000)[31], 2048 /2);
    state = STARTSCREEN;
}

void updateStart() {
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  initialize();
  goToGame();
 }
}

void goToGame() {
 *(unsigned short *)0x4000000 = 0 |(1<<8) | (1 << 12);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 1<<14;
 *(volatile unsigned short *)0x04000012 = 0;
 loadPalette(spacePal);
 DMANow(3, spaceTiles, &((charblock *)0x6000000)[0], 104768/2);
 DMANow(3, spaceMap, &((screenblock *)0x6000000)[31], 8192 /2);
 DMANow(3, spritesheetfixTiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, spritesheetfixPal, ((unsigned short*)(0x5000200)), 512/2);
    hideSprites();
 state = GAMESCREEN;
}

void updateGame() {
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToPause();
 }
 if(lives == 0) {
  goToLose();
 }
 if (score == 20) {
  goToWin();
 }
 shadowset();
}

void goToPause() {
 vOff = 0;
 *(unsigned short *)0x4000000 = 0 |(1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 1<<14;
 *(volatile unsigned short *)0x04000012 = 0;
 loadPalette(pausescreenPal);
 DMANow(3, pausescreenTiles, &((charblock *)0x6000000)[0], 2912/2);
 DMANow(3, pausescreenMap, &((screenblock *)0x6000000)[31], 2048 /2);
 state = PAUSESCREEN;
}

void updatePause() {
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToGame();
 }
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  hideSprites();
  initialize();
  goToStart();
 }
}

void goToLose() {
 vOff = 0;
 *(unsigned short *)0x4000000 = 0 |(1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 1<<14;
 *(volatile unsigned short *)0x04000012 = 0;
 loadPalette(losescreenPal);
 DMANow(3, losescreenTiles, &((charblock *)0x6000000)[0], 2432/2);
 DMANow(3, losescreenMap, &((screenblock *)0x6000000)[31], 2048 /2);
 state = LOSESCREEN;
}

void updateLose() {
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  hideSprites();
  initialize();
  goToStart();
 }
}

void goToWin() {
 vOff = 0;
 *(unsigned short *)0x4000000 = 0 |(1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 1<<14;
 *(volatile unsigned short *)0x04000012 = 0;
 loadPalette(winscreenPal);
 DMANow(3, winscreenTiles, &((charblock *)0x6000000)[0], 2592/2);
 DMANow(3, winscreenMap, &((screenblock *)0x6000000)[31], 2048 /2);
 state = LOSESCREEN;
}

void updateWin() {
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  hideSprites();
  initialize();
  goToStart();
 }
}

void shadowset() {
  vOff--;
        *(volatile unsigned short *)0x04000010 = hOff;
        *(volatile unsigned short *)0x04000012 = vOff;

        update();
  if(score < 10) {
   shadowOAM[SCORE + 1].attr0 = 140 | (2 << 14);
   shadowOAM[SCORE + 1].attr1 = (0 << 14) | 190;
   shadowOAM[SCORE + 1].attr2 = (3)*32+(11 + score);

   shadowOAM[SCORE + 2].attr0 = 140 | (2 << 14);
   shadowOAM[SCORE + 2].attr1 = (0 << 14) | 180;
   shadowOAM[SCORE + 2].attr2 = (3)*32+(11);

  } else if(score < 20) {
   shadowOAM[SCORE + 1].attr0 = 140 | (2 << 14);
   shadowOAM[SCORE + 1].attr1 = (0 << 14) | 190;
   shadowOAM[SCORE + 1].attr2 = (3)*32+(11 + score%10);

   shadowOAM[SCORE + 2].attr0 = 140 | (2 << 14);
   shadowOAM[SCORE + 2].attr1 = (0 << 14) | 180;
   shadowOAM[SCORE + 2].attr2 = (3)*32+(12);
  }


        shadowOAM[LIFE].attr0 = 140 | (2 << 14);
  shadowOAM[LIFE].attr1 = (0 << 14) | 20;
  if (lives == 3) {
   shadowOAM[LIFE].attr2 = (3)*32+(14);
  } else if (lives == 2) {
   shadowOAM[LIFE].attr2 = (3)*32+(13);
  } else {
   shadowOAM[LIFE].attr2 = (3)*32+(12);
  }


  shadowOAM[PLAYERSPRITE].attr0 = pship.row;
  shadowOAM[PLAYERSPRITE].attr1 = (1 << 14) | pship.col;
  shadowOAM[PLAYERSPRITE].attr2 = (0)*32+(0);


  for(int i = 0; i < 2; i++) {
   if(!(aBullet[i].active)) {
    shadowOAM[ENEMYBULLET + i].attr0 = aBullet[i].row | (2 << 14)|(2 << 8);
    shadowOAM[ENEMYBULLET + i].attr1 = (0 << 14) | aBullet[i].col;
    shadowOAM[ENEMYBULLET + i].attr2 = (0)*32+(3);
   }
   if((aBullet[i].active)) {
    shadowOAM[ENEMYBULLET + i].attr0 = aBullet[i].row | (2 << 14);
    shadowOAM[ENEMYBULLET + i].attr1 = (0 << 14) | aBullet[i].col;
    shadowOAM[ENEMYBULLET + i].attr2 = (0)*32+(3);
   }
  }


  for(int i = 0; i < 5; i++) {
   if(!(pBullet[i].active)) {
    shadowOAM[BULLETSPRITE + i].attr0 = pBullet[i].row | (2 << 14)|(2 << 8);
    shadowOAM[BULLETSPRITE + i].attr1 = (0 << 14) | pBullet[i].col;
    shadowOAM[BULLETSPRITE + i].attr2 = (0)*32+(3);
   }
   if((pBullet[i].active)) {
    shadowOAM[BULLETSPRITE + i].attr0 = pBullet[i].row | (2 << 14);
    shadowOAM[BULLETSPRITE + i].attr1 = (0 << 14) | pBullet[i].col;
    shadowOAM[BULLETSPRITE + i].attr2 = (0)*32+(3);
   }
  }


  for(int j = 0; j < 20; j++) {
   if(!(pAlien[j].dead)) {
     shadowOAM[ENEMYSPRITE + j].attr0 = pAlien[j].row;
    shadowOAM[ENEMYSPRITE + j].attr1 = (1 << 14) | pAlien[j].col;
    if(diffSprite / 4 == 0) {
     if(pAlien[j].animation) {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(5);
     } else {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(8);
     }
    } else if (diffSprite / 8 == 0) {
     if(pAlien[j].animation) {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(10);
     } else {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(13);
     }
    } else if(diffSprite / 12 <= 1) {
     if(pAlien[j].animation) {
      shadowOAM[ENEMYSPRITE + j].attr2 = (3)*32+(5);
     } else {
      shadowOAM[ENEMYSPRITE + j].attr2 = (3)*32+(8);
     }
    } else if (diffSprite / 16 <= 1) {
     if(pAlien[j].animation) {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(5);
     } else {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(8);
     }
    } else {
     if(pAlien[j].animation) {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(10);
     } else {
      shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(13);
     }
    }

    diffSprite++;
    } else {
     shadowOAM[ENEMYSPRITE + j].attr0 = pAlien[j].row|(2 << 8);
    shadowOAM[ENEMYSPRITE + j].attr1 = (1 << 14) | pAlien[j].col;
    if(pAlien[j].animation) {
     shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(5);
    } else {
     shadowOAM[ENEMYSPRITE + j].attr2 = (0)*32+(8);
    }
    }
  }

  diffSprite = 0;
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

  waitForVblank();

 }


void hideSprites()
{
    for(int i = 0; i < 128; i++) {
     shadowOAM[i].attr0 = (2 << 8);
    }
}


void initialize()
{

 lives = 3;
 score = 0;

 pship.height = 16;
 pship.width = 16;
 pship.row = 144;
 pship.col = 120;


 for(int x = 0; x < 5; x++) {
  pBullet[x].height = 8;
  pBullet[x].width = 8;
  pBullet[x].col = pship.col;
  pBullet[x].row = pship.row - 10;
  pBullet[x].active = 0;
 }


 for(int y = 0; y < 2; y++) {
  aBullet[y].height = 8;
  aBullet[y].width = 8;
  aBullet[y].col = enemyCol();
  aBullet[y].row = enemyRow();
  aBullet[y].active = 0;
 }


 for(int i = 0; i < 4; i++) {
  for(int j = 0; j < 5; j++) {
   pAlien[num].height = 16;
   pAlien[num].width = 16;
   pAlien[num].row = j * 15;
   pAlien[num].col = i * 30;
   pAlien[num].rightTravel = 1;
   pAlien[num].dead = 0;
   pAlien[num].animation = 0;
   num++;
  }
 }

 hOff = 0;
 vOff = 0;

}


void fireBullet() {
 for(int i = 0; i < 5; i++) {
     BULLET * b = &pBullet[i];
     if(!(b -> active)) {
      b -> active = 1;
   b -> col = pship.col;
   b -> row = pship.row - 10;
      break;
     }
 }
}


void fireBullet2(ENEMY* p) {
 for(int i = 0; i < 5; i++) {
     BULLET * b = &aBullet[i];
     if(!(b -> active) && !(p -> dead)) {
      b -> active = 1;
   b -> col = p -> col;
   b -> row = p -> row;
      break;
     }
 }
}


void update() {
 fireBullet2(&pAlien[rand()%20]);
 updatePlayer(&pship);
 for(int y = 0; y < 5; y++) {
  for(int z = 0; z < 20; z++) {
   score = score + collisionCheckObstacleTarget(&pBullet[y], &pAlien[z]);
  }
 }
 for(int i = 0; i< 2; i++) {
  updateBulletEnemy(&aBullet[i], pAlien[rand()%20].col, pAlien[rand()%20].row);
  lives = lives - playerCollision(&aBullet[i], &pship);
 }
 for(int i = 0; i< 5; i++) {
  updateBullet(&pBullet[i], &pship);
 }
 if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  fireBullet();
 }
 for(int j = 0; j < 20; j++) {
  updateAlien(&pAlien[j]);
 }

 for(int t = 0; t < 20; t++) {
  if(!(pAlien[t].dead)) {
   if(pAlien[t].row >= 150) {
    goToLose();
   }
  }
 }


 anicounter++;
 if(anicounter % 2 == 0) {
  for(int j = 0; j < 20; j++) {
   pAlien[j].animation = !(pAlien[j].animation);
  }
 }
}

int enemyCol() {
 int ran = pAlien[rand()%20].col;
 if(!(pAlien[ran].dead)) {
  return ran;
 } else {
  return 0;
 }
}

int enemyRow() {
 int ran = pAlien[rand()%20].row;
 if(!(pAlien[ran].dead)) {
  return ran;
 } else {
  return 0;
 }
}
