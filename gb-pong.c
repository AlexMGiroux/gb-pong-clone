#include <stdio.h>
#include <stdbool.h>
#include <gb/gb.h>
#include "sprites.c"

void updateScore(int yourScore, int oppScore);
void bounceSound();
void fiveDingsSound();

void main()
{    
    NR52_REG = 0x80; // Audio master control - Audio on
    NR50_REG = 0x77; // Master volume & VIN panning - set left and right channel to max volume
    NR51_REG = 0xFF; // Sound panning - all channels, left and right
    
    int yourScore = 0;
    int oppScore = 0;
    updateScore(yourScore, oppScore);

    // Intial direction of ball
    bool ballRight = TRUE;
    bool ballUp = TRUE;
    
    // Initial position of player paddle (left)
    int x = 12;
    int y = 75;

    // Initial position of opponent paddle (right)
    int oppx = 156;
    int oppy = 75;

    // Initial position of ball
    int ballx = 85;
    int bally = 75;

    SPRITES_8x16;
    set_sprite_data(0, 8, paddle);
    set_sprite_tile(0, 0);
    move_sprite(0, x, y);
    set_sprite_tile(1, 6);
    move_sprite(1, x, y+16);

    set_sprite_tile(2, 0);
    move_sprite(2, oppx, oppy);
    set_sprite_tile(3, 6);
    move_sprite(3, oppx, oppy+16);

    set_sprite_data(10, 1, ball);
    set_sprite_data(0x0B, 1, clear);
    set_sprite_tile(4, 0x0A);

    move_sprite(4, ballx, bally);
    SHOW_SPRITES;

    // Main game Loop
    while(1)
    {
        // Move ball according to current direction
        if (ballRight)
        {
            ballx++;
            move_sprite(4, ballx, bally);
        }
        else
        {
            ballx--;
            move_sprite(4, ballx, bally);
        }

        if (ballUp)
        {
            bally -= 2;
            move_sprite(4, ballx, bally);
        }
        else
        {
            bally += 2;
            move_sprite(4, ballx, bally);
        }

        // Ball crosses opponent paddle x-position going right
        if(ballx > oppx - 6)
        {
            // Bounces if aligned with part of the paddle
            if(bally < oppy + 30 && bally > oppy - 8)
            {
                ballRight = FALSE;
                bounceSound();
            }

            // Otherwise scores
            else
            {
                ballx = 85;
                bally = 75;
                yourScore++;
                ballRight = !ballRight;

                fiveDingsSound();
                updateScore(yourScore, oppScore);
            }
        }

        // Ball crosses player paddle x-position going left
        else if(ballx < x + 6)
        {
            // Bounces if aligned with part of the paddle
            if(bally < y + 30 && bally > y - 8)
            {
                ballRight = TRUE;
                bounceSound();
            }

            // Otherwise scores
            else
            {
                ballx = 85;
                bally = 75;
                oppScore++;
                ballRight = !ballRight;

                fiveDingsSound();
                updateScore(yourScore, oppScore);
            }
        }

        // Ball ricochets off ceiling and floor of screen
        if(bally < 20)
        {
            ballUp = FALSE;
        }
        else if(bally > 140)
        {
            ballUp = TRUE;
        }

        // Opponent paddle chases ball up and down
        if (bally > oppy)
        {
            if (ballx > (95))
            {
                oppy++;
                move_sprite(2, oppx, oppy);
                move_sprite(3, oppx, oppy + 16);
            }

            else
            {
                 if (oppy < 75)
                 {
                     oppy++;
                 }
                
                 if (oppy > 75)
                 {
                     oppy--;
                 }

                move_sprite(2, oppx, oppy);
                move_sprite(3, oppx, oppy+16);
            }
        }

        else if (bally < oppy)
        {
            if (ballx > (95))
            {
                oppy--;
                move_sprite(2, oppx, oppy);
                move_sprite(3, oppx, oppy+16);
            }

            else
            {
                if (oppy < 75)
                 {
                     oppy++;
                 }
                
                 if (oppy > 75)
                 {
                     oppy--;
                 }

                move_sprite(2, oppx, oppy);
                move_sprite(3, oppx, oppy+16);
            }
        }
        
        // Control of player paddle with UP and DOWN buttons
        if(joypad() == J_UP && y > 20)
        {
            y--;
            y--;
            move_sprite(0, x, y);
            move_sprite(1, x, y+16);
        }

        if(joypad() == J_DOWN && y < 120)
        {
            y++;
            y++;
            move_sprite(0, x, y);
            move_sprite(1, x, y+16);
     
        }
        
        delay(15);
    }
}

void updateScore(int yourScore, int oppScore)
{
    printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    printf(" %d               %d\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", yourScore, oppScore);
}

void bounceSound()
{
    NR10_REG = 0x7E;
    NR11_REG = 0xC1;
    NR12_REG = 0x66;
    NR13_REG = 0x7C;
    NR14_REG = 0xC6;
}

void fiveDingsSound()
{
    for(int i = 0; i < 5; i++)
    {
        NR21_REG = 0x81;
        NR22_REG = 0xA6;
        NR23_REG = 0x37;
        NR24_REG = 0x87;
        delay(180);
    }
}