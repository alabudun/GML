#define AI_MeleeTry
if(distance_to_object(enemy)<=reach && attack=0){
    attack=melee_delay;
    image_index=0;
    sprite_index=anim_melee;
    
    direction=point_direction(x,y,enemy.x,enemy.y);
}

#define AI_MeleeOn
if(attack>melee_agility && tu>=1){
    tu-=1;
    attack-=melee_agility;
    image_speed=melee_agility;
}

#define AI_MeleeOut
if(attack<=melee_agility && tu>=1 && sprite_index=anim_melee){
    atk_x=x+lengthdir_x(reach,direction);
    atk_y=y+lengthdir_y(reach,direction);

    if(unit_owner=1)
        target=instance_nearest(atk_x,atk_y,o_unit2);
    else
        target=instance_nearest(atk_x,atk_y,o_unit1);

    attack=0;
    tu-=1;

    if(point_distance(atk_x,atk_y,target.x,target.y)<sweep){
        ddealt=(melee+random(20.99)-10)-(target.defence+random(15.99)-10);
    
        if(ddealt>0)
        target.hp-=ddealt;
        
    }

    sprite_index=anim_move;
    image_index=0;
}

#define AI_Movement
if(tu>=1 && attack=0){
    if(unit_owner=1)
        target=instance_nearest(enemy.x,enemy.y,o_unit2);
    else
        target=instance_nearest(enemy.x,enemy.y,o_unit1);
    
    mp_potential_step(target.x, target.y,glide_speed,0);
    tu-=1;
    image_speed=glide_speed/4;
}

#define Set_Shared
image_speed=0;
sprite_index=anim_move;

if(unit_owner=2){
    direction=180;
    image_xscale=-1;
}

behavior=3; //-1: avoid enemy, 0:stand ground, 1:move to point, 2:move to point and fight back, 3:search and eliminate
attack=0;

atk_x=0;
atk_y=0;

ddealt=0;

tu=0;
z_index=depth;

#define Set_Unit_Stats
if(unit_type=0){/*OUTLAW SWORDSMAN*/
    hp=120+random(90.99) div 1;
    defence=random(15.99) div 1;

    glide_speed=0.8+random(0.4);

    sweep=45; //attack AoE reach
    reach=10; //melee range
    melee=25+random(15.99) div 1; //hand to hand damage
    melee_delay=6; //time needed to land an attack (frames)
    melee_agility=0.10+random(0.3);

    anim_move=s_looter_move;
    anim_melee=s_looter_attack;

    can_block=false;
break;}

if(unit_type=1){/*MERCENARY*/
    hp=160+random(80.99) div 1;
    defence=20+random(5.99) div 1;

    glide_speed=0.7+random(0.3);

    sweep=45; //attack AoE reach
    reach=10; //melee range
    melee=30+random(10.99) div 1; //hand to hand damage
    melee_delay=6; //time needed to land an attack (in frames)
    melee_agility=0.10+random(0.3); //blow performing speed

    anim_move=s_mercenary_move;
    anim_melee=s_mercenary_attack;

    can_block=false;
break;}

#define Unit_Status
if(direction>90 && direction<=270)
    image_xscale=-1;
else 
    image_xscale=1;

depth=z_index+((room_height-y) div 16)


#define reminder
/*

*/

