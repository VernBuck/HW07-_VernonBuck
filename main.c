#include "myLib.h"
#include "space.h"
#include "spritesheetfix.h"
#include "main.h"
#include "update.h"
#include <stdlib.h>
#include "titlescreen.h"
#include "pausescreen.h"
#include "losescreen.h"
#include "winscreen.h"

unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

#define ROWMASK 0xFF
#define COLMASK 0x1FF

// same as bullet num
int bulletCount;
int num = 0;
// Values to put into the shadowOAM
enum {PLAYERSPRITE, BULLETSPRITE, ENEMYSPRITE = BULLETNUM + 1, ENEMYBULLET = 26, LIFE = 28, SCORE = 29};

//game states

enum { STARTSCREEN, GAMESCREEN, LOSESCREEN, WINSCREEN, PAUSESCREEN};
int state;

// player item ship
PLAYER pship;
BULLET pBullet[BULLETNUM];
ENEMY pAlien[ENEMYNUM];
BULLET aBullet[BULLETNUME];
LIVES l;

int score = 0;
int lives = 3;

// animationcounter
int anicounter;

// sprite variation
int diffSprite;

int main()
{
	goToStart();
        
	while(1)
	{
		oldButtons = buttons;
        buttons = BUTTONS;
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
//******************************** game states*****************************
void goToStart() {
	REG_DISPCTL = MODE0|BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE1;
	REG_BG0VOFS = 0;
	REG_BG0HOFS = 0;
	loadPalette(titlescreenPal); 
	DMANow(3, titlescreenTiles, &CHARBLOCKBASE[0], titlescreenTilesLen/2);
	DMANow(3, titlescreenMap, &SCREENBLOCKBASE[31], titlescreenMapLen /2);
    state = STARTSCREEN;
}

void updateStart() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		initialize(); 
		goToGame();
	}
}

void goToGame() {
	REG_DISPCTL = MODE0 |BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE1;
	REG_BG0VOFS = 0;
	loadPalette(spacePal); 
	DMANow(3, spaceTiles, &CHARBLOCKBASE[0], spaceTilesLen/2);
	DMANow(3, spaceMap, &SCREENBLOCKBASE[31], spaceMapLen /2);
	DMANow(3, spritesheetfixTiles, &CHARBLOCKBASE[4], spritesheetfixTilesLen/2);
	DMANow(3,  spritesheetfixPal, SPRITE_PALETTE, spritesheetfixPalLen/2);
    hideSprites();
	state = GAMESCREEN;
}

void updateGame() {
	if(BUTTON_PRESSED(BUTTON_START)) {
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
	REG_DISPCTL = MODE0 |BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE1;
	REG_BG0VOFS = 0;
	loadPalette(pausescreenPal); 
	DMANow(3, pausescreenTiles, &CHARBLOCKBASE[0], pausescreenTilesLen/2);
	DMANow(3, pausescreenMap, &SCREENBLOCKBASE[31], pausescreenMapLen /2);
	state = PAUSESCREEN;
}

void updatePause() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		hideSprites();
		initialize();
		goToStart();
	}
}

void goToLose() {
	vOff = 0;
	REG_DISPCTL = MODE0 |BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE1;
	REG_BG0VOFS = 0;
	loadPalette(losescreenPal); 
	DMANow(3, losescreenTiles, &CHARBLOCKBASE[0], losescreenTilesLen/2);
	DMANow(3, losescreenMap, &SCREENBLOCKBASE[31], losescreenMapLen /2);
	state = LOSESCREEN;
}

void updateLose() {
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		hideSprites();
		initialize();
		goToStart();
	}
}

void goToWin() {
	vOff = 0;
	REG_DISPCTL = MODE0 |BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE1;
	REG_BG0VOFS = 0;
	loadPalette(winscreenPal); 
	DMANow(3, winscreenTiles, &CHARBLOCKBASE[0], winscreenTilesLen/2);
	DMANow(3, winscreenMap, &SCREENBLOCKBASE[31], winscreenMapLen /2);
	state = LOSESCREEN;
}

