#define BULLETNUM 5
#define ENEMYNUM 20
#define BULLETNUME 2
//Prototypes
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