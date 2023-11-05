#include <stdio.h>
#include <stdbool.h>
#include <gb/gb.h>
#include "sprites.c"

void updateScore(int yourScore, int oppScore);

void main()
{    
    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;
    
    int yourScore = 0;
    int oppScore = 0;
    updateScore(yourScore, oppScore);

    bool ballRight = TRUE;
    bool ballUp = TRUE;
    
    int x = 12;
    int y = 75;

    int oppx = 156;
    int oppy = 75;

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

    while(1)
    {
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

        if(ballx > oppx - 6)
        {
            if(bally < oppy + 30 && bally > oppy - 8)
            {
                ballRight = FALSE;

                NR10_REG = 0x7E;
                NR11_REG = 0xC1;
                NR12_REG = 0x66;
                NR13_REG = 0x7C;
                NR14_REG = 0xC6;
            }
            else
            {
                ballx = 85;
                bally = 75;
                yourScore++;
                ballRight = !ballRight;

                int i;
                for(i = 0; i < 5; i++)
                {
                    NR21_REG = 0x81;
                    NR22_REG = 0xA6;
                    NR23_REG = 0x37;
                    NR24_REG = 0x87;
                    delay(180);
                }

                updateScore(yourScore, oppScore);
            }
        }
        else if(ballx < x + 6)
        {
            if(bally < y + 30 && bally > y - 8)
            {
                ballRight = TRUE;

                NR10_REG = 0x7E;
                NR11_REG = 0xC1;
                NR12_REG = 0x66;
                NR13_REG = 0x7C;
                NR14_REG = 0xC6;
            }
            else
            {
                ballx = 85;
                bally = 75;
                oppScore++;
                ballRight = !ballRight;

                int i;
                for(i = 0; i < 5; i++)
                {
                    NR21_REG = 0x81;
                    NR22_REG = 0xA6;
                    NR23_REG = 0x37;
                    NR24_REG = 0x87;
                    delay(180);
                }
                
                updateScore(yourScore, oppScore);
            }
        }

        if(bally < 20)
        {
            ballUp = FALSE;
        }
        else if(bally > 140)
        {
            ballUp = TRUE;
        }

        if (bally > oppy)
        {
            if (ballx > (95))
            {
                oppy++;
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