void updateWin() {
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		hideSprites();
		initialize();
		goToStart();
	}
}
/**********************************************************/
void shadowset() {
		vOff--;
        REG_BG0HOFS = hOff;
        REG_BG0VOFS = vOff;

        update();
		if(score < 10) {
			shadowOAM[SCORE + 1].attr0 = 140 | ATTR0_TALL;
			shadowOAM[SCORE + 1].attr1 = ATTR1_SIZE8 | 190;
			shadowOAM[SCORE + 1].attr2 = SPRITEOFFSET16(3,11 + score);

			shadowOAM[SCORE + 2].attr0 = 140 | ATTR0_TALL;
			shadowOAM[SCORE + 2].attr1 = ATTR1_SIZE8 | 180;
			shadowOAM[SCORE + 2].attr2 = SPRITEOFFSET16(3,11);

		} else if(score < 20) {
			shadowOAM[SCORE + 1].attr0 = 140 | ATTR0_TALL;
			shadowOAM[SCORE + 1].attr1 = ATTR1_SIZE8 | 190;
			shadowOAM[SCORE + 1].attr2 = SPRITEOFFSET16(3,11 + score%10);

			shadowOAM[SCORE + 2].attr0 = 140 | ATTR0_TALL;
			shadowOAM[SCORE + 2].attr1 = ATTR1_SIZE8 | 180;
			shadowOAM[SCORE + 2].attr2 = SPRITEOFFSET16(3,12);
		}
			 
        //draws player lives
        shadowOAM[LIFE].attr0 = 140 | ATTR0_TALL;
		shadowOAM[LIFE].attr1 = ATTR1_SIZE8 | 20;
		if (lives == 3) {
			shadowOAM[LIFE].attr2 = SPRITEOFFSET16(3,14); 
		} else if (lives == 2) {
			shadowOAM[LIFE].attr2 = SPRITEOFFSET16(3,13); 
		} else {
			shadowOAM[LIFE].attr2 = SPRITEOFFSET16(3,12); 
		}

        //draws player sprite
		shadowOAM[PLAYERSPRITE].attr0 = pship.row;
		shadowOAM[PLAYERSPRITE].attr1 = ATTR1_SIZE16 | pship.col;
		shadowOAM[PLAYERSPRITE].attr2 = SPRITEOFFSET16(0,0); 

		//draws enemy bullet
		for(int i = 0; i < BULLETNUME; i++) {
			if(!(aBullet[i].active)) {
				shadowOAM[ENEMYBULLET + i].attr0 = aBullet[i].row | ATTR0_TALL|ATTR0_HIDE;
				shadowOAM[ENEMYBULLET + i].attr1 = ATTR1_SIZE8 | aBullet[i].col;
				shadowOAM[ENEMYBULLET + i].attr2 = SPRITEOFFSET16(0,3);
			} 
			if((aBullet[i].active)) {
				shadowOAM[ENEMYBULLET + i].attr0 = aBullet[i].row | ATTR0_TALL;
				shadowOAM[ENEMYBULLET + i].attr1 = ATTR1_SIZE8 | aBullet[i].col;
				shadowOAM[ENEMYBULLET + i].attr2 = SPRITEOFFSET16(0,3);
			}
		}

		//draws player bullet
		for(int i = 0; i < BULLETNUM; i++) {
			if(!(pBullet[i].active)) {
				shadowOAM[BULLETSPRITE + i].attr0 = pBullet[i].row | ATTR0_TALL|ATTR0_HIDE;
				shadowOAM[BULLETSPRITE + i].attr1 = ATTR1_SIZE8 | pBullet[i].col;
				shadowOAM[BULLETSPRITE + i].attr2 = SPRITEOFFSET16(0,3);
			} 
			if((pBullet[i].active)) {
				shadowOAM[BULLETSPRITE + i].attr0 = pBullet[i].row | ATTR0_TALL;
				shadowOAM[BULLETSPRITE + i].attr1 = ATTR1_SIZE8 | pBullet[i].col;
				shadowOAM[BULLETSPRITE + i].attr2 = SPRITEOFFSET16(0,3);
			}
		}
		
		//draws enemy sprite 
		for(int j = 0; j < ENEMYNUM; j++) {
			if(!(pAlien[j].dead)) {
			 	shadowOAM[ENEMYSPRITE + j].attr0 = pAlien[j].row;
				shadowOAM[ENEMYSPRITE + j].attr1 = ATTR1_SIZE16 | pAlien[j].col;
				if(diffSprite / 4 == 0) {
					if(pAlien[j].animation) {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,5);
					} else {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,8);
					}
				} else if (diffSprite / 8 == 0) {
					if(pAlien[j].animation) {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,10);
					} else {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,13);
					}
				} else if(diffSprite / 12 <= 1) {
					if(pAlien[j].animation) {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(3,5);
					} else {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(3,8);
					}
				} else if (diffSprite / 16 <= 1) {
					if(pAlien[j].animation) {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,5);
					} else {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,8);
					}
				} else {
					if(pAlien[j].animation) {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,10);
					} else {
						shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,13);
					}
				}

				diffSprite++;
		 	} else {
		 		shadowOAM[ENEMYSPRITE + j].attr0 = pAlien[j].row|ATTR0_HIDE;
				shadowOAM[ENEMYSPRITE + j].attr1 = ATTR1_SIZE16 | pAlien[j].col;
				if(pAlien[j].animation) {
					shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,5);
				} else {
					shadowOAM[ENEMYSPRITE + j].attr2 = SPRITEOFFSET16(0,8);
				}
		 	}
		}
		
		diffSprite = 0;
		DMANow(3, shadowOAM, OAM, 128*4);

		waitForVblank();        
		
	}

