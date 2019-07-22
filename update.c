#include "main.h"
#include "myLib.h"
#include "update.h"

/*
 * int reload = 20
 * if (reload > 0) {
	reload--;
 }
 if (reload == 0) {
	reload = 20;
 }
*/

//Checks enemy and bullet collision
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
//player collision
int playerCollision(BULLET* b, PLAYER* p)
{
	if(b->col <= p->col + p->width && b->col + b->width >= p->col && b->row + b->height >= p->row && b->row <= p ->row + p-> height) {
		b -> active = !(b -> active);
		return 1;
	}
	return 0;
}

//Items below are going into a seperate document
//Moves player and allows player to fire
void updatePlayer(PLAYER* p) {
	if(BUTTON_HELD(BUTTON_RIGHT)) {
		if (p -> col < 240 - p -> width) {
			p->col++;
		}
	}
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if (p -> col > 0) {
			p->col--;
		}
	}
}

// Actively changes bullet location
void updateBullet(BULLET* b, PLAYER* p) {
	if(b->active) {
		b->row = b->row - 1;
		if(b->row < 0) {
			b -> active = !(b -> active);
			//resets bullet location
			b -> row = p -> row - 10;
			b -> col = p -> col;
		}
	} 
	if(!b -> active) {
		b -> row = p -> row - 10;
		b -> col = p -> col;
	}
}

//checks to see if enemy bullet hit the bottom of the map
void updateBulletEnemy(BULLET* b, int d, int c) {
	if(b->active) {
		b->row = b->row + 1;
		if(b->row > 240) {
			b -> active = !(b -> active);
			//resets bullet location
			b -> row = c;
			b -> col = d;
		}
	} 
}

// This is the movement pattern that each and every alien will use
// I'll have to modify this so that the right most alien determines the movement pattern!
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