//Makes sprites invisible
void hideSprites()
{
    for(int i = 0; i < 128; i++) {
    	shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

//Sets all of the values for the sprites used
void initialize()
{   
	//player lives and score
	lives = 3;
	score = 0;
	//ship starting location
	pship.height = 16;
	pship.width = 16;
	pship.row = 144;
	pship.col = 120;

	//Pooling player bullets
	for(int x = 0; x < BULLETNUM; x++) {
		pBullet[x].height = 8;
		pBullet[x].width = 8;
		pBullet[x].col = pship.col;
		pBullet[x].row = pship.row - 10;
		pBullet[x].active = 0;
	}

	//Pooling enemy bullets
	for(int y = 0; y < BULLETNUME; y++) {
		aBullet[y].height = 8;
		aBullet[y].width = 8;
		aBullet[y].col = enemyCol();
		aBullet[y].row = enemyRow();
		aBullet[y].active = 0;
	}

	//alien starting locations
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

//fire player bullet
void fireBullet() {
	for(int i = 0; i < BULLETNUM; i++) {
   		BULLET * b = &pBullet[i];
   		if(!(b -> active)) {
   			b -> active = 1;
			b -> col = pship.col;
			b -> row = pship.row - 10;
   			break;
   		}
	}
}

//fire enemy bullet
void fireBullet2(ENEMY* p) {
	for(int i = 0; i < BULLETNUM; i++) {
   		BULLET * b = &aBullet[i];
   		if(!(b -> active) && !(p -> dead)) {
   			b -> active = 1;
			b -> col = p -> col;
			b -> row = p -> row;
   			break;
   		}
	}
}

//Updates player location, alien location, and pools bullets
void update() {
	fireBullet2(&pAlien[rand()%ENEMYNUM]);
	updatePlayer(&pship);
	for(int y = 0; y < BULLETNUM; y++) {
		for(int z = 0; z < ENEMYNUM; z++) {
			score = score + collisionCheckObstacleTarget(&pBullet[y], &pAlien[z]);
		}
	}
	for(int i = 0; i< BULLETNUME; i++) {
		updateBulletEnemy(&aBullet[i], pAlien[rand()%ENEMYNUM].col, pAlien[rand()%ENEMYNUM].row);
		lives = lives - playerCollision(&aBullet[i], &pship);
	}
	for(int i = 0; i< BULLETNUM; i++) {
		updateBullet(&pBullet[i], &pship);
	}
	if(BUTTON_PRESSED(BUTTON_A)) {
		fireBullet();
	}
	for(int j = 0; j < ENEMYNUM; j++) {
		updateAlien(&pAlien[j]);
	}
	//if the aliens hit the ground go to lose state
	for(int t = 0; t < ENEMYNUM; t++) {
		if(!(pAlien[t].dead)) {
			if(pAlien[t].row >= 150) {
				goToLose();
			}
		}
	}

	//Responsible for animations
	anicounter++;
	if(anicounter % 2 == 0) {
		for(int j = 0; j < ENEMYNUM; j++) {
			pAlien[j].animation = !(pAlien[j].animation);
		}
	}
}

int enemyCol() {
	int ran = pAlien[rand()%ENEMYNUM].col;
	if(!(pAlien[ran].dead)) {
		return ran;
	} else {
		return 0;
	}
}

int enemyRow() {
	int ran = pAlien[rand()%ENEMYNUM].row;
	if(!(pAlien[ran].dead)) {
		return ran;
	} else {
		return 0;
	}